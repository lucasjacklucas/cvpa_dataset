# CVPA 2026 Bridge Survey (minimal version)

`bridge_clean.csv` is a minimal version of the CVPA 2026 Bridge Survey, which is not yet publicly archived. It contains every respondent (7,016), in the original row order, but only the 67 variables the CVPA build reads: birth year (`age`), `education`, `gender`, `mother_tongue`, `province`, `union`, `vote_intention`, and the 60 policy questions (`core_*` and `addt_*`).

It is enough to rebuild the Bridge Survey's part of `dataset.parquet` exactly (see `code/rebuild/`), and its rows line up with CVPA's `response_id`s (`bridge_clean_00001` is row 1). How each variable is recoded is in `code/05_bridge.R` and the two codebooks.

The file name is part of every respondent's `response_id`, so keep it as `bridge_clean.csv`.
