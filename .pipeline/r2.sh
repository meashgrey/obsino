#!/usr/bin/env bash

# r2.sh — Minimal Cloudflare R2 client shared by the picture pipeline.
#
# Source this file; it only defines functions. Two backends are supported and
# selected automatically:
#
#   s3        R2's S3 API signed with AWS SigV4 through curl. Used on CI where
#             R2_ACCESS_KEY_ID and R2_SECRET_KEY are provided as secrets.
#   wrangler  `wrangler r2 object` commands, relying on an existing local
#             login. Used on workstations.
#
# Environment:
#   R2_BUCKET         bucket name                    (default: picbed)
#   R2_ACCOUNT_ID     account id used to derive the default endpoint
#   R2_ENDPOINT       S3 endpoint, with or without scheme (overrides account)
#   R2_ACCESS_KEY_ID  S3 access key id               (enables the s3 backend)
#   R2_SECRET_KEY     S3 secret access key          (enables the s3 backend)
#   R2_BACKEND        force `s3` or `wrangler`

# shellcheck disable=SC2034
R2_BUCKET="${R2_BUCKET:-picbed}"
R2_ACCOUNT_ID="${R2_ACCOUNT_ID:-8bf7f0705467476d7879f3d87eedd860}"
R2_ENDPOINT="${R2_ENDPOINT:-https://${R2_ACCOUNT_ID}.r2.cloudflarestorage.com}"

r2_log() {
  printf '%s\n' "$*" >&2
}

# Print the backend that would be used for object access.
r2_backend() {
  if [[ -n "${R2_BACKEND:-}" ]]; then
    printf '%s' "$R2_BACKEND"
  elif [[ -n "${R2_ACCESS_KEY_ID:-}" && -n "${R2_SECRET_KEY:-}" ]]; then
    printf '%s' "s3"
  else
    printf '%s' "wrangler"
  fi
}

# Normalize R2_ENDPOINT into an https://host[:port] base URL without a trailing
# slash. A bare account id is expanded to its S3 endpoint.
r2_endpoint() {
  local endpoint="$R2_ENDPOINT"
  if [[ "$endpoint" != *.* && "$endpoint" =~ ^[0-9a-f]{32}$ ]]; then
    endpoint="https://${endpoint}.r2.cloudflarestorage.com"
  fi
  case "$endpoint" in
    *://*) ;;
    *) endpoint="https://$endpoint" ;;
  esac
  printf '%s' "${endpoint%/}"
}

# Build the object URL for a key. Object keys are URL-safe in this repository,
# so plain concatenation is enough.
r2_object_url() {
  printf '%s/%s/%s' "$(r2_endpoint)" "$R2_BUCKET" "$1"
}

r2_content_type() {
  local path="${1%%\?*}"
  local ext="${path##*.}"
  ext="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"
  case "$ext" in
    jpg | jpeg) printf 'image/jpeg' ;;
    png) printf 'image/png' ;;
    svg) printf 'image/svg+xml' ;;
    webp) printf 'image/webp' ;;
    gif) printf 'image/gif' ;;
    pdf) printf 'application/pdf' ;;
    *) printf 'application/octet-stream' ;;
  esac
}

# curl wrapper for signed S3 requests. Usage: r2_curl <curl args...>
r2_signed_curl() {
  curl -sS -L --retry 2 --retry-delay 1 \
    --connect-timeout 20 --max-time 120 \
    --aws-sigv4 "aws:amz:auto:s3" \
    --user "${R2_ACCESS_KEY_ID}:${R2_SECRET_KEY}" \
    "$@"
}

# r2_get <key> <dest> — fetch an object. Returns non-zero when it is missing.
r2_get() {
  local key="$1" dest="$2" quiet="${3:-0}"
  case "$(r2_backend)" in
    s3)
      local status
      status="$(r2_signed_curl -o "$dest" -w '%{http_code}' \
        "$(r2_object_url "$key")")" || true
      if [[ "$status" != 2* || ! -s "$dest" ]]; then
        rm -f "$dest"
        [[ "$quiet" == 1 ]] || r2_log "! R2 GET $R2_BUCKET/$key failed (HTTP ${status:-network error})"
        return 1
      fi
      ;;
    wrangler)
      if ! wrangler r2 object get "$R2_BUCKET/$key" --file "$dest" --remote \
        >/dev/null 2>&1 || [[ ! -s "$dest" ]]; then
        rm -f "$dest"
        [[ "$quiet" == 1 ]] || r2_log "! R2 GET $R2_BUCKET/$key failed (wrangler)"
        return 1
      fi
      ;;
    *)
      r2_log "! Unknown R2_BACKEND: $(r2_backend)"
      return 1
      ;;
  esac
}

# r2_put <src> <key> [content-type] — upload a file, replacing the object.
r2_put() {
  local src="$1" key="$2" content_type="${3:-}"
  if [[ ! -s "$src" ]]; then
    r2_log "! Refusing to upload empty file: $src"
    return 1
  fi
  [[ -n "$content_type" ]] || content_type="$(r2_content_type "$key")"

  case "$(r2_backend)" in
    s3)
      local status
      status="$(r2_signed_curl -X PUT -o /dev/null -w '%{http_code}' \
        -H "Content-Type: $content_type" \
        --upload-file "$src" \
        "$(r2_object_url "$key")")" || true
      if [[ "$status" != 2* ]]; then
        r2_log "! R2 PUT $R2_BUCKET/$key failed (HTTP ${status:-network error})"
        return 1
      fi
      ;;
    wrangler)
      if ! wrangler r2 object put "$R2_BUCKET/$key" --file "$src" \
        --content-type "$content_type" --remote >/dev/null 2>&1; then
        r2_log "! R2 PUT $R2_BUCKET/$key failed (wrangler)"
        return 1
      fi
      ;;
    *)
      r2_log "! Unknown R2_BACKEND: $(r2_backend)"
      return 1
      ;;
  esac
}

# r2_authenticated — succeed when the selected backend has usable credentials.
r2_authenticated() {
  case "$(r2_backend)" in
    s3)
      [[ -n "${R2_ACCESS_KEY_ID:-}" && -n "${R2_SECRET_KEY:-}" ]]
      ;;
    wrangler)
      command -v wrangler >/dev/null 2>&1 || return 1
      # Avoid spawning wrangler (seconds per call, once per content file): a
      # stored OAuth session is enough to assume the bucket is reachable.
      local config
      for config in \
        "${WRANGLER_HOME:-}/config/default.toml" \
        "${XDG_CONFIG_HOME:-$HOME/.config}/.wrangler/config/default.toml" \
        "$HOME/.wrangler/config/default.toml"; do
        [[ -s "$config" ]] && return 0
      done
      return 1
      ;;
    *) return 1 ;;
  esac
}

# r2_head <key> — succeed when the object exists.
r2_head() {
  local key="$1"
  case "$(r2_backend)" in
    s3)
      local status
      status="$(r2_signed_curl -I -o /dev/null -w '%{http_code}' \
        "$(r2_object_url "$key")")" || true
      [[ "$status" == 2* ]]
      ;;
    wrangler)
      # wrangler has no HEAD verb; a quiet GET is the cheapest existence probe.
      local tmp
      tmp="$(mktemp)"
      if r2_get "$key" "$tmp" 1; then
        rm -f "$tmp"
        return 0
      fi
      rm -f "$tmp"
      return 1
      ;;
    *)
      r2_log "! Unknown R2_BACKEND: $(r2_backend)"
      return 1
      ;;
  esac
}
