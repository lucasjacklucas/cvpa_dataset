# Extracts the R code from a Quarto tutorial into a plain .R script for
# readers to download. Each "## " heading becomes a section comment; chunks
# marked `#| purl: false` are skipped, and chunks marked `#| eval: false`
# (e.g. one-time installs) are kept but commented out.
#
# Called by render_tutorials.sh:
#   Rscript site/scripts/qmd_to_r.R <input.qmd> <output.R>

args <- commandArgs(trailingOnly = TRUE)
lines <- readLines(args[1])

title <- sub('^title: *"?(.*?)"?$', "\\1", grep("^title:", lines, value = TRUE)[1])
name <- tools::file_path_sans_ext(basename(args[1]))
out <- c(paste("#", title),
         paste0("# Code from https://policyattitudes.ca/resources/", name, "/"),
         "")
pending_heading <- NULL  # emitted only once code follows it

in_chunk <- FALSE
chunk <- character()
for (line in lines) {
  if (!in_chunk && grepl("^```\\{r", line)) {
    in_chunk <- TRUE
    chunk <- character()
  } else if (in_chunk && grepl("^```\\s*$", line)) {
    in_chunk <- FALSE
    opts <- grep("^#\\|", chunk, value = TRUE)
    code <- chunk[!grepl("^#\\|", chunk)]
    if (any(grepl("purl:\\s*false", opts))) next
    if (any(grepl("eval:\\s*false", opts))) {
      code <- c("# Run once to install:", paste("#", code))
    }
    out <- c(out, pending_heading, code, "")
    pending_heading <- NULL
  } else if (in_chunk) {
    chunk <- c(chunk, line)
  } else if (grepl("^## ", line)) {
    heading <- sub("^## ", "", line)
    pending_heading <- c(paste0("# ", heading, " ", strrep("-", max(4, 72 - nchar(heading)))), "")
  }
}

writeLines(out, args[2])
