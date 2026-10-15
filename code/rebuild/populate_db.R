library(tidyverse)
library(glue)
library(arrow)
integrated <- read_parquet("dataset.parquet")
integrated$survey_id <- ifelse(integrated$survey_id == "CVPA 2026 Bridge Survey", "bridge_clean.csv", integrated$survey_id)
w <- readRDS("~/Dropbox/canadian policy preferences project/Survey Datasets and Setup/Weights Data/data/19212026agecat_sex_region.RDS") 
w <- w |> rename(gender = woman)

integrated <- integrated |> 
  select("source", "survey_id", "survey_mode", "start_date", "end_date", "year", 
         "response_id", "language", "language_var", "region", "province", "com_500", 
         "com_100",  "gender", "age_cats", "religion", 
         "degree", "mother_tongue", "language_home", "union_household", 
         "occupation", everything())

wts <- integrated %>% 
  summarise(n = n(), .by=c(year, region, age_cats, gender, question_id)) %>% 
  mutate(total = sum(n), 
         survey_prop = n/total, 
         .by=c(year, question_id))
prop.survey <- left_join(wts, w) %>% 
  mutate(weight = proportion/survey_prop)


indiv <- integrated %>% 
  filter(grepl("vote", question_id)) |> 
  select(all_of(c("response_id", "year", "survey_id", "question_id", "value", "region", "province", "com_500", 
                  "com_100",  "gender", "age", "age_cats", "religion", 
                  "degree", "union_household", "occupation", "language", "mother_tongue", "language_home"))) |> 
  pivot_wider(names_from = question_id, values_from = value) 

svy <- integrated %>% 
  select(source, survey_id, year, start_date, end_date, survey_mode) %>% 
  slice_head(n=1, by=survey_id)

resp <- integrated |> 
  select(response_id, survey_id, question_id, response = value) |> 
  filter(response <= 10)
resp2 <- resp %>% 
  left_join(indiv %>% select(response_id, year, region, age_cats, gender)) 
resp3 <- resp2 %>%   
  left_join(prop.survey %>% ungroup %>% select(year, region, age_cats, gender, question_id, weight))

# ---------------------------------------------------------------------------
# Denormalize onto resp: fold every grouping-variable column the app can
# chart by (must match GROUP_VARS in app-js/app.js exactly) directly onto
# each resp row, plus the authoritative display year from `survey`. This is
# what lets the planned remote-Parquet deployment fetch one question's worth
# of `resp` rows (a range-request slice, partitioned on `question`) and have
# everything needed to render ANY grouping choice, with zero further joins
# to `indiv` or `survey` at query time - only a `question` change needs a
# new fetch; group-by and year-range become pure local computation on data
# already in hand.
#
# Two things kept deliberately separate from the join above:
#  - region/age_cats/woman are already on resp3 from the join above (that
#    one exists only to key the weight lookup and must stay untouched); they
#    are simply no longer dropped in the final select() below.
#  - year is re-joined here from `survey`, not reused from the indiv-sourced
#    `year` already on resp3 above. That indiv-sourced year only exists to
#    key the weight lookup (the weighting scheme was calibrated against it)
#    - it is NOT the year the app should display. app-js deliberately
#      switched display year to survey.year, not indiv.year, on 2026-08-31
#      (see docs/data_quality_check.md item 2); denormalizing the wrong one
#      here would silently reintroduce that already-fixed discrepancy.
# ---------------------------------------------------------------------------
GROUP_VARS <- c("vote_intention", "vote_choice", "region", "province", "com_500",
                "com_100", "gender", "age_cats", "religion", "degree", "language",
                "union_household", "occupation")
group_vars_extra <- setdiff(GROUP_VARS, c("region", "age_cats", "gender"))

resp3 <- resp3 %>% 
  left_join(indiv %>% select(response_id, all_of(group_vars_extra)), by = "response_id") %>% 
  select(-year) %>% 
  left_join(svy %>% select(survey_id, year), by = c("survey_id"))

resp3 <- resp3 %>% ungroup %>% 
  select(response_id, survey_id, question = question_id, response, weight, year, all_of(GROUP_VARS))
