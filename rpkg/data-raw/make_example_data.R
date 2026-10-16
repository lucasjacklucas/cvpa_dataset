## Builds inst/extdata/cp3_example/, the small local copy of the cp3 Parquet
## layout that cvpa's help-page examples run against (see cvpa_example_url()).
##
## It has the same layout as the hosted data at
## https://policyattitudes.ca/cp3_parquet/ -- vbl_data.parquet,
## code_labels.parquet and resp/question=<code>/data_0.parquet -- but only a
## few questions, and a fixed random sample of respondents per survey year.
## It is for illustrating the functions, NOT for analysis.
##
## Run from the rpkg/ directory after rebuilding the site data
## (code/rebuild/populate_db.R in the repo root):
##   source("data-raw/make_example_data.R")

src <- "../site/static/cp3_parquet"
out <- "inst/extdata/cp3_example"
questions <- c("bri_econ_013", "env_econ_027", "vote_choice", "vote_intention")
per_year <- 200L

stopifnot(dir.exists(src))
unlink(out, recursive = TRUE)
dir.create(file.path(out, "resp"), recursive = TRUE)

vbl <- nanoparquet::read_parquet(file.path(src, "vbl_data.parquet"))
stopifnot(all(questions %in% vbl$question))
nanoparquet::write_parquet(vbl[vbl$question %in% questions, ],
                           file.path(out, "vbl_data.parquet"))
file.copy(file.path(src, "code_labels.parquet"), file.path(out, "code_labels.parquet"))

set.seed(2026)
for (q in questions) {
  d <- nanoparquet::read_parquet(file.path(src, "resp", paste0("question=", q), "data_0.parquet"))
  keep <- unlist(lapply(split(seq_len(nrow(d)), d$year), function(i) {
    if (length(i) > per_year) sample(i, per_year) else i
  }), use.names = FALSE)
  d <- d[sort(keep), ]
  dir.create(file.path(out, "resp", paste0("question=", q)), recursive = TRUE)
  nanoparquet::write_parquet(d, file.path(out, "resp", paste0("question=", q), "data_0.parquet"))
}
message("Wrote ", out, " (", round(sum(file.size(list.files(out, recursive = TRUE, full.names = TRUE))) / 1024), " KB)")
