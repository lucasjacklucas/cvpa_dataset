###############################################################################
# 00_setup.R -- machinery. The recoding lives in 01_gallup.R, 02_environics.R,
# 03_ces.R and 04_bridge.R.
###############################################################################

library(tidyverse)
library(haven)
library(here)

# paths are resolved with here(), from the .here file at the bundle root.
# data/ holds the survey files (subfolders searched; symlinks are fine).

codebook_file <- here("codebook.csv")

.index <- NULL
.missing <- character()

find_survey_file <- function(file_name) {
  if (is.null(.index)) {
    if (!dir.exists(here("data")))
      stop("No 'data' folder at ", here(), call. = FALSE)
    f <- list.files(here("data"), recursive = TRUE, full.names = TRUE,
                    pattern = "[.](tab|dta|sav|csv)$")
    .index <<- split(f, basename(f))
  }
  hits <- .index[[file_name]]
  if (!length(hits)) return(NA_character_)
  hits[order(nchar(hits))][1]          # shallowest match wins
}

# registry: blocks register themselves, so there is no separate manifest

.registry <- new.env(parent = emptyenv())
.registry$surveys <- list()

survey <- function(survey_id, source, file_name, recode,
                   id_stem = NULL, wave = NULL) {
  .registry$surveys[[length(.registry$surveys) + 1L]] <- list(
    survey_id = survey_id, source = source, file_name = file_name,
    recode = recode,
    # stem = file name minus extension; panel waves pass their own
    id_stem = id_stem %||% tools::file_path_sans_ext(file_name),
    wave = wave %||% survey_id
  )
  invisible(NULL)
}

# readers

read_survey <- function(file) {
  d <- if (grepl("\\.tab$", file))      read_tsv(file, show_col_types = FALSE, progress = FALSE)
       else if (grepl("\\.csv$", file)) read_csv(file, show_col_types = FALSE, progress = FALSE)
       # user_na = TRUE: otherwise read_sav() turns codes like 4=DONT KNOW
       # into NA before we see them, emptying the 9999 category
       else if (grepl("\\.sav$", file)) read_sav(file, user_na = TRUE)
       else                             read_dta(file)

  # unclass(), not zap_labels(): zap_labels() honours declared na_values and
  # would return NA for exactly the codes the rules need
  d %>% mutate(across(where(haven::is.labelled), ~ as.numeric(unclass(.x))))
}

# run

run_survey <- function(s) {
  path <- find_survey_file(s$file_name)
  if (is.na(path)) {
    .missing <<- unique(c(.missing, s$file_name))
    return(NULL)
  }

  raw <- read_survey(path) %>%
    mutate(response_id = paste(s$id_stem,
                               str_pad(row_number(), 5, pad = "0"),
                               sep = "_"))

  s$recode(raw) %>%
    mutate(response_id = raw$response_id, .before = 1) %>%
    pivot_longer(-response_id, names_to = "issue_question_id", values_to = "value") %>%
    filter(!is.na(value)) %>%
    mutate(survey_id = s$survey_id, survey_id_main = s$wave, source = s$source,
           .after = response_id)
}

run_all <- function(surveys = .registry$surveys) {
  .missing <<- character()
  out <- map(surveys, run_survey) %>% bind_rows()
  found <- length(surveys) - length(.missing)
  message("recoded ", found, " of ", length(surveys), " survey blocks")
  if (length(.missing))
    message("skipped (file not found): ", length(.missing),
            " -- see missing_files()")
  out
}

missing_files <- function() .missing

# show_survey(): codebook rows for one survey beside the values it produced

codebook <- function() {
  read_csv(codebook_file, show_col_types = FALSE, progress = FALSE)
}

show_survey <- function(survey_id, cb = codebook()) {
  s <- keep(.registry$surveys, ~ .x$survey_id == survey_id)[[1]]
  cat("\n", survey_id, " (", s$source, ")\n", sep = "")
  cat("file: ", find_survey_file(s$file_name), "\n\n", sep = "")

  cb %>%
    filter(survey_id == !!survey_id) %>%
    select(original_question_id, issue_question_id, issue_label,
           question_recoded, recode_type) %>%
    print(n = Inf, width = Inf)

  cat("\nrecoded values as produced:\n")
  run_survey(s) %>% count(issue_question_id, value) %>% print(n = Inf)
}

# checks, all against the codebook