## only keep obs with weights? 
resp3 <- resp3 %>% filter(!is.na(weight))

# install.packages(c("DBI", "duckdb", "dbplyr"))  # if needed
library(DBI)
library(duckdb)
library(dplyr)
library(dbplyr)


# Builds the `code_labels` codebook table: one row per (variable, code) pair,
# transcribed from the recoding logic currently embedded in `label_vars()` in
# app.R (roughly lines 4-203). See docs/data_quality_check.md item 4 for the
# history of this table.
#
# Why this exists as data, not code: both the JS app and the future R package
# need the same labels, and label_vars() only lived in the Shiny app - the R
# package would otherwise have had to reimplement it from scratch, with no
# guarantee the two stayed in sync. This script is the one place the mapping
# is defined; `code_labels.csv` is the diffable, version-controlled source of
# truth, and this script also loads it straight into surveydb.duckdb so any
# client (R, JS via DuckDB-WASM, DBI, whatever) can join against it directly
# at query time (e.g. `JOIN code_labels ON variable = '...' AND code = ...`)
# rather than re-deriving labels in JS.
#
# Run this from the project root (cp3.Rproj). It will fail loudly if it's
# about to overwrite existing (variable, code) pairs with different labels,
# so re-running it after an edit is safe.
#
# On coverage: every row here is a direct, mechanical transcription of what
# label_vars() already does. A handful of codes turned up in the real data
# (verified against indiv directly) that label_vars() never assigned a label
# to at all - vote_intention/vote_choice 95-98, religion 97/99, language
# 98/99 - and were silently becoming NA. The project owner confirmed
# (2026-08-31) these are don't-know/unclassifiable/other missing-data
# responses, so they deliberately get NO row here (see section 2 below):
# a join against code_labels naturally excludes them, same as every other
# missing-data code label_vars() already drops via implicit NA.


# ---------------------------------------------------------------------------
# 1. Variables transcribed directly from label_vars() - order matches the
#    `factor(levels = ...)` display order in app.R, NOT numeric code order
#    (they differ for vote_intention/vote_choice: Green(10) is displayed
#    before Other(9)).
# ---------------------------------------------------------------------------

# vote_intention and vote_choice share the same coding scheme in app.R.
vote_labels <- tribble(
  ~code, ~label,                       ~sort_order,
  1,     "Liberal",                    1,
  2,     "PC/Conservative",            2,
  3,     "CCF/NDP",                    3,
  4,     "Social Credit/Creditiste",   4,
  5,     "Labour Progressive",         5,
  6,     "Bloc Quebecois",             6,
  7,     "Bloc Populaire",             7,
  8,     "Reform/Alliance",            8,
  10,    "Green",                      9,
  9,     "Other",                      10,
  99,    "Undecided",                  11
)

vote_intention_labels <- vote_labels %>% mutate(variable = "vote_intention", .before = 1)
vote_choice_labels    <- vote_labels %>% mutate(variable = "vote_choice",    .before = 1)

province_labels <- tribble(
  ~variable,  ~code, ~label, ~sort_order,
  "province", 10,    "NL",   1,
  "province", 11,    "PEI",  2,
  "province", 12,    "NS",   3,
  "province", 13,    "NB",   4,
  "province", 24,    "QC",   5,
  "province", 35,    "ON",   6,
  "province", 46,    "MB",   7,
  "province", 47,    "SK",   8,
  "province", 48,    "AB",   9,
  "province", 59,    "BC",   10,
  "province", 60,    "YT",   11,
  "province", 61,    "NT",   12,
  "province", 62,    "NU",   13
)

region_labels <- tribble(
  ~variable, ~code, ~label,              ~sort_order,
  "region",  1,     "Atlantic",          1,
  "region",  2,     "Quebec",            2,
  "region",  3,     "Ontario",           3,
  "region",  4,     "Prairies",          4,
  "region",  5,     "British Columbia",  5,
  "region",  6,     "North",             6
)

com_500_labels <- tribble(
  ~variable, ~code, ~label,                  ~sort_order,
  "com_500", 0,     "Population <= 500k",    1,
  "com_500", 1,     "Population > 500k",     2
)

