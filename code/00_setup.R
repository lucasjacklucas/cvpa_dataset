###############################################################################
# 00_setup.R -- machinery. The recoding itself lives in 01_gallup.R,
# 02_ces.R, 03_environics.R, 04_pollara.R and 05_bridge.R: one block per
# survey, each holding that survey's demographic rules and its issue rules.
#
# Paths are resolved from this file's own location. ROOT was the obvious
# choice and the wrong one: it returns whatever project the R session happens
# to be rooted in, so running this from a session opened elsewhere sends every
# path into that other project. 2 Code/ sits directly under the Dataset folder,
# which holds:
#   1 Raw Data/        the original survey files, by source
#   3 Clean Data/      output
#   4 Documentation/   the two codebooks the validation checks against
#   5 Supporting Data/ inputs that are not survey files
###############################################################################

library(tidyverse)
library(haven)

# recode_values() must be dplyr's: datawizard exports one that silently returns
# the input unchanged. Bound below so it wins whatever else the session attaches.

if (utils::packageVersion("dplyr") < "1.2.0")
  stop("This build needs dplyr >= 1.2.0 for recode_values(). You have ",
       utils::packageVersion("dplyr"),
       ". Run install.packages(\"dplyr\") and start a fresh session.", call. = FALSE)

recode_values <- dplyr::recode_values
coalesce      <- dplyr::coalesce
case_when     <- dplyr::case_when
transmute     <- dplyr::transmute

`%||%` <- function(a, b) if (is.null(a)) b else a

# the directory holding the file being run, whether by Rscript or by source()
script_dir <- function() {
  a <- commandArgs(trailingOnly = FALSE)
  f <- sub("^--file=", "", a[grep("^--file=", a)])
  # Rscript writes every space in --file= as "~+~", which matters here because
  # the path to this folder has several
  f <- gsub("~+~", " ", f, fixed = TRUE)
  f <- f[file.exists(f)]
  if (length(f)) return(dirname(normalizePath(f[[1]])))
  for (i in rev(seq_len(sys.nframe()))) {
    of <- sys.frame(i)$ofile
    if (!is.null(of) && file.exists(of)) return(dirname(normalizePath(of)))
  }
  NULL
}

# the Dataset folder: the one that holds both 1 Raw Data and 2 Code
dataset_root <- function() {
  sd <- script_dir()
  cand <- c(if (!is.null(sd)) c(dirname(sd), sd), getwd(), dirname(getwd()))
  ok <- cand[dir.exists(file.path(cand, "1 Raw Data")) &
             dir.exists(file.path(cand, "2 Code"))]
  if (!length(ok))
    stop("Cannot find the Dataset folder -- the one holding '1 Raw Data' and ",
         "'2 Code'.\n  Run it as:  Rscript \"2 Code/99_build.R\"\n",
         "  or setwd() to the Dataset folder first.\n  Looked in: ",
         paste(unique(cand), collapse = ", "), call. = FALSE)
  normalizePath(ok[[1]])
}

ROOT  <- dataset_root()
dpath <- function(...) file.path(ROOT, ...)
message("dataset root: ", ROOT)

demographics_codebook_file <- dpath("4 Documentation", "demographics_codebook.csv")
question_codebook_file     <- dpath("4 Documentation", "question_codebook.csv")

# Vote choice and vote intention are recoded alongside the other demographic
# and vote variables, but in the finished dataset they are responses like any
# policy item: they become rows, under a policy domain of their own.
VOTE_ITEMS <- c("vote_choice", "vote_intention")

# ---------------------------------------------------------------- finding files

.index <- NULL
.missing <- character()

find_survey_file <- function(file_name) {
  if (is.null(.index)) {
    if (!dir.exists(dpath("1 Raw Data")))
      stop("No '1 Raw Data' folder at ", ROOT, call. = FALSE)
    f <- list.files(dpath("1 Raw Data"), recursive = TRUE, full.names = TRUE,
                    pattern = "[.](tab|dta|sav|csv)$")
    .index <<- split(f, basename(f))
  }
  hits <- .index[[file_name]]
  if (!length(hits)) return(NA_character_)
  hits[order(nchar(hits))][1]          # shallowest match wins
}

# ---------------------------------------------------------------- the registry

# Blocks register themselves as the files are sourced, so there is no separate
# manifest to fall out of step with them.

.registry <- new.env(parent = emptyenv())
.registry$surveys <- list()

