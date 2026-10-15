# cvpa_dataset
Canadian Voting and Policy Attitudes Dataset

## Project website

The source for the project website (https://policyattitudes.ca/) lives in `site/`. It's built with [Hugo](https://gohugo.io) (extended) and the [Researcher](https://github.com/ojroques/hugo-researcher) theme.

- Pages are Markdown files in `site/content/`.
- The theme is a git submodule in `site/themes/researcher`. Clone with `git clone --recurse-submodules`, or run `git submodule update --init` in an existing clone.
- Style changes go in `site/assets/css/custom.css`, not in the theme's files.
- To preview locally, run `hugo server` from `site/`.
- Pushing changes under `site/` to `main` rebuilds and deploys the site (`.github/workflows/hugo.yml`).

## Rebuilding the dataset

`dataset.parquet` can be rebuilt from the original survey files, for 628 of its 672 surveys: every survey except the 44 restricted Pollara surveys. `code/` holds the build scripts; `code/rebuild/` holds the scripts that download the survey files from Borealis and Harvard Dataverse (`dataverse_files.csv` lists them, with checksums), run the build, and compare the result with the published dataset; `supporting_data/` holds two inputs the build needs that are not survey files; and `bridge_survey/` holds a minimal version of the 2026 Bridge Survey (every respondent, in the original row order, but only the variables the build reads), which is not yet publicly archived. See https://policyattitudes.ca/resources/rebuilding-the-dataset/ for step-by-step instructions.

## The cvpa R package

The R package for working with these data lives in `rpkg/`. It reads the same Parquet files that the [policy-attitudes app](https://policyattitudes.ca/app/) is built from, and is also released on CRAN. To install the development version from GitHub:

```r
# install.packages("remotes")
remotes::install_github("lucasjacklucas/cvpa_dataset", subdir = "rpkg")

library(cvpa)
update_cvpa_data()   # download the question catalog and code labels
```

See the package vignette (`vignette("cvpa")`) for a walkthrough. `vignettes/cvpa.Rmd` is generated from `vignettes/cvpa.Rmd.orig`; edit the `.orig` file and re-knit it (instructions are in a comment at the top of the file).
