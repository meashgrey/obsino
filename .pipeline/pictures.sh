#!/usr/bin/env bash

# pictures.sh — Picture manifest helpers built on top of r2.sh.
#
# Every entry in pictures.yaml is a label with one or more source URLs. The
# label, not the URL, is the identity of the picture: it maps deterministically
# to an R2 object key so that builds fetch a stable object instead of scraping
# the upstream host each time.
#
#   pictures/<label>.<ext>   manifest pictures
#   remote/<md5>.<ext>       ad-hoc image("https://...") URLs
#
# Source this file after r2.sh. It only defines functions.

# Fall back to the repository manifest when the caller has not set one yet.
PICTURES="${PICTURES:-${ROOT:-.}/pictures.yaml}"

# Print a lowercase file extension for a URL/path, empty when there is none.
pictures_extension() {
  local base="${1%%\?*}"
  local extension="${base##*.}"
  if [[ "$extension" == "$base" || -z "$extension" || ${#extension} -gt 5 ]]; then
    printf ''
  else
    printf '%s' "$extension" | tr '[:upper:]' '[:lower:]'
  fi
}

# Print the md5 of a URL, matching the historical cache naming scheme.
pictures_md5() {
  printf '%s' "$1" | md5sum | awk '{print $1}'
}

# Print the source URLs for a manifest label, one per line.
pictures_urls() {
  local label="$1"
  if [[ ! -f "$PICTURES" ]]; then
    r2_log "! Warning: pictures.yaml not found at $PICTURES"
    return 1
  fi
  yq -r ".pictures[\"${label}\"][] // \"\"" "$PICTURES" 2>/dev/null | sed '/^$/d'
}

# Print the primary extension for a label, falling back to png.
pictures_label_extension() {
  local label="$1" url ext
  url="$(pictures_urls "$label" | head -n 1)"
  ext="$(pictures_extension "$url")"
  printf '%s' "${ext:-png}"
}

# Print the R2 key for a manifest label.
pictures_key() {
  printf 'pictures/%s.%s' "$1" "$(pictures_label_extension "$1")"
}

# Print the R2 key for an ad-hoc remote URL.
pictures_remote_key() {
  local url="$1" ext
  ext="$(pictures_extension "$url")"
  printf 'remote/%s.%s' "$(pictures_md5 "$url")" "${ext:-png}"
}

# Print an existing cache file for a label, preferring the current
# `<label>.<ext>` name and falling back to the legacy md5-named file.
#
#   pictures_cached_file <cache-dir> <label>
pictures_cached_file() {
  local cache_dir="$1" label="$2"
  local key filename url legacy
  key="$(pictures_key "$label")"
  filename="$(basename "$key")"
  if [[ -s "$cache_dir/$filename" ]]; then
    printf '%s' "$cache_dir/$filename"
    return 0
  fi
  while IFS= read -r url; do
    [[ -n "$url" ]] || continue
    legacy="$(pictures_md5 "$url").$(pictures_extension "$url")"
    if [[ -s "$cache_dir/$legacy" ]]; then
      printf '%s' "$cache_dir/$legacy"
      return 0
    fi
  done < <(pictures_urls "$label" || true)
  return 1
}

# Print every manifest label.
pictures_labels() {
  if [[ ! -f "$PICTURES" ]]; then
    r2_log "! Warning: pictures.yaml not found at $PICTURES"
    return 1
  fi
  yq -r '.pictures | keys[]' "$PICTURES" 2>/dev/null
}

# pictures_detect_type <file> — print the image extension inferred from magic
# bytes, or nothing when the payload is not a supported image.
pictures_detect_type() {
  local file="$1" magic
  magic="$(head -c 16 "$file" 2>/dev/null | od -An -tx1 | tr -d ' \n')"
  case "$magic" in
    89504e47*) printf 'png' ;;
    ffd8*) printf 'jpg' ;;
    474946*) printf 'gif' ;;
    52494646*) [[ "$(head -c 12 "$file" | tail -c 4)" == "WEBP" ]] && printf 'webp' ;;
    25504446*) printf 'pdf' ;;
    *)
      if grep -qi '<svg' "$file" 2>/dev/null; then
        printf 'svg'
      fi
      ;;
  esac
}

# pictures_looks_like_image <file> <key-or-name> — reject HTML error pages and
# other non-image payloads that upstream hosts return with a 200 status. The
# payload type must agree with the expected extension because Typst picks its
# decoder by extension.
pictures_looks_like_image() {
  local file="$1" name="$2"
  local ext="${name##*.}"
  ext="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"
  local detected
  detected="$(pictures_detect_type "$file")"

  [[ -n "$detected" ]] || return 1

  case "$ext" in
    png) [[ "$detected" == "png" ]] ;;
    jpg | jpeg) [[ "$detected" == "jpg" || "$detected" == "jpeg" ]] ;;
    gif) [[ "$detected" == "gif" ]] ;;
    webp) [[ "$detected" == "webp" ]] ;;
    svg) [[ "$detected" == "svg" ]] ;;
    pdf) [[ "$detected" == "pdf" ]] ;;
    # Unknown extension: trust the detected payload type.
    *) return 0 ;;
  esac
}

# pictures_upstream_get <url> <dest> — fetch a source URL with curl.
pictures_upstream_get() {
  local url="$1" dest="$2"
  curl -sS -L --retry 2 --retry-delay 1 \
    --connect-timeout 20 --max-time 120 \
    -o "$dest" "$url" 2>/dev/null || true
  if [[ -s "$dest" ]] && pictures_looks_like_image "$dest" "$dest"; then
    return 0
  fi
  rm -f "$dest"
  return 1
}