# a repeated name in transmute() silently keeps only the last assignment,
# which is how split-ballot forms lose half their data
check_duplicate_assignments <- function() {
  bad <- map_dfr(.registry$surveys, function(s) {
    nm <- names(formals(s$recode))
    body_txt <- paste(deparse(body(s$recode)), collapse = "\n")
    v <- str_match_all(body_txt, "([a-z]{3}_[a-z]{4}_\\d{3}) = ")[[1]][, 2]
    d <- unique(v[duplicated(v)])
    if (length(d)) tibble(survey_id = s$survey_id, wave = s$wave, variable = d)
    else NULL
  })
  if (nrow(bad)) {
    cat("\nDUPLICATE ASSIGNMENTS -- these silently discard data:\n")
    print(bad, n = Inf)
  }
  invisible(bad)
}

validate <- function(out, cb = codebook()) {
  # only surveys that ran are in scope
  ran <- .registry$surveys %>%
    keep(~ !.x$file_name %in% .missing) %>%
    map_chr("survey_id") %>% unique()

  expected <- cb %>%
    filter(survey_id %in% ran) %>%
    distinct(survey_id, issue_question_id)
  produced <- out %>% distinct(survey_id, issue_question_id)

  missing <- anti_join(expected, produced, by = c("survey_id", "issue_question_id"))
  extra   <- anti_join(produced, expected, by = c("survey_id", "issue_question_id"))

  allowed <- cb %>%
    filter(survey_id %in% ran) %>%
    distinct(survey_id, issue_question_id, recode_type) %>%
    separate_longer_delim(recode_type, "/") %>%
    filter(recode_type != "NA") %>%
    mutate(value = as.numeric(recode_type))
  stray <- out %>%
    semi_join(allowed, by = c("survey_id", "issue_question_id")) %>%
    anti_join(allowed, by = c("survey_id", "issue_question_id", "value")) %>%
    count(survey_id, issue_question_id, value)

  cat("\n\u2500\u2500 validation \u2500\u2500\n")
  blocks_run <- length(.registry$surveys) - length(.missing)
  cat("blocks run:         ", blocks_run, " of ", length(.registry$surveys),
      "  (", length(ran), " distinct surveys)\n", sep = "")
  cat("variables expected: ", nrow(expected), "\n", sep = "")
  cat("variables produced: ", nrow(produced), "\n", sep = "")
  cat("missing:            ", nrow(missing), "\n", sep = "")
  cat("unexpected:         ", nrow(extra), "\n", sep = "")
  cat("values outside recode_type: ", nrow(stray), "\n", sep = "")
  dup <- check_duplicate_assignments()
  cat("duplicate assignments:", nrow(dup), "\n")
  if (nrow(missing)) print(missing, n = Inf)
  if (nrow(extra))   print(extra, n = Inf)
  if (nrow(stray))   print(stray, n = Inf)
  invisible(list(missing = missing, extra = extra, stray = stray))
}

# raw codes no rule arm mentions -- recode_values() sends these to NA silently

unmapped_codes <- function(surveys = .registry$surveys, cb = codebook()) {
  map(surveys, function(s) {
    path <- find_survey_file(s$file_name)
    if (is.na(path)) return(NULL)
    raw <- read_survey(path)
    rows <- cb %>% filter(survey_id == s$survey_id, survey_id_main == s$wave)
    map(seq_len(nrow(rows)), function(i) {
      v <- rows$original_question_id[i]
      if (!v %in% names(raw)) return(NULL)
      named <- rows$question_recoded[i] %>%
        str_remove("\\[.*?\\]\\s*$") %>% str_split(";") %>% pluck(1) %>%
        str_extract("^[^=]+") %>% str_trim() %>%
        map(function(x) if (str_detect(x, ":")) {
              b <- as.numeric(str_split(x, ":")[[1]]); seq(b[1], b[2])
            } else suppressWarnings(as.numeric(x))) %>%
        unlist() %>% na.omit()
      tibble(value = as.numeric(raw[[v]])) %>%
        filter(!is.na(value), !value %in% named) %>%
        count(value) %>%
        mutate(survey_id = s$survey_id, variable = v,
               issue_question_id = rows$issue_question_id[i], .before = 1)
    }) %>% bind_rows()
  }) %>% bind_rows()
}

`%||%` <- function(a, b) if (is.null(a)) b else a
