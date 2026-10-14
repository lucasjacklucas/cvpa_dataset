#!/usr/bin/env bash
# Renders each Quarto slide deck in site/slides/ to a PDF (Beamer) and copies
# it to site/static/resources/, where the site serves it at
# /resources/<name>.pdf.
#
# Run from the repository root whenever a deck changes, then commit the PDF:
#   bash site/scripts/render_slides.sh
# The decks download data with the cvpa package, so this needs cvpa installed,
# an internet connection, and a LaTeX installation.
set -euo pipefail

src_dir="site/slides"
out_dir="site/static/resources"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

mkdir -p "$out_dir"
for qmd in "$src_dir"/*.qmd; do
  name=$(basename "$qmd" .qmd)
  cp "$qmd" "$work/"
  (cd "$work" && quarto render "$name.qmd")
  cp "$work/$name.pdf" "$out_dir/$name.pdf"
  echo "Rendered $qmd -> $out_dir/$name.pdf"
done
