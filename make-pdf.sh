#!/usr/bin/env bash
# Build Sam-McKendrick-Resume.pdf from index.html using Chrome's own "print to PDF".
# Needs only Chrome, Chromium, Edge or Brave. No packages to install.
#
#   RESUME_PHONE="+61 400 000 000" ./make-pdf.sh    # PDF with a phone number
#   ./make-pdf.sh                                   # PDF without one
#
# The public page carries no phone number. This script adds RESUME_PHONE to a
# temporary copy, prints that copy to A4, and deletes the copy.
#
# Optional settings:
#   CHROME        path to the browser, if the script cannot find one
#   CHROME_FLAGS  extra flags, e.g. "--no-sandbox" inside a container
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
src="$here/index.html"
out="$here/Sam-McKendrick-Resume.pdf"
expected_pages=2

find_chrome() {
  if [ -n "${CHROME:-}" ]; then echo "$CHROME"; return; fi
  local c
  for c in google-chrome google-chrome-stable chromium chromium-browser microsoft-edge brave-browser; do
    if command -v "$c" >/dev/null 2>&1; then command -v "$c"; return; fi
  done
  for c in \
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    "/Applications/Chromium.app/Contents/MacOS/Chromium" \
    "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge" \
    "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"; do
    if [ -x "$c" ]; then echo "$c"; return; fi
  done
  return 1
}

chrome="$(find_chrome)" || {
  echo "No Chrome-family browser found. Set CHROME to its path and run again." >&2
  exit 1
}
[ -f "$src" ] || { echo "Cannot find $src" >&2; exit 1; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
copy="$tmp/resume.html"

phone="${RESUME_PHONE:-}"
if [ -n "$phone" ]; then
  case "$phone" in
    *[!0-9+\ \(\)-]*) echo "RESUME_PHONE may contain only digits, spaces, +, - and brackets." >&2; exit 1 ;;
  esac
  tel="$(printf '%s' "$phone" | tr -cd '0-9+')"
  # Insert the number straight after the email link in the header.
  sed -E "s|(<a href=\"mailto:[^\"]+\">[^<]+</a>)|\1 \&nbsp; <a href=\"tel:${tel}\">${phone}</a>|" "$src" > "$copy"
  grep -q "tel:${tel}" "$copy" || { echo "Could not find the email link in index.html, so the phone number has nowhere to go." >&2; exit 1; }
else
  echo "RESUME_PHONE is not set, so the PDF will have no phone number."
  cp "$src" "$copy"
fi

# --virtual-time-budget gives the web fonts time to load before printing.
# shellcheck disable=SC2086
"$chrome" --headless --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=5000 ${CHROME_FLAGS:-} \
  --print-to-pdf="$out" "file://$copy" >/dev/null 2>&1

[ -s "$out" ] || { echo "The browser did not produce a PDF. Run the script with CHROME_FLAGS=\"--no-sandbox\" if you are inside a container." >&2; exit 1; }

pages="$(grep -a -c -E '/Type */Page($|[^s])' "$out" || true)"
echo "Wrote $out ($pages pages)."
if [ "$pages" != "$expected_pages" ]; then
  echo "Expected $expected_pages pages. Trim some text, or lower the font size in the '@media print' block of index.html (html { font-size: ... })."
fi
