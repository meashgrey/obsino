#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
MANIFEST="$ROOT/pictures.yaml"

if ! command -v yq >/dev/null 2>&1; then
  echo "Mike Farah's yq v4 is required. Use: nix develop -c .scripts/sort-pictures.sh" >&2
  exit 1
fi

# Sort the picture labels while preserving the source list for each label.
yq eval --inplace 'sort_keys(.pictures)' "$MANIFEST"