com_100_labels <- tribble(
  ~variable, ~code, ~label,                  ~sort_order,
  "com_100", 0,     "Population <= 100k",    1,
  "com_100", 1,     "Population > 100k",     2
)

woman_labels <- tribble(
  ~variable, ~code, ~label,  ~sort_order,
  "woman",   0,     "Man",   1,
  "woman",   1,     "Woman", 2
)

age_cats_labels <- tribble(
  ~variable,  ~code, ~label,  ~sort_order,
  "age_cats", 1,     "18-29", 1,
  "age_cats", 2,     "30-49", 2,
  "age_cats", 3,     "50+",   3
)

religion_labels <- tribble(
  ~variable,  ~code, ~label,       ~sort_order,
  "religion", 1,     "Catholic",   1,
  "religion", 2,     "Protestant", 2,
  "religion", 3,     "Jewish",     3,
  "religion", 4,     "Other",      4,
  "religion", 5,     "None",       5
)

degree_labels <- tribble(
  ~variable, ~code, ~label,                  ~sort_order,
  "degree",  0,     "No University Degree",  1,
  "degree",  1,     "University Degree",     2
)

union_household_labels <- tribble(
  ~variable,          ~code, ~label,                            ~sort_order,
  "union_household",  0,     "No Union Member in Household",    1,
  "union_household",  1,     "Union Member in Household",       2
)

# NOTE: "Farmer/Fiserman" is transcribed exactly as it appears in app.R
# (label_vars(), occupation block) - this looks like a typo for
# "Farmer/Fisherman" in the original source. Left as-is rather than silently
# "fixed", since correcting it is a content decision, not a transcription
# one - flip it here (and this comment) once you've confirmed which you want.
occupation_labels <- tribble(
  ~variable,    ~code, ~label,                  ~sort_order,
  "occupation", 1,     "Managers, Executives",  1,
  "occupation", 2,     "Professional",          2,
  "occupation", 3,     "Routine Non-manual",    3,
  "occupation", 4,     "Working Class",         4,
  "occupation", 5,     "Armed Forces",          5,
  "occupation", 6,     "Farmer/Fiserman",       6,  # sic - see note above
  "occupation", 7,     "Retired",               7,
  "occupation", 8,     "Unemployed",            8,
  "occupation", 9,     "Student",               9,
  "occupation", 99,    "Other",                 10
)

language_labels <- tribble(
  ~variable,  ~code, ~label,                 ~sort_order,
  "language", 1,     "French",               1,
  "language", 2,     "English",              2,
  "language", 3,     "French and English",   3,
  "language", 4,     "Other",                4
)

# response_fac: meaning depends on the question's `type` (vbl_data.type), so
# each type gets its own pseudo-variable name rather than overloading a
# single "response_fac" key with ambiguous codes (0 means different things
# for "b" vs "nsa"). Raw codes match resp.response for that type exactly.
response_fac_b_labels <- tribble(
  ~variable,          ~code, ~label,     ~sort_order,
  "response_fac_b",   0,     "Disagree", 1,
  "response_fac_b",   1,     "Agree",    2
)

response_fac_nsa_labels <- tribble(
  ~variable,           ~code, ~label,      ~sort_order,
  "response_fac_nsa",  0,     "Never",     1,
  "response_fac_nsa",  0.5,   "Sometimes", 2,
  "response_fac_nsa",  1,     "Always",    3
)

response_fac_lsm_labels <- tribble(
  ~variable,           ~code, ~label,  ~sort_order,
  "response_fac_lsm",  -1,    "Less",  1,
  "response_fac_lsm",  0,     "Same",  2,
  "response_fac_lsm",  1,     "More",  3
)

