# How to Add Data

Canadian Policy Preferences Project. Companion to `Codebook and Documentation.md`.

There are two ways to add a variable the dataset does not carry.

| | what it gives you | what it costs |
|---|---|---|
| **Left join** | your own copy, immediately | nothing in the release changes, so nobody else gets it |
| **Add a block to the code** | the variable becomes part of the dataset for everyone | you edit the codebooks and re-run the build |

Both rest on the same fact: **`response_id` is derived, not assigned.** It is the file name, minus its extension, plus the row number in that file padded to five digits, and the first data row is row 1. Anyone holding the original file can reconstruct it exactly, which is what makes a join possible without a lookup table.

---

## A worked example

Gallup asked **"Are you satisfied or dissatisfied with the direction the country is going?"** in 22 surveys between 1973 and 2000. It is not in the dataset. Adding it is a good example because it is realistically messy: the variable is named differently in every survey, and the missing codes are not consistent either.

Four of the 22, chosen to show the range:

| survey | variable | codes in the file |
|---|---|---|
| `cipo-357-E-1973-01_F1.sav` | `q6` | 1 SATISFIED · 2 DISSATISFIED · 3 UNDECIDED · 99 NOT STATED |
| `cipo-467-1-E-1982-11_F1.sav` | `q8` | 1 SATISFIED · 2 DISSATISFIED · 3 NO OPINION |
| `cipo-528-1-E-1987-12_F1.sav` | `q1` | 1 SATISFIED · 2 DISSATISFIED · 11 NOT STATED |
| `cipo-E-2000-09_F1.sav` | `cntry` | 1 SATISFIED · 2 DISSATISFIED · 3 DON'T KNOW · 4 REFUSED |

Three things to notice, because they are the reason a single rule will not do:

- The variable name changes every time — `q6`, `q8`, `q1`, `cntry`, and elsewhere `q4`, `q9a`, `q12a`, `apdir`, `dir`, `satcan`, `dcan`.
- "Don't know" is code 3 in most surveys, but the 1987 survey has no don't-know option at all and uses 11 for not stated.
- The 1973 survey puts not-stated at 99, the 2000 survey puts refused at 4.

Following the project's convention for a binary item: **1** the direction the label names, **0** the other side, **9999** don't know / no opinion / undecided, and `NA` for refused and not stated, which are not answers.

| survey | rule |
|---|---|
| 1973 | `1=1; 2=0; 3=9999; 99=NA` |
| 1982 | `1=1; 2=0; 3=9999` |
| 1987 | `1=1; 2=0; 11=NA` |
| 2000 | `1=1; 2=0; 3=9999; 4=NA` |

---

## Approach 1 — build response_ids and left join

Nothing in the release changes; you get a copy with your variable attached.

```r
library(tidyverse); library(haven); library(arrow)

RAW <- "1 Raw Data/1 Gallup/surveys"

# the question, survey by survey: file, variable, and how its codes map
spec <- tribble(
  ~file,                            ~var,     ~rule,
  "cipo-357-E-1973-01_F1.sav",      "q6",     c("1"=1, "2"=0, "3"=9999),
  "cipo-467-1-E-1982-11_F1.sav",    "q8",     c("1"=1, "2"=0, "3"=9999),
  "cipo-528-1-E-1987-12_F1.sav",    "q1",     c("1"=1, "2"=0),
  "cipo-E-2000-09_F1.sav",          "cntry",  c("1"=1, "2"=0, "3"=9999)
)
# codes absent from a rule fall through to NA, which is what should happen to
# "not stated" (99 in 1973, 11 in 1987) and "refused" (4 in 2000)

country_direction <- pmap_dfr(spec, function(file, var, rule) {
  raw <- read_sav(file.path(RAW, file), user_na = TRUE)
  tibble(
    # the whole of the response_id rule, in two lines
    response_id = paste0(tools::file_path_sans_ext(file), "_",
                         str_pad(seq_len(nrow(raw)), 5, pad = "0")),
    satisfied_direction = unname(rule[as.character(as.numeric(unclass(raw[[var]])))])
  )
})

dataset <- read_parquet("3 Clean Data/dataset.parquet") %>%
  left_join(country_direction, by = "response_id")
```

**Never reorder or filter the rows before numbering them.** The id is row position, so a `filter()` or `arrange()` above the `paste0()` silently shifts every respondent onto someone else's answers.

Check the join before using it. If the count of matched respondents is not what you expect, the file name or the row order is wrong:

```r
dataset %>%
  filter(!is.na(satisfied_direction)) %>%
  distinct(response_id, survey_id, year, satisfied_direction) %>%
  count(year, satisfied_direction)
#> 1973  0/1/9999   273 / 302 / 144
#> 1982  0/1/9999   830 / 190 /  46
#> 1987  0/1          488 / 416
#> 2000  0/1/9999   469 / 500 /  28
```

