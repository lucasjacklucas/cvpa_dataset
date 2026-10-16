# cvpa 0.3.0

After upgrading, run `update_cvpa_data()` to refresh your local cache: the
cached question catalog from earlier versions is out of date.

## Breaking changes

* `update_cvpa_data(questions = "all")` has been removed. Name the question
  codes you need (see `question_catalog()`); it now errors with a pointer to
  the full `dataset.parquet` in the
  [cvpa_dataset repository](https://github.com/lucasjacklucas/cvpa_dataset)
  for anyone who wants everything.

* `wtd_vote()` and `gap_analysis()` now default to `years = NULL`, meaning
  every year in `data`, instead of `1945:2023` and `1945:2022`. The old
  defaults silently dropped any year after 2023 (and, for `gap_analysis()`,
  2023 itself). Results on the bundled `vote_data` are unchanged for
  `wtd_vote()`; `gap_analysis()` now includes 2023. Pass `years` explicitly
  to restore the old behaviour.

## Data

* The default `cvpa.data_url` is now `https://policyattitudes.ca/cp3_parquet/`,
  hosted with the project site, instead of the copy on quantoid.ca, which
  was out of date and is no longer read by the package. The new data
  includes the merge of `ces_soim_009` into `bri_soim_014` (same-sex
  marriage; `bri_soim_014` now covers the CES 1993, 1997, 2000, 2004, 2006
  and 2008 surveys and has the wording "Support or oppose allowing same-sex
  couples to marry"), and respondent ages recovered for five Environics
  surveys.

* `question_catalog()` now lists only questions and surveys that have
  respondent-level data, so `n_waves` counts only surveys that actually
  have data, and questions with no data (such as `env_intd_045`) are no
  longer listed. Surveys with no region variable cannot be weighted and
  are not included.

## Tests

* cvpa now has a `testthat` suite (run offline against the bundled
  example data) covering the data download and caching, the question
  catalog, decoding, the weighted-share and gap-analysis functions, the
  unofficial-data warnings and the legacy vote functions.

## Examples and the example data

* Every help page now has examples, and all of them run (none are wrapped in
  `\dontrun{}` any more). The ones that need data use a small bundled
  example dataset -- four questions, with a random sample of respondents from
  each survey year -- through the new `cvpa_example_url()`, in a temporary
  cache, so they run offline and never touch your own cache. The example
  data is for illustration only.

* `update_cvpa_data()` now warns whenever `options(cvpa.data_url = ...)` is
  anything other than the official live data
  (<https://policyattitudes.ca/cp3_parquet/>), and says how to switch back.
  The functions that read the cache (`question_catalog()`, `question_data()`,
  `question_response_labels()`) also warn, once per session, if the cache
  was downloaded from an unofficial source; `update_cvpa_data()` records the
  source in a small `cvpa_source.txt` file in the cache directory.

## Bug fixes

* `gap_analysis()` and `response_gap_analysis()` reported `conf.low` and
  `conf.high` the wrong way round: the confidence interval for `diff`
  (group 2 minus group 1) was negated but its limits were not swapped, so
  `conf.low` was always larger than `conf.high`. The interval itself was
  right and plots that draw between the two values looked fine, but anything
  that treated `conf.low` as the lower bound got the wrong number. `conf.low`
  is now the lower limit and `diff` always lies between the two. If you
  saved or published these two columns from an earlier version, they are
  simply swapped: the old `conf.high` is the correct lower limit and the
  old `conf.low` the correct upper limit.

* `update_cvpa_data()` no longer leaves a corrupt file in the cache when a
  download fails. Downloads are written to a temporary file and checked to
  be valid Parquet before they replace anything, so a failed, truncated, or
  error-page download can't overwrite a good cached copy. A failure to
  download the catalog or code labels stops with an error and leaves the
  cache untouched.

* `update_cvpa_data()` skips a question whose file can't be downloaded,
  with a warning naming it, instead of stopping at the first missing file.
  The return value gains a `"skipped"` attribute listing those questions.

* A local `file://` mirror set through `options(cvpa.data_url = ...)` now
  works; a cache-busting query string was being appended to every URL.

* Two question wordings (`ces_dpin_016`, `env_intd_012`) no longer show
  their quotation marks repeated several times over.