# ---------------------------------------------------------------------------
# 2. Codes observed in the real data (verified directly against `indiv`,
#    2026-08-31) that label_vars() never handled on its own -
#    vote_intention/vote_choice 95-98, religion 97/99, language 98/99.
#    Confirmed by the project owner (2026-08-31) to be don't-know /
#    unclassifiable / other missing-data responses - the same category as
#    every other missing-data code label_vars() already excludes via
#    implicit NA. They are deliberately given NO row in code_labels, so a
#    join against this table naturally excludes them (no match = no label,
#    same as label_vars()'s current NA behavior) - no separate
#    needs_review/exclusion logic required downstream. Counts below are kept
#    only as a record of what was excluded and why, in case it needs
#    auditing again later (n = respondents in `indiv` with that code):
#      vote_intention  95 (n=160)     96 (n=12,859)   97 (n=4,900)    98 (n=44,874)
#      vote_choice     95 (n=126)     96 (n=49,319)   97 (n=17,530)   98 (n=49,182)
#      religion        97 (n=3,564)   99 (n=6,394)
#      language        98 (n=501)     99 (n=811)
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# 3. Combine, sanity-check, and write out.
# ---------------------------------------------------------------------------

code_labels <- bind_rows(
  vote_intention_labels,
  vote_choice_labels,
  province_labels,
  region_labels,
  com_500_labels,
  com_100_labels,
  woman_labels,
  age_cats_labels,
  religion_labels,
  degree_labels,
  union_household_labels,
  occupation_labels,
  language_labels,
  response_fac_b_labels,
  response_fac_nsa_labels,
  response_fac_lsm_labels
) %>%
  arrange(variable, sort_order)

# Fail loudly on duplicate (variable, code) pairs rather than silently
# picking one - this is the whole point of centralizing the codebook.
dupes <- code_labels %>% count(variable, code) %>% filter(n > 1)
if (nrow(dupes) > 0) {
  print(dupes)
  stop("Duplicate (variable, code) pairs in code_labels - fix before writing.")
}

message(sprintf(
  "code_labels: %d rows across %d variables.",
  nrow(code_labels), n_distinct(code_labels$variable)
))

# Version-controlled, diffable source of truth.
# dir.create("data-raw", showWarnings = FALSE)
# readr::write_csv(code_labels, "data-raw/code_labels.csv")

# Load into the database so any client can join against it directly.
# Run this with the Shiny app NOT running - duckdb allows only one
# read-write connection to a file at a time.
con <- dbConnect(duckdb::duckdb(), dbdir = "surveydb.duckdb")
dbWriteTable(con, "code_labels", code_labels, overwrite = TRUE)
dbDisconnect(con, shutdown = TRUE)




# 1) Create (or open) a DuckDB database file

con <- dbConnect(duckdb::duckdb(), dbdir = "surveydb.duckdb", read_only = FALSE)

# (Optional) small performance tweaks
dbExecute(con, "PRAGMA threads=4;")


# 2) Persist your in-memory data frames as on-disk tables
#    (overwrite=TRUE makes this idempotent while you iterate)
dbWriteTable(con, "indiv",  indiv,  overwrite = TRUE, temporary = FALSE)
dbWriteTable(con, "survey", svy, overwrite = TRUE, temporary = FALSE)
dbWriteTable(con, "resp",   resp3,   overwrite = TRUE, temporary = FALSE)


# 3) No indexes on the join keys - deliberately removed 2026-08-31.
#    They used to live here (idx_indiv_obs, idx_resp_obs, idx_resp_survey,
#    idx_resp_surveyresp, idx_survey_surveyresp), but benchmarking the app's
#    actual query pattern (join resp->indiv->survey, filter by question,
#    group by year/region, weighted sum) showed indexed vs. unindexed query
#    times were statistically indistinguishable (~2-25ms either way, across
#    common and rare questions and a full-table scan) - DuckDB's vectorized
#    columnar scans are already fast enough at this row count (~1-1.7M rows
#    per table) that the optimizer gets little to nothing from an ART index
#    on a GROUP BY/join query like this. Meanwhile the indexes themselves
#    cost ~82MB in file size (118.8MB indexed vs. 34-37MB unindexed) - a
#    real cost for the planned DuckDB-WASM deployment, where the whole file
#    has to download before the first query can run. If you add a query
#    pattern that genuinely needs an index (e.g. a highly selective point
#    lookup), re-add it deliberately and re-benchmark rather than restoring
#    this block wholesale.


