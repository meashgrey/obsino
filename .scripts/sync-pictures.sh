#!/usr/bin/env bash

# sync-pictures.sh — Publish picture assets to the Cloudflare R2 bucket.
#
# Usage: .scripts/sync-pictures.sh [options]
#
# Options:
#   --pictures FILE   Manifest to read (default: <root>/pictures.yaml)
#   --cache DIR       Cache directory used as the upload source
#                     (default: <root>/.cache/figures)
#   --force           Upload even when the object already exists in R2
#   --dry-run         Report what would happen without writing to R2
#   --no-r2           Only fill the local cache from upstream URLs
#   -h, --help        Show this help
#
# For every label in pictures.yaml the script makes sure
# `pictures/<label>.<ext>` exists in R2. Missing objects are built by fetching
# the upstream source URLs in manifest order. Existing objects are left alone
# unless --force is given, so the manifest stays the source of truth while R2
# keeps serving the last good bytes.
#
# R2 credentials are read from the environment by .pipeline/r2.sh:
#   CI:        R2_ACCESS_KEY_ID, R2_SECRET_KEY, [R2_ENDPOINT], [R2_BUCKET]
#   local:     an existing `wrangler login`, or the same S3 variables
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
# Allow callers (e.g. a Nix wrapper) to point at a checkout other than the one
# containing this script.
ROOT="${OBSINO_ROOT:-$(cd -- "$SCRIPT_DIR/.." && pwd)}"

# shellcheck source=../.pipeline/r2.sh
source "$ROOT/.pipeline/r2.sh"
# shellcheck source=../.pipeline/pictures.sh
source "$ROOT/.pipeline/pictures.sh"

PICTURES="$ROOT/pictures.yaml"
CACHE_DIR="$ROOT/.cache/figures"
FORCE=0
DRY_RUN=0
USE_R2=1

usage() {
  cat <<'EOF'
Usage: .scripts/sync-pictures.sh [options]

Options:
  --pictures FILE   Manifest to read (default: <root>/pictures.yaml)
  --cache DIR       Cache directory used as the upload source
                    (default: <root>/.cache/figures)
  --force           Upload even when the object already exists in R2
  --dry-run         Report what would happen without writing to R2
  --no-r2           Only fill the local cache from upstream URLs
  -h, --help        Show this help

For every label in pictures.yaml the script makes sure
`pictures/<label>.<ext>` exists in R2. Missing objects are built by fetching
the upstream source URLs in manifest order. Existing objects are left alone
unless --force is given, so the manifest stays the source of truth while R2
keeps serving the last good bytes.

R2 credentials are read from the environment by .pipeline/r2.sh:
  CI:        R2_ACCESS_KEY_ID, R2_SECRET_KEY, [R2_ENDPOINT], [R2_BUCKET]
  local:     an existing `wrangler login`, or the same S3 variables
EOF
}

while (($#)); do
  case "$1" in
    --pictures) PICTURES="$2"; shift 2 ;;
    --cache) CACHE_DIR="$2"; shift 2 ;;
    --force) FORCE=1; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    --no-r2) USE_R2=0; shift ;;
    -h | --help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

if [[ ! -f "$PICTURES" ]]; then
  echo "! pictures.yaml not found at $PICTURES" >&2
  exit 2
fi
command -v yq >/dev/null 2>&1 || {
  echo "Required command not found: yq" >&2
  exit 2
}

mkdir -p "$CACHE_DIR"

if ((USE_R2)); then
  backend="$(r2_backend)"
  echo "→ R2 backend: $backend (bucket: $R2_BUCKET)"
  if [[ "$backend" == "wrangler" ]]; then
    if ! command -v wrangler >/dev/null 2>&1; then
      echo "! Neither R2 S3 credentials nor wrangler are available; nothing to sync." >&2
      echo "  Set R2_ACCESS_KEY_ID and R2_SECRET_KEY, or run 'wrangler login'." >&2
      exit 0
    fi
    if ! r2_authenticated; then
      echo "! wrangler is not logged in; nothing to sync." >&2
      echo "  Run 'wrangler login' or set R2_ACCESS_KEY_ID and R2_SECRET_KEY." >&2
      exit 0
    fi
  fi
else
  echo "→ R2 disabled; refreshing the local cache only"
fi

uploaded=0
skipped=0
failed=0
total=0

while IFS= read -r label; do
  [[ -n "$label" ]] || continue
  total=$((total + 1))

  key="$(pictures_key "$label")"
  filename="$(basename "$key")"
  cached="$CACHE_DIR/$filename"
  mapfile -t urls < <(pictures_urls "$label" || true)

  printf '→ %-48s ' "$label"

  if ((USE_R2)) && ((!FORCE)) && r2_head "$key"; then
    printf 'already in R2 (%s)\n' "$key"
    skipped=$((skipped + 1))
    continue
  fi

  if [[ ! -s "$cached" ]]; then
    if legacy="$(pictures_cached_file "$CACHE_DIR" "$label")"; then
      cp -- "$legacy" "$cached"
    fi
  fi

  if [[ -s "$cached" ]] && ! pictures_looks_like_image "$cached" "$filename"; then
    echo "! Discarding invalid cached $filename"
    rm -f "$cached"
  fi

  if [[ ! -s "$cached" ]]; then
    fetched=0
    for url in "${urls[@]}"; do
      [[ -n "$url" ]] || continue
      if pictures_upstream_get "$url" "$cached"; then
        fetched=1
        break
      fi
    done
    if ((!fetched)); then
      printf 'FAILED (no source URL responded)\n'
      failed=$((failed + 1))
      continue
    fi
  fi

  if ((!USE_R2)); then
    printf 'cached %s\n' "$filename"
    skipped=$((skipped + 1))
    continue
  fi

  if ((DRY_RUN)); then
    printf 'would upload %s\n' "$key"
    skipped=$((skipped + 1))
    continue
  fi

  if r2_put "$cached" "$key"; then
    printf 'uploaded %s\n' "$key"
    uploaded=$((uploaded + 1))
  else
    printf 'FAILED to upload %s\n' "$key"
    failed=$((failed + 1))
  fi
done < <(yq -r '.pictures | keys[]' "$PICTURES" 2>/dev/null)

printf '\nChecked %d label(s); %d uploaded, %d skipped, %d failed.\n' \
  "$total" "$uploaded" "$skipped" "$failed"
((failed == 0))
