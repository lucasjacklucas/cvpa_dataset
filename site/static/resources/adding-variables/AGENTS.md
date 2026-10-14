# Instructions for AI coding assistants: adding variables to the CVPA dataset

These instructions are for an AI coding assistant (such as Claude Code or Codex) helping a user add a question from an original survey file to the Canadian Voting and Policy Attitudes (CVPA) dataset. The full tutorial is at https://policyattitudes.ca/resources/adding-variables/. Read it if you can.

Your job is to do the mechanical work carefully, and to **stop and ask the user whenever a choice affects what the data mean**. The user is the researcher. Choices about what a question measures, how it is recoded, and which respondents count belong to them, not to you. When in doubt, ask.

## Background you need

### The CVPA dataset

- `dataset.parquet` is at https://github.com/lucasjacklucas/cvpa_dataset/raw/main/dataset.parquet (about 14 MB; set `options(timeout = 600)` in R before downloading). It has one row per answer, so a respondent appears once for every question they answered. Use `distinct(response_id, .keep_all = TRUE)` to get one row per respondent.
- Demographics (`gender`, `age_cats`, `degree`, `language`, `region`, `religion`, `union_household`, and others) are stored as numeric codes. Look up what each code means in `Codebook and Documentation.md` in the same repository. Never guess a code's meaning.
- Policy answers are in `value`, identified by `question_id`. In `value`, 9999 means don't know or no opinion. For demographics, 97, 98, and 99 are non-substantive answers.
- `question_codebook.csv` in the same repository lists, for every survey and question, the original variable (`original_question_id`) and the recode rule CVPA applied (`question_recoded`), in the form `1:2=1; 3=0; 4:5=-1; 8=9999; 9=NA`. A code the rule does not mention became `NA`.
- `dataset.parquet` has no survey weights. Weights come from the original survey files.

### How respondents are identified

`response_id` is **the original file name without its extension, plus an underscore, plus the respondent's row number in that file, padded to five digits**. The first data row is row 1. For example, row 7 of `cipo-E-1994-09_F1.sav` is `cipo-E-1994-09_F1_00007`.

- To find which file a respondent came from, drop the final `_` and five digits from their `response_id`. **Do not use the `survey_id` column as the file name.** It matches the file name for Gallup surveys, but for the Canadian Election Study and Democracy Checkup it is a short label such as `2006.dta`.
- The file name must be the original name exactly, including any spaces or plus signs (for example, `2019+Canadian+Election+Study+-+Online+Survey+v1.0`).

### Canadian Election Study panel files

Two CES files are panels, each a single file holding several waves:

| file | waves | ID prefix in CVPA |
|---|---|---|
| `CES-E-1974-1980_F1.dta` | 1974, 1979, 1980 | `CES-E-1974-1980_F1_1974wave_`, `_1979wave_`, `_1980wave_` |
| `ces2004-6-8.dta` | 2004, 2006, 2008 | `ces2004-6-8_2004wave_`, `_2006wave_`, `_2008wave_` |

- The wave is inserted after the file name. No file with the wave in its name exists to download.
- The row number is the row in the full panel file. The same person has the same row number in every wave they took part in.
- Each wave contains only some of the file's rows, so most rows will not match a given wave. Check the match from the CVPA side instead: every CVPA respondent in the wave should find a row.
- The 2004–2008 Borealis zip contains two Stata files. Use `ces2004-6-8.dta`, which is the file CVPA was built from. `CES-E-2004-2008_F1.dta` has the same rows in the same order but codes some missing values differently.
- In the 2004–2008 panel, `survey_type040608` records which parts of the study (campaign, post-election, mail-back, in each year) each respondent completed. For example, returning panel respondents in 2008 did only the post-election survey. Check it before choosing a variable.

### Where the original files are