# survey_id    the survey, which for a panel file means the wave
# file_name    the file to read. One survey, one file: the two CES panel files
#              are archived once per wave so that this holds everywhere.
# file_id      the physical file as the issue tables named it; kept only so the
#              older issue outputs can still be matched against this one
#
# response_id is always the file name minus its extension plus the row number
# padded to five digits. There are no exceptions, so anyone with the raw file
# can build the ids and join to the dataset without knowing anything else.
survey <- function(survey_id, source, file_name,
                   demographics = NULL, issues = NULL, file_id = NULL) {
  .registry$surveys[[length(.registry$surveys) + 1L]] <- list(
    survey_id = survey_id, source = source, file_name = file_name,
    demographics = demographics, issues = issues,
    id_stem = tools::file_path_sans_ext(file_name),
    file_id = file_id %||% survey_id)
  invisible(NULL)
}

# ---------------------------------------------------------------- reading

read_survey <- function(file) {
  d <- if (grepl("\\.tab$", file))      read_tsv(file, show_col_types = FALSE, progress = FALSE)
       else if (grepl("\\.csv$", file)) read_csv(file, show_col_types = FALSE, progress = FALSE,
                                                 guess_max = 50000)
       # user_na = TRUE: otherwise read_sav() turns codes like 4 = DON'T KNOW
       # into NA before any rule sees them
       else if (grepl("\\.sav$", file)) read_sav(file, user_na = TRUE)
       else                             read_dta(file)
  # unclass(), not zap_labels(): zap_labels() honours declared na_values and
  # would return NA for exactly the codes the rules need
  d %>% mutate(across(where(haven::is.labelled), ~ as.numeric(unclass(.x))))
}

# ---------------------------------------------------------------- recode helpers

# pass a value through unchanged, but only inside the range the original
# recode actually produced; anything outside is a missing code
in_range <- function(x, lo, hi) { x <- as.numeric(x); x[x < lo | x > hi] <- NA_real_; x }

# a two-way lookup: the answer depends on the combination of two variables
pair_recode <- function(x, y, map) unname(map[paste(as.numeric(x), as.numeric(y), sep = "|")])

# a two-part question: inside the ambiguous values of the first variable,
# the second decides
split_on <- function(x, base, amb, alt) ifelse(x %in% amb, alt, base)

# was this box ticked? tick-box batteries code selection as 1 and non-selection
# as -99 or 0 depending on the study, and NA where the block was not shown
sel <- function(x) { v <- suppressWarnings(as.numeric(x)); !is.na(v) & v == 1 }

# ---------------------------------------------------------------- running

# One read of the survey file feeds both rule sets, so a respondent's row and
# that respondent's responses carry the same response_id by construction.
#
# Returns two frames:
#   respondents  one row per respondent, the demographic variables
#   responses    one row per answer -- the policy items, plus vote choice and
#                vote intention lifted out of the demographic frame
run_survey <- function(s) {
  path <- find_survey_file(s$file_name)
  if (is.na(path)) { .missing <<- unique(c(.missing, s$file_name)); return(NULL) }

  raw <- read_survey(path) %>%
    mutate(response_id = paste(s$id_stem, str_pad(row_number(), 5, pad = "0"), sep = "_"))

  ids <- function(x) x %>% mutate(survey_id = s$survey_id, source = s$source,
                                  .after = response_id)

  respondents <- NULL
  vote <- NULL
  if (!is.null(s$demographics)) {
    d <- s$demographics(raw) %>% mutate(response_id = raw$response_id, .before = 1)
    have <- intersect(VOTE_ITEMS, names(d))
    if (length(have))
      vote <- d %>% select(response_id, all_of(have)) %>%
        pivot_longer(-response_id, names_to = "question_id", values_to = "value") %>%
        filter(!is.na(value)) %>% ids()
    respondents <- d %>% select(-any_of(VOTE_ITEMS)) %>% ids()
  }

  issues <- NULL
  if (!is.null(s$issues))
    issues <- s$issues(raw) %>%
      mutate(response_id = raw$response_id, .before = 1) %>%
      pivot_longer(-response_id, names_to = "question_id", values_to = "value") %>%
      filter(!is.na(value)) %>% ids()

  list(respondents = respondents, responses = bind_rows(vote, issues))
}

run_all <- function(surveys = .registry$surveys) {
  .missing <<- character()
  out <- map(surveys, run_survey)
  message("recoded ", length(surveys) - length(.missing), " of ", length(surveys),
          " survey blocks")
  if (length(.missing))
    message("skipped (file not found): ", length(.missing), " -- see missing_files()")
  list(respondents = map(out, "respondents") %>% bind_rows(),
       responses   = map(out, "responses")   %>% bind_rows())
}