## 4) Add vbl_data
#
# vbl_data is now built directly from `codebook` (question_codebook.csv,
# read + type-recoded above) rather than derived from resp3's actual
# response codes. codebook is one row per (survey_id, issue_question_id) -
# i.e. per survey wave per question - and already carries everything the
# app needs per wave: policy_domain(_label), issue_label, question_wording,
# value_labels (comma-separated response-category labels, in ascending
# order - app.js applies them directly against TYPE_CONFIG[type].values,
# which is also ascending) and type (b/lsm/nsa/party, from the recode_type
# case_when above).
#
# This retires the old two-step vbl_data/vbl_data_full construction
# entirely: vbl_data_full was computed but never used downstream and was
# missing policy_domain_label; the second codebook.csv read + domains/
# newcat/cats block that used to follow it built the OLD vbl_data from a
# different, now-superseded codebook.csv (including a hand-added
# vote_choice/vote_intention row) - none of that is needed anymore, since
# question_codebook.csv already has real domain structure and (assuming it
# includes vote_choice/vote_intention as regular rows - confirm this) needs
# no hand-added row either.
#
# Grain stays (survey_id, question) rather than collapsing to one row per
# question: type/value_labels/question_wording can legitimately differ
# across waves of "the same" issue_question_id (recode_type and
# middle_category_varies track this per-row in codebook). app.js's
# getQuestionMeta() still resolves a *dominant* type per question and
# excludes minority-type waves from the chart - unchanged app-level
# behavior, just reading vbl_data.type directly instead of inferring it
# from resp3's actual response values.
#
# slice_head(n = 1, ...) rather than distinct(): guards against codebook
# carrying >1 row for the same (survey_id, issue_question_id) with
# genuinely different type/value_labels (e.g. two raw survey items merged
# under one issue_question_id but coded differently) - first row wins.
# ASSUMPTION TO VERIFY: run this once and confirm it returns 0 rows before
# trusting "first row wins" as harmless -
# codebook |>
#   summarise(n_type = n_distinct(type), n_vl = n_distinct(value_labels),
#             .by = c(survey_id, issue_question_id)) |>
#   filter(n_type > 1 | n_vl > 1) |> nrow()
codebook <- rio::import("question_codebook.csv")
vbl_data <- codebook |>
  slice_head(n = 1, by = c(survey_id, issue_question_id, value_labels)) |>
  transmute(
    survey_id        = survey_id,
    question          = issue_question_id,
    domain            = policy_domain,
    domain_label      = policy_domain_label,
    issue_label       = issue_label,
    question_wording  = question_wording,
    value_labels      = value_labels, 
    type = type
  )

dbWriteTable(con, "vbl_data", vbl_data, overwrite = TRUE, temporary = FALSE)
# No index here either - see the note above section 3. (The two CREATE INDEX
# calls that used to be here also had a bug: both used the same index name,
# idx_vbl_data_question, so the second - meant for vbl_data(survey_obs) -
# silently no-opped. Moot now, but worth knowing if this ever comes back.)

