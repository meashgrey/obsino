#!/usr/bin/env bash

# Check that every picture in one or more pictures.yaml files is reachable.
#
# By default each label is checked for a stored object in the Cloudflare R2
# bucket (see .pipeline/r2.sh for credentials). Pass --upstream to probe the
# manifest's source URLs instead, which is useful before a picture is synced.
set -uo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

# shellcheck source=../.pipeline/r2.sh
source "$ROOT/.pipeline/r2.sh"
# shellcheck source=../.pipeline/pictures.sh
source "$ROOT/.pipeline/pictures.sh"

TIMEOUT=20
UPSTREAM=0

usage() {
  cat <<'EOF'
Usage: .scripts/check-pictures.sh [--timeout SECONDS] [--upstream] [pictures.yaml ...]

With no file arguments, checks the repository root's pictures.yaml. Checks R2
objects by default; --upstream probes the manifest source URLs with curl
instead. Requires Mike Farah's yq (v4).
EOF
}

while (($#)); do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    --upstream) UPSTREAM=1; shift ;;
    --timeout)
      if (($# < 2)) || [[ ! "$2" =~ ^[1-9][0-9]*$ ]]; then
        echo "--timeout requires a positive integer" >&2
        exit 2
      fi
      TIMEOUT="$2"
      shift 2
      ;;
    --) shift; break ;;
    -*) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
    *) break ;;
  esac
done

if ! command -v curl >/dev/null 2>&1; then
  echo "Required command not found: curl" >&2
  exit 2
fi
if ! command -v yq >/dev/null 2>&1; then
  echo "Required command not found: yq (Mike Farah yq v4)" >&2
  exit 2
fi

if (($#)); then
  files=("$@")
else
  files=("$ROOT/pictures.yaml")
fi

if ((${#files[@]} == 0)); then
  echo "No pictures.yaml files found" >&2
  exit 2
fi

if ((UPSTREAM)); then
  echo "→ Checking manifest source URLs"
else
  echo "→ Checking R2 objects via $(r2_backend) (bucket: $R2_BUCKET)"
fi

failures=0
checked=0

check_url() {
  local url="$1" status

  # HEAD is cheap, but some image hosts reject it. Retry with a one-byte GET.
  status="$(curl -L -sS -I -o /dev/null -w '%{http_code}' \
    --connect-timeout "$TIMEOUT" --max-time "$TIMEOUT" "$url" 2>/dev/null || true)"
  if [[ ! "$status" =~ ^2[0-9][0-9]$ ]]; then
    status="$(curl -L -sS -r 0-0 -o /dev/null -w '%{http_code}' \
      --connect-timeout "$TIMEOUT" --max-time "$TIMEOUT" "$url" 2>/dev/null || true)"
  fi

  if [[ "$status" =~ ^2[0-9][0-9]$ ]]; then
    printf 'OK      %s\n' "$status"
    return 0
  fi

  printf 'FAILED  %s\n' "${status:-network error}"
  return 1
}

for file in "${files[@]}"; do
  if [[ ! -f "$file" ]]; then
    printf 'ERROR   file not found: %s\n' "$file" >&2
    failures=$((failures + 1))
    continue
  fi

  if ((UPSTREAM)); then
    if ! entries="$(yq -er '.pictures | to_entries[] | .key as $key | .value[] | [$key, .] | @tsv' "$file" 2>/dev/null)"; then
      printf 'ERROR   cannot read pictures from %s\n' "$file" >&2
      failures=$((failures + 1))
      continue
    fi

    while IFS=$'\t' read -r key url; do
      [[ -n "$key" && -n "$url" ]] || continue
      checked=$((checked + 1))
      printf '%s  %s  ' "$file" "$key"
      if ! check_url "$url"; then
        printf '        %s\n' "$url"
        failures=$((failures + 1))
      fi
    done <<< "$entries"
    continue
  fi

  # Per-file manifests are not the repository manifest, so resolve labels
  # against the file under test rather than $PICTURES.
  PICTURES="$file"
  if ! labels="$(yq -er '.pictures | keys[]' "$file" 2>/dev/null)"; then
    printf 'ERROR   cannot read pictures from %s\n' "$file" >&2
    failures=$((failures + 1))
    continue
  fi

  while IFS= read -r label; do
    [[ -n "$label" ]] || continue
    checked=$((checked + 1))
    key="$(pictures_key "$label")"
    printf '%s  %s  ' "$file" "$label"
    if r2_head "$key" 2>/dev/null; then
      printf 'OK      %s\n' "$key"
    else
      printf 'MISSING %s\n' "$key"
      failures=$((failures + 1))
    fi
  done <<< "$labels"
done

printf '\nChecked %d picture(s); %d failed.\n' "$checked" "$failures"
((failures == 0))
