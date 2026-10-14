#!/usr/bin/env bash
# Renders each Quarto tutorial in site/tutorials/ to a Hugo page bundle at
# site/content/resources/<name>/ (index.md plus its figures), along with
# <name>.R, the tutorial's code as a downloadable script (see qmd_to_r.R).
#
# Run from the repository root whenever a tutorial changes, then commit the
# rendered bundle:
#   bash site/scripts/render_tutorials.sh
# The tutorials download data with the cvpa package, so this needs cvpa
# installed and an internet connection.
set -euo pipefail

src_dir="site/tutorials"
out_dir="site/content/resources"
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

for qmd in "$src_dir"/*.qmd; do
  name=$(basename "$qmd" .qmd)
  cp "$qmd" "$work/"
  (cd "$work" && quarto render "$name.qmd" --to hugo-md)

  bundle="$out_dir/$name"
  rm -rf "$bundle"
  mkdir -p "$bundle"
  cp "$work/$name.md" "$bundle/index.md"
  cp -R "$work/$name.markdown_strict_files" "$bundle/"
  Rscript site/scripts/qmd_to_r.R "$qmd" "$bundle/$name.R"
  echo "Rendered $qmd -> $bundle"
done
