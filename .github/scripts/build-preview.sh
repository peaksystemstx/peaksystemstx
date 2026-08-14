#!/usr/bin/env bash
# Build a GitHub Pages *preview* copy of the site.
#
# This exists ONLY for the Pages preview deployment. The real site (Netlify,
# peaksystemstx.com) is served straight from ./site with no build step — see
# README.md. Nothing here touches ./site; it all happens in a throwaway copy.
#
# What it does to the copy:
#   1. Rewrites root-absolute paths (/css, /images, href="/") to relative ones,
#      because a project Pages site is served from a sub-path
#      (https://<user>.github.io/<repo>/), where "/css/..." would 404.
#   2. Injects a "Preview only" banner + a noindex robots meta into every page,
#      so no one mistakes the preview for the live site and search engines skip it.
#   3. Replaces robots.txt with a disallow-all, so crawlers never index the clone.
#
# Usage: build-preview.sh <src-dir> <out-dir>
set -euo pipefail

SRC="${1:-site}"
OUT="${2:-_preview}"

rm -rf "$OUT"
cp -r "$SRC" "$OUT"

# Banner + its styles, kept on single lines so awk can inject them verbatim.
BANNER='<div class="preview-banner" role="note" aria-label="Preview notice"><strong>Preview only</strong> &mdash; not for production use. GitHub Pages isn&rsquo;t intended for commercial hosting; the live site is <a href="https://peaksystemstx.com">peaksystemstx.com</a>.</div>'
STYLE='<style>.preview-banner{background:#7c2d12;color:#fff;font:600 14px/1.45 system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;text-align:center;padding:.6rem 1rem;margin:0}.preview-banner a{color:#fdba74;text-decoration:underline}</style>'
META='<meta name="robots" content="noindex, nofollow">'

for f in "$OUT"/*.html; do
  # 1. Path rewrite: home link first, then strip the leading slash off the rest.
  #    Kept portable (no `sed -i`, no `\|` alternation) so it behaves identically
  #    on macOS (BSD sed) and Linux (GNU sed).
  sed \
    -e 's|href="/"|href="./"|g' \
    -e 's|href="/|href="|g' \
    -e 's|src="/|src="|g' \
    "$f" > "$f.tmp" && mv "$f.tmp" "$f"

  # 2. Inject noindex + banner styles before </head>, banner markup after <body>.
  #    awk print (not gsub) avoids any escaping surprises with the HTML strings.
  awk -v meta="$META" -v style="$STYLE" -v banner="$BANNER" '
    /<\/head>/ { print meta; print style }
    { print }
    /<body[^>]*>/ { print banner }
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done

# 3. Preview must never be indexed, whatever the source robots.txt said.
printf 'User-agent: *\nDisallow: /\n' > "$OUT/robots.txt"

echo "Preview built in $OUT/ ($(find "$OUT" -name '*.html' | wc -l | tr -d ' ') pages)"
