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
#
# Reads raw Typst content from stdin, processes these schemas in order:
#   1. `https://` URLs     ->  downloaded files (via curl, cached)
#   2. `smiles://` strings ->  rendered SVG files (via smiles.mjs)
#   3. `figures://` labels ->  downloaded files (via curl, cached,
#                              looked up in pictures.yaml)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

REMOTE_DOWNLOADS="download"
CACHE_DIR="$ROOT/.cache/figures"
PICTURES="$ROOT/pictures.yaml"
SMILES_DIR="$ROOT/.pipeline/smiles"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --downloads) REMOTE_DOWNLOADS="$2"; shift 2 ;;
    --cache)     CACHE_DIR="$2";         shift 2 ;;
    --pictures)  PICTURES="$2";          shift 2 ;;
    --smiles-dir) SMILES_DIR="$2";       shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

mkdir -p "$REMOTE_DOWNLOADS"
mkdir -p "$CACHE_DIR"

raw_content=$(cat)

get_extension() {
  local url="$1"
  local base="${url%%\?*}"
  local extension="${base##*.}"
  if [ "$extension" == "$base" ]; then
    echo ""
  else
    echo "$extension" | tr '[:upper:]' '[:lower:]'
  fi
}

is_image() {
  local mime
  [[ -s "$1" ]] || return 1
  mime=$(file --brief --mime-type -- "$1") || return 1
  [[ "$mime" == image/* ]]
}

# Only publish complete images to the shared cache.
cache_download() {
  local url="$1"
  local filename cached_file temporary_file
  filename="$(echo -n "$url" | md5sum | awk '{print $1}').$(get_extension "$url")"
  cached_file="$CACHE_DIR/$filename"

  if ! is_image "$cached_file"; then
    echo "> Downloading $url" >&2
    temporary_file=$(mktemp "$CACHE_DIR/.download.XXXXXX") || return 1
    if ! curl --fail --silent --show-error --location --connect-timeout 10 --max-time 30 \
      --retry 2 --retry-max-time 60 --output "$temporary_file" "$url" || ! is_image "$temporary_file"; then
      rm -f -- "$temporary_file"
      echo "! Failed to download an image from $url" >&2
      return 1
    fi
    if ! mv -f -- "$temporary_file" "$cached_file"; then
      rm -f -- "$temporary_file"
      return 1
    fi
  fi

  cp -- "$cached_file" "$REMOTE_DOWNLOADS/$filename" || return 1
  printf '%s/%s\n' "$REMOTE_DOWNLOADS" "$filename"
}

# Process https:// URLs (direct remote image links)
img_urls=$(echo "$raw_content" \
  | grep -o 'image("https://[^"]*' \
  | sed 's/image("//') || true

if [ -n "$img_urls" ]; then
  while IFS= read -r url; do
    if [ -n "$url" ]; then
      img_path=$(cache_download "$url") || exit 1
      raw_content=${raw_content//"image(\"$url\""/"image(\"$img_path\""}
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
    if [ ! -f "$PICTURES" ]; then
      echo "! Missing image registry: $PICTURES" >&2
      exit 1
    fi
    urls=$(FIGURE_LABEL="$label" yq -r '.pictures[strenv(FIGURE_LABEL)][]' "$PICTURES")
    img_path=""
    while IFS= read -r fig_url; do
      if [[ -n "$fig_url" ]] && img_path=$(cache_download "$fig_url"); then
        break
      fi
    done <<< "$urls"
    if [[ -z "$img_path" ]]; then
      echo "! No readable image for figures://$label in $PICTURES" >&2
      exit 1
    fi
    raw_content=${raw_content//"image(\"figures://$label\""/"image(\"$img_path\""}
  done <<< "$figures"
fi

echo "$raw_content"
