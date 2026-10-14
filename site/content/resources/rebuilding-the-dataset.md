---
title: "Rebuilding the Dataset from Scratch"
---

**You almost certainly don't need this.** The [published dataset](https://github.com/lucasjacklucas/cvpa_dataset) is exactly what the steps below produce, and the [R package](/resources/cvpa-r-package/) and the [interactive app](https://www.quantoid.ca/files/app-js-remote/) are built on it. If you want a question the dataset doesn't include, see [Adding Variables from the Original Surveys](/resources/adding-variables/), which doesn't require rebuilding anything.

This page is for anyone who wants to reproduce the dataset for themselves: to download the original survey files, run our code, and confirm that every value in CVPA comes from those files the way our documentation says it does.

## What can be rebuilt

The dataset combines 672 surveys. Nearly all of them are publicly archived on [Borealis](https://borealisdata.ca/) or [Harvard Dataverse](https://dataverse.harvard.edu/), and can be rebuilt by anyone. The 2026 Bridge Survey isn't publicly archived yet, so our repository includes a minimal version of it: every respondent, but only the variables that appear in CVPA.

| source | surveys | can be rebuilt? |
|---|---|---|
| Gallup Canada | 477 | yes |
| Canadian Election Study and Democracy Checkup | 27 files | yes |
| Environics Focus Canada | 134 | yes |
| Pollara Perspectives Canada | 44 | no: access is restricted to the Carleton University network |
| CVPA 2026 Bridge Survey | 1 | yes, from the minimal version in our repository |

In total, the rebuild produces 628 of the 672 surveys: 9,081,938 of the dataset's 9,198,156 rows. Only the Pollara surveys are missing. For those surveys, every row is identical to the published dataset. We last confirmed this, starting from an empty folder, in October 2026.

## How the build works

The build code is in the [`code/` folder](https://github.com/lucasjacklucas/cvpa_dataset/tree/main/code) of our GitHub repository:

- `01_gallup.R`, `02_ces.R`, `03_environics.R`, `04_pollara.R`, and `05_bridge.R` hold one block per survey, recording how that survey's questions and demographics are recoded.
- `00_setup.R` holds the shared machinery, and checks every recode against the two codebooks, `question_codebook.csv` and `demographics_codebook.csv`.
- `99_build.R` runs every block, checks the results, and writes `dataset.parquet`.

Two scripts in `code/rebuild/` make the process automatic:

- `rebuild_from_dataverse.R` downloads every available survey file from Borealis and Harvard Dataverse, using the list in `dataverse_files.csv`, and then runs the build. It checks every download against a checksum, so if an archived file has changed since we built the dataset, it stops and tells you which one, rather than quietly producing different results.
- `setup_rebuild.R` sets up a folder for the rebuild from a copy of the repository, including the minimal Bridge Survey file, and runs `rebuild_from_dataverse.R`.

## What you need

- R, with these packages: `tidyverse`, `haven`, `arrow`, and `httr2`. The build needs `dplyr` version 1.2.0 or later.
- About 1 GB of free disk space. The survey files take up about 550 MB.
- An internet connection. No account or API key is needed.
- About 10 to 20 minutes, depending on your connection. Most of the time is spent downloading.

## Step 1: Get the code

Download the repository from GitHub, either with `git`:

    git clone https://github.com/lucasjacklucas/cvpa_dataset.git

or by clicking **Code**, then **Download ZIP**, on the [repository page](https://github.com/lucasjacklucas/cvpa_dataset) and unzipping it.

## Step 2: Install the packages

In R:

```r
install.packages(c("tidyverse", "haven", "arrow", "httr2"))
```

If you already have these packages, check that `packageVersion("dplyr")` is at least 1.2.0. If it isn't, run `install.packages("dplyr")` and restart R.

## Step 3: Run the rebuild

Open a terminal in the repository folder (the one containing `code/` and `dataset.parquet`), and run:

    Rscript code/rebuild/setup_rebuild.R "../cvpa_rebuild"

This creates a new folder called `cvpa_rebuild` next to the repository, downloads the survey files into it, and runs the build. You'll see each file as it downloads, followed by the build's progress and checks. The rebuilt dataset is written to `cvpa_rebuild/3 Clean Data/dataset.parquet`.

Two messages near the end are expected, and don't mean anything went wrong:

- **A list of files "not found under 1 Raw Data/"**: these are the 44 Pollara surveys, which can't be downloaded. The build skips them.
- **Several "NAs introduced by coercion" warnings**: these come from values in a few survey files that aren't numeric codes. The build treats them as missing, which is what its recoding rules are designed to do.

If the run is interrupted, run the same command again. Files that have already downloaded are kept and not downloaded again.

## Step 4: Compare with the published dataset

To check your rebuild against the published dataset, run this from the repository folder:

    Rscript code/rebuild/compare_to_release.R "../cvpa_rebuild/3 Clean Data/dataset.parquet" "dataset.parquet"

The script reports how many surveys were rebuilt, lists the sources that couldn't be, and then compares every row and column of the rebuilt surveys with the same surveys in the published dataset. It should finish with:

    Every row of the rebuilt surveys is identical to the published dataset.

## If you have access to the Pollara surveys

Members of the Carleton University community can download the Pollara surveys from Borealis while on the Carleton network. Put them in `cvpa_rebuild/1 Raw Data/4 Pollara/surveys/`, under the file names listed in `code/rebuild/dataverse_files.csv`, and run Step 3 again. The build will then include them.

## Troubleshooting

- **"This build needs dplyr's recode_values()"**: your version of `dplyr` is too old. Run `install.packages("dplyr")`, restart R, and try again.
- **A download fails**: run Step 3 again. Only the missing files are downloaded. If a file keeps failing, the archive may be temporarily unavailable; the build skips any survey whose file is missing, and lists it at the end.
- **"These files no longer match the checksum"**: the archived version of a survey file has changed since we built the dataset. Please [let us know](https://github.com/lucasjacklucas/cvpa_dataset/issues) which file it is.
