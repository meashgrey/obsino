#!/usr/bin/env bash

# process-content.sh — Transform raw Typst content by resolving external
# resources (remote images, SMILES molecular structures, figures:// labels)
# into locally-downloaded assets.
#
# Usage: process-content.sh [options] < raw_content.txt > transformed.txt
#
# Options:
#   --downloads DIR     Download directory (default: download)
#   --cache DIR         Cache directory for downloaded files
#                       (default: <root>/.cache/figures)
#   --pictures FILE     Path to pictures.yaml (default: <root>/pictures.yaml)
#   --smiles-dir DIR    Smiles rendering pipeline directory
#                       (default: <root>/.pipeline/smiles)
#   --no-r2             Skip Cloudflare R2 and fetch upstream sources only
#
# Reads raw Typst content from stdin, processes these schemas in order:
#   1. `https://` URLs     ->  downloaded files
#   2. `smiles://` strings ->  rendered SVG files (via smiles.mjs)
#   3. `figures://` labels ->  downloaded files (looked up in pictures.yaml)
#
# Pictures live in a Cloudflare R2 bucket. Each lookup tries the local cache
# first, then R2, and only falls back to the upstream URL when the object is
# not stored yet. R2 access is configured through .pipeline/r2.sh:
#   - CI:      R2_ACCESS_KEY_ID + R2_SECRET_KEY (S3 API via curl)
#   - locally: an existing `wrangler login` (wrangler r2 object)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# shellcheck source=./r2.sh
source "$SCRIPT_DIR/r2.sh"
# shellcheck source=./pictures.sh
source "$SCRIPT_DIR/pictures.sh"

REMOTE_DOWNLOADS="download"
CACHE_DIR="$ROOT/.cache/figures"
PICTURES="$ROOT/pictures.yaml"
SMILES_DIR="$ROOT/.pipeline/smiles"
USE_R2=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --downloads) REMOTE_DOWNLOADS="$2"; shift 2 ;;
    --cache)     CACHE_DIR="$2";         shift 2 ;;
    --pictures)  PICTURES="$2";          shift 2 ;;
    --smiles-dir) SMILES_DIR="$2";       shift 2 ;;
    --no-r2)     USE_R2=0;               shift ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

mkdir -p "$REMOTE_DOWNLOADS"
mkdir -p "$CACHE_DIR"

if ((USE_R2)) && ! r2_authenticated; then
  echo "! No usable R2 credentials; falling back to upstream picture URLs." >&2
  echo "  Set R2_ACCESS_KEY_ID and R2_SECRET_KEY, or run 'wrangler login'." >&2
  USE_R2=0
fi

raw_content=$(cat)

# Resolve one R2-stored picture into the local cache.
#
#   resolve_asset <r2-key> <cache-filename> <source-url>...
#
# Returns success when the file ended up in the cache. Lookup order: local
# cache, R2 object, then each upstream source URL in order.
resolve_asset() {
  local key="$1" filename="$2"
  shift 2
  local cached="$CACHE_DIR/$filename"

  if [[ -s "$cached" ]]; then
    if pictures_looks_like_image "$cached" "$filename"; then
      echo "> Using cached $filename" >&2
      return 0
    fi
    echo "! Discarding cached $filename (not a valid image)" >&2
    rm -f "$cached"
  fi

  if ((USE_R2)); then
    if r2_get "$key" "$cached" 1; then
      if pictures_looks_like_image "$cached" "$filename"; then
        echo "> Fetched $key from R2 ($R2_BUCKET)" >&2
        return 0
      fi
      echo "! R2 object $key is not a valid image; falling back to source" >&2
      rm -f "$cached"
    fi
  fi

  local url
  for url in "$@"; do
    [[ -n "$url" ]] || continue
    echo "> Downloading $filename from $url" >&2
    if pictures_upstream_get "$url" "$cached"; then
      echo "> Downloaded $filename (not in R2 yet)" >&2
      return 0
    fi
  done

  echo "! Warning: Failed to resolve $key (tried R2 and ${#} source URL(s))" >&2
  return 1
}