- Gallup and the older CES files are on Borealis (https://borealisdata.ca). Download a file with `https://borealisdata.ca/api/access/datafile/<file_id>?format=original`. Many older CES files come inside a `_STATA.zip`.
- Recent CES and Democracy Checkup files are on Harvard Dataverse (https://dataverse.harvard.edu).
- Pollara surveys are restricted, and the 2026 Bridge Survey has not been deposited. They cannot be joined this way.

## Rules you must always follow

1. **Never filter, sort, deduplicate, or drop rows before numbering them.** Build `response_id` from the row order of the file exactly as read. Number first; filter afterwards.
2. **Read SPSS files with `haven::read_sav(file, user_na = TRUE)`**, so that codes the file declares as missing stay visible instead of silently becoming `NA`.
3. **Never change the ID rule, rename files, or adjust row numbers to make more rows match.** If the match is wrong, stop, report what you found, and ask the user.
4. **Never recode a variable without the user's approval** (see the checkpoints below).
5. **Never modify `dataset.parquet` or the original survey files.** Write new outputs to new files.
6. **Record every decision** the user makes in a file called `decisions.md` in the project folder: the files and variables used, the recode for each file, how non-answers were treated, the weights, and anything excluded. Keep it up to date as you go.

## Checkpoints: stop and ask the user

At each of these points, show the user what you found and wait for their answer before continuing.

### 1. Which variable is the question

For each survey file, identify the variable you think holds the question. Show the user the variable name, its label, and, where available, the question wording from the survey documentation. Ask them to confirm. Variable names usually change from survey to survey, and similar-looking questions (for example, "honesty" versus "ethical standards", or a campaign-period versus post-election version) may or may not be the same question. That is the user's call.

### 2. How to recode it

For each file, show the user a table of **every value that actually occurs** in the variable, with its count and its value label. Point out:

- values that appear in the data but have no label;
- codes whose meaning differs between files (for example, the same code meaning "not stated" in one survey and "don't know" in another);
- differences in the response categories or their order between files.

Then ask the user:

- how the substantive categories should be coded (direction, and whether any should be combined);
- how to treat don't know, no opinion, refused, not stated, and blanks (for example, as `NA`, or kept as a separate code);
- whether any differences between files mean the question should not be pooled.

Propose a rule if it helps, but do not apply it until the user agrees. Write the agreed rule for each file into `decisions.md`.

### 3. Weights

List the weight variables in each file, with their labels, and say which files have none. Ask the user which weight to use, and what to do for files without one.

### 4. The match

After joining, report the match in both directions: how many rows of the original file found a CVPA respondent, and how many CVPA respondents from that survey found a row in the file. For non-panel Gallup files, every row should match. For other files, some rows may legitimately be absent from CVPA. If the numbers look wrong, stop and tell the user. Do not try to fix the IDs.

### 5. Alignment check

Before any analysis, confirm that the IDs line up with the right people, not just that they match:

1. Find a question CVPA already includes from the same survey: look up the survey's `survey_id` in `dataset.parquet`, then find rows in `question_codebook.csv` with that `survey_id` and `rule_kind` equal to `value_map`.
2. Rebuild that question from the original file, using your own `response_id`s and the rule in `question_recoded`.
3. Compare your values with CVPA's `value` for the same `response_id`s. They should agree for every respondent.

If the survey has no `value_map` question in CVPA (some surveys contribute only vote intention), use a demographic instead, such as `gender` or `age_cats`: `demographics_codebook.csv` in the same repository gives the source variable and rule for each survey.

Report the result to the user. If they don't agree, stop: the rows are misaligned, and any analysis would attach answers to the wrong people.

### 6. Analysis choices

Ask the user before making substantive analysis choices, such as which categories count as "agree" or "high", which groups to compare, or whether to pool surveys from the same year.

## Working style

- Explain what you are about to do before doing it, in plain language. The user may be new to R.
- Prefer simple, readable code that the user can follow and rerun: one file at a time with `mutate()`, before generalizing to a function or loop over several files.
- When you report counts or results, show the code that produced them.
- If something in the data surprises you, say so and ask, rather than working around it.