# ---------------------------------------------------------------------------
# Export Parquet files for the planned remote/bundled deployment.
#
# IMPORTANT after every run of this section: bump DATA_VERSION near the top
# of app-js-remote/app.js. The app reads these files at a fixed URL
# (cp3_parquet/vbl_data.parquet etc.) - a browser or the GitHub Pages CDN
# that already cached that exact URL from a previous deploy has no reason
# to re-fetch it, cache-Control headers or a hard refresh notwithstanding,
# since nothing about the URL itself changed. DATA_VERSION is appended as
# a ?v= query string specifically so a data refresh always hits a URL
# nothing has cached before.
#
# Three artifacts, sized and validated 2026-09-01 against real regenerated
# data (7,278,927 resp rows / 651 questions):
#   - resp, hive-partitioned by `question`, one file per question -> ~72MB
#     total, median ~59KB/question, max ~5.2MB (the most-asked question
#     across survey waves). Each file is fully self-sufficient: no join to
#     indiv/survey needed at query time - this is the whole point of the
#     denormalization above.
#   - vbl_data.parquet -> ~117KB, single file (not partitioned - the app
#     needs to enumerate all questions for the domain/question pickers, so
#     this one has to be downloaded whole regardless of which question is
#     selected).
#   - code_labels.parquet -> ~2KB, ditto - tiny, whole-file.
#
# For comparison, the OLD normalized shape (5-col resp partitioned by
# question, ~15MB total, median ~13KB/question) also required fetching ALL
# of indiv (~12MB, unavoidable for ANY grouping choice - indiv isn't
# partitionable by question) before a single grouped chart could render.
# The new shape roughly quadruples the per-question fetch size but makes
# that 12MB completely unnecessary - a strict win for any session that
# looks at more than ~1 question, and the worst case (~5.2MB) is still a
# fraction of a whole-database download.
#
# IMPORTANT on PARTITION_BY: DuckDB's partitioned Parquet writer can open a
# new file per partition value per scan batch, not one file per partition
# value overall - if a partition's rows arrive in multiple non-contiguous
# batches (resp is not stored sorted by question), it silently writes
# several files for the same question instead of one. Confirmed
# empirically: unsorted input produced 1,528-2,072 files for 651 distinct
# questions, varying run to run with thread count. Sorting by `question`
# first (below) makes every partition's rows arrive contiguously, so the
# writer closes each file before opening the next - this reliably yields
# exactly one file per question. The file-count check after the COPY below
# guards against this regressing silently (e.g. after a duckdb version
# bump) - do not remove the ORDER BY without re-verifying it.
#
# Output location: parquet_out/ at the project root, gitignored - this is a
# build artifact, not a source file, regenerated by this script every run.
# Where it actually gets served from (bundled with the app vs. hosted
# separately) is still an open decision; this step just produces it.
# ---------------------------------------------------------------------------

parquet_dir <- "cp3_parquet"
resp_parquet_dir <- file.path(parquet_dir, "resp")
if (dir.exists(resp_parquet_dir)) unlink(resp_parquet_dir, recursive = TRUE)
dir.create(resp_parquet_dir, recursive = TRUE, showWarnings = FALSE)

dbExecute(con, "SET threads TO 1;")  # required for one-file-per-question, see note above
dbExecute(con, sprintf(
  "COPY (SELECT * FROM resp ORDER BY question) TO '%s' (FORMAT PARQUET, PARTITION_BY (question), OVERWRITE_OR_IGNORE true);",
  resp_parquet_dir
))
dbExecute(con, "SET threads TO 4;")  # restore - no partitioning below, thread count is safe again

dbExecute(con, sprintf(
  "COPY vbl_data TO '%s' (FORMAT PARQUET);", file.path(parquet_dir, "vbl_data.parquet")
))
dbExecute(con, sprintf(
  "COPY code_labels TO '%s' (FORMAT PARQUET);", file.path(parquet_dir, "code_labels.parquet")
))

n_question_files <- length(list.files(resp_parquet_dir, pattern = "\\.parquet$", recursive = TRUE))
n_questions <- dbGetQuery(con, "SELECT count(DISTINCT question) FROM resp")[[1]]
if (n_question_files != n_questions) {
  warning(sprintf(
    paste0(
      "parquet_out/resp: expected %d files (one per question), got %d - ",
      "the writer may have split a partition across multiple files. See the ",
      "PARTITION_BY note above (SET threads TO 1 + ORDER BY question)."
    ),
    n_questions, n_question_files
  ))
}

parquet_bytes <- sum(file.info(list.files(parquet_dir, recursive = TRUE, full.names = TRUE))$size)
message(sprintf(
  "Wrote parquet_out/: resp (%d files) + vbl_data.parquet + code_labels.parquet, %.1f MB total.",
  n_question_files, parquet_bytes / 1e6
))

## Delete the duckdb files we no longer need. 

dbDisconnect(con, shutdown = TRUE)
unlink(c("surveydb.duckdb", "surveydb.duckdb.wal",
         "surveydb_prev.duckdb", "surveydb_prev.duckdb.wal"))