# Publish a cached asset into the build directory.
stage_asset() {
  local filename="$1"
  cp -- "$CACHE_DIR/$filename" "$REMOTE_DOWNLOADS/$filename"
}

# Process https:// URLs (direct remote image links)
img_urls=$(echo "$raw_content" \
  | grep -o 'image("https://[^"]*' \
  | sed 's/image("//') || true

if [ -n "$img_urls" ]; then
  while IFS= read -r url; do
    if [ -n "$url" ]; then
      key="$(pictures_remote_key "$url")"
      img_name="$(basename "$key")"
      if resolve_asset "$key" "$img_name" "$url"; then
        stage_asset "$img_name"
        raw_content=$(echo "$raw_content" | sed "s|$url|$REMOTE_DOWNLOADS/$img_name|g")
      fi
    fi
  done <<< "$img_urls"
fi

# Process smiles:// strings (molecular structure rendering)
smiles_list=$(echo "$raw_content" \
  | grep -o 'image("smiles://[^"]*' \
  | sed 's/image("smiles:\/\///') || true

if [ -n "$smiles_list" ]; then
  while IFS= read -r smile; do
    if [ -n "$smile" ]; then
      echo "> Rendering SMILES: $smile" >&2
      pushd "$SMILES_DIR" > /dev/null
      ./smiles.mjs "$smile" >&2 || true
      structure=(structure*.svg)
      if [[ -f "${structure[0]}" ]]; then
        mv -- "${structure[0]}" "/tmp/${structure[0]}"
      fi
      popd > /dev/null
      if [ -f "/tmp/${structure[0]}" ]; then
        mv -- "/tmp/${structure[0]}" "$REMOTE_DOWNLOADS/${structure[0]}"
        echo "> Rendered $smile -> ${structure[0]}" >&2
        esc=$(echo "$smile" | sed -e 's/\\/\\\\/g' -e 's/\]/\\]/g' -e 's/\[/\\[/g' -e 's/\./\\./g' -e 's/\//\\\//g')
        echo "> Escape-filtered SMILES: $esc" >&2
        raw_content=$(echo "$raw_content" | sed "s|smiles://$esc|$REMOTE_DOWNLOADS/${structure[0]}|g")
      else
        echo "! Warning: Failed to render SMILES: $smile" >&2
      fi
    fi
  done <<< "$smiles_list"
fi

# Process figures:// labels (looked up in pictures.yaml)
figures=$(echo "$raw_content" \
  | grep -o 'image("figures://[^"]*' \
  | sed 's/image("figures:\/\///') || true

if [ -n "$figures" ]; then
  while IFS= read -r label; do
    if [ -n "$label" ]; then
      if [ ! -f "$PICTURES" ]; then
        echo "! Warning: pictures.yaml not found at $PICTURES" >&2
        continue
      fi
      urls=$(pictures_urls "$label" || true)
      if [ -z "$urls" ]; then
        echo "! Warning: No URLs found for figure label: $label in pictures.yaml" >&2
        continue
      fi

      key="$(pictures_key "$label")"
      fig_name="$(basename "$key")"

      # Reuse a legacy md5-named cache entry when it exists, so builds do not
      # refetch sources that were cached before the R2 migration.
      if [[ ! -s "$CACHE_DIR/$fig_name" ]]; then
        if legacy="$(pictures_cached_file "$CACHE_DIR" "$label")"; then
          cp -- "$legacy" "$CACHE_DIR/$fig_name"
          echo "> Migrated cached $(basename "$legacy") -> $fig_name" >&2
        fi
      fi

      if resolve_asset "$key" "$fig_name" $urls; then
        stage_asset "$fig_name"
        raw_content=$(echo "$raw_content" \
          | sed "s|figures://$label|$REMOTE_DOWNLOADS/$fig_name|g")
      else
        echo "! Warning: Failed to resolve any source for figure label: $label" >&2
      fi
    fi
  done <<< "$figures"
fi

echo "$raw_content"