Those totals should equal the counts in the original files, and 6, 0, 101 and 3 respondents respectively should be `NA` — the not-stated and refused cases the rules deliberately drop.

Remember the dataset is long. Your variable is respondent-level, so it repeats down each respondent's rows. Take `distinct(response_id, .keep_all = TRUE)` before averaging it, or work from `country_direction` directly.

---

## Approach 2 — add a block to the recode code

The variable becomes part of the dataset, and the next person to run the build gets it.

**1. Put the files where the build can find them.** Anywhere under `1 Raw Data/`; lookup is by file name, so the folder structure below that is yours to choose. These four are already there.

**2. Give the item an id.** The pattern is `<source>_<domain>_<nnn>`. This is a Gallup item about satisfaction with the country's direction, so the domain is `dpin`, Democracy and Institutions, and the next free number is 003 — `gal_dpin_003`. Use the *same* id in all four surveys: the id is what makes it one series.

**3. Add the recode to each survey's block** in `2 Code/01_gallup.R`. Each survey already has a block; find it by its `survey_id` and add one line to `issues()`, creating that function if the block does not have one:

```r
survey(
  survey_id = "cipo-357-E-1973-01_F1.sav",
  source    = "Gallup",
  file_name = "cipo-357-E-1973-01_F1.sav",
  demographics = function(..d) {
    ..d %>% transmute(
      # ... the variables already there ...
    )
  },
  issues = function(d) {
    d %>% transmute(
      # Satisfied with direction of the country
      # q6: 1=SATISFIED 2=DISSATISFIED 3=UNDECIDED 99=NOT STATED
      gal_dpin_003 = recode_values(q6, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)
```

and the equivalent line in the other three, each with its own variable and codes:

```r
gal_dpin_003 = recode_values(q8,    1 ~ 1, 2 ~ 0, 3 ~ 9999)   # 1982
gal_dpin_003 = recode_values(q1,    1 ~ 1, 2 ~ 0)             # 1987, no DK option
gal_dpin_003 = recode_values(cntry, 1 ~ 1, 2 ~ 0, 3 ~ 9999)   # 2000
```

A code you do not list becomes `NA`, so not-stated and refused need no arm.

**4. Add four rows to `4 Documentation/question_codebook.csv`**, one per survey. The build validates against this file and will not silently accept a question it has never heard of:

| column | 1973 row |
|---|---|
| `survey_id` | `cipo-357-E-1973-01_F1.sav` |
| `issue_question_id` | `gal_dpin_003` |
| `original_question_id` | `q6` |
| `policy_domain` / `policy_domain_label` | `dpin` / `Democracy and Institutions` |
| `issue_label` | `Satisfied with direction of country` |
| `question_wording` | the synthesised wording, the same in all four rows |
| `question_wording_original` | the wording as the 1973 questionnaire put it |
| `question_coding` | `"1" = "SATISFIED", "2" = "DISSATISFIED", "3" = "UNDECIDED", "99" = "NOT STATED"` |
| `question_recoded` | `1=1; 2=0; 3=9999` |
| `rule_kind` | `value_map` |
| `recode_type` | `0/1/9999` |

`issue_label` and `question_wording` must match across the four rows — they describe the item, not the survey. `question_coding`, `question_recoded` and `recode_type` are per survey: the 1987 row has no 9999, so its `recode_type` is `0/1`.

**5. Run the build.**

```
Rscript "2 Code/99_build.R"
```

Read the validation block before trusting the result. A new item should show as four more questions produced, `missing: 0`, `unexpected: 0`, and no values outside `recode_type`. "Unexpected" means the code emits something the codebook does not declare; "missing" means the codebook declares something the code never produced. Either points at a typo in the id.

---

## Which one to use

Use the **left join** for exploratory work, for a variable only you need, or for anything you are still deciding how to code. It is reversible and touches nothing.

Use the **code block** when the variable should exist for everyone, when it belongs to a series others will want, or when the coding decision is settled and worth recording. It is the only route that survives a rebuild.

---

## Two things that will catch you out

**CES panel files.** One archive file holds several waves, so it is stored once per wave — `ces2004-6-8_2004wave.dta`, `ces2004-6-8_2006wave.dta`, `ces2004-6-8_2008wave.dta`. Use the per-wave name. The stem of the ids already in the dataset tells you which:

```r
dataset %>% filter(survey_id == "2004.dta") %>% slice(1) %>% pull(response_id)
#> "ces2004-6-8_2004wave_00001"
```

**Two Gallup polls carry no demographics.** `cipo-765t-E-1988-10_F1` and `cipo-103-2-E-1991-03_F1` contribute issue questions only, so their rows are `NA` across every demographic column. They are in the dataset, not missing from it.