missing_files <- function() .missing

# ---------------------------------------------------------------- checks

ran_surveys <- function() {
  .registry$surveys %>% keep(~ !.x$file_name %in% .missing)
}

# A repeated name inside transmute() silently keeps only the last assignment,
# which is how a split-ballot form loses half its data.
check_duplicate_assignments <- function() {
  bad <- map_dfr(.registry$surveys, function(s) {
    txt <- c(if (!is.null(s$demographics)) paste(deparse(body(s$demographics)), collapse = "\n"),
             if (!is.null(s$issues))       paste(deparse(body(s$issues)),       collapse = "\n"))
    v <- str_match_all(paste(txt, collapse = "\n"), "([A-Za-z_][A-Za-z0-9_]*) = ")[[1]][, 2]
    v <- v[str_detect(v, "^[a-z]{3}_[a-z]{4}_\\d{3}$")]
    d <- unique(v[duplicated(v)])
    if (length(d)) tibble(survey_id = s$survey_id, variable = d) else NULL
  })
  if (nrow(bad)) { cat("\nDUPLICATE ASSIGNMENTS -- these silently discard data:\n"); print(bad, n = Inf) }
  invisible(bad)
}

# Did every rule in the demographics codebook produce something? Vote choice
# and vote intention are checked with the other response items, not here.
validate_respondents <- function(out) {
  cb <- read_csv(demographics_codebook_file, show_col_types = FALSE, progress = FALSE, guess_max = Inf) %>%
    filter(!source_kind %in% c("unknown", "external", "unavailable"),
           !variable %in% VOTE_ITEMS) %>%
    distinct(survey_id, variable)
  ran <- map_chr(ran_surveys(), "survey_id")

  # one variable at a time: cheaper than a 19-million-row pivot
  produced <- map_dfr(setdiff(names(out), c("response_id", "source", "survey_id")),
                      function(v) out %>% filter(!is.na(.data[[v]])) %>%
                        distinct(survey_id) %>% mutate(variable = v))

  expected <- cb %>% filter(survey_id %in% ran)
  missing <- anti_join(expected, produced, by = c("survey_id", "variable"))

  cat("\n-- respondents --\n")
  cat("rows:                ", format(nrow(out), big.mark = ","), "\n", sep = "")
  cat("surveys:             ", n_distinct(out$survey_id), "\n", sep = "")
  cat("rules in codebook:   ", nrow(expected), "\n", sep = "")
  cat("rules that produced: ", nrow(expected) - nrow(missing), "\n", sep = "")
  cat("produced nothing:    ", nrow(missing), "\n", sep = "")
  if (nrow(missing)) print(missing, n = Inf)
  invisible(missing)
}

# Did every question in the question codebook appear, and only with the values
# its recode_type declares?
validate_responses <- function(out) {
  cb <- read_csv(question_codebook_file, show_col_types = FALSE, progress = FALSE, guess_max = Inf)
  ran <- map_chr(ran_surveys(), "survey_id")

  expected <- cb %>% filter(survey_id %in% ran) %>% distinct(survey_id, question_id = issue_question_id)
  produced <- out %>% distinct(survey_id, question_id)
  missing <- anti_join(expected, produced, by = c("survey_id", "question_id"))
  extra   <- anti_join(produced, expected, by = c("survey_id", "question_id"))

  allowed <- cb %>% filter(survey_id %in% ran) %>%
    distinct(survey_id, question_id = issue_question_id, recode_type) %>%
    separate_longer_delim(recode_type, "/") %>%
    filter(recode_type != "NA") %>% mutate(value = as.numeric(recode_type))
  stray <- out %>%
    semi_join(allowed, by = c("survey_id", "question_id")) %>%
    anti_join(allowed, by = c("survey_id", "question_id", "value")) %>%
    count(survey_id, question_id, value)

  cat("\n-- responses --\n")
  cat("rows:                      ", format(nrow(out), big.mark = ","), "\n", sep = "")
  cat("questions expected:        ", nrow(expected), "\n", sep = "")
  cat("questions produced:        ", nrow(produced), "\n", sep = "")
  cat("missing:                   ", nrow(missing), "\n", sep = "")
  cat("unexpected:                ", nrow(extra), "\n", sep = "")
  cat("values outside recode_type:", nrow(stray), "\n")
  if (nrow(missing)) print(missing, n = Inf)
  if (nrow(extra))   print(extra, n = Inf)
  if (nrow(stray))   print(stray, n = Inf)
  invisible(list(missing = missing, extra = extra, stray = stray))
}
