# Codebook and Documentation

Canadian Policy Preferences Project. This document describes `dataset.parquet` and the two machine-readable codebooks beside it. To add data of your own, see `How to Add Data.md`.

The dataset holds 9,198,156 rows: 1,010,004 respondents across 672 surveys, 1945 to 2026, from five sources.

| source | years |
|---|---|
| Gallup Canada | 1945–2000 |
| Canadian Election Study and C-DEM Democracy Checkup | 1965–2024 |
| Environics Focus Canada | 1978–2012 |
| Pollara Perspectives Canada | 1992–2002 |
| CVPA Bridge Survey | 2026 |

Year coverage is not continuous: 71 of the 82 calendar years carry data. Gallup is missing 1946–1948, 1950 and 1952. Environics ends in 2012 and the Democracy Checkup begins in 2019, so 2013, 2014 and 2016–2018 are empty — 2015 is carried by the Canadian Election Study alone. 2025 is also empty, between the last Democracy Checkup wave and the 2026 bridge survey.

The missing years in full are 1946, 1947, 1948, 1950, 1952, 2013, 2014, 2016, 2017, 2018 and 2025.

Throughout, a value that a survey does not supply is `NA`. Codes such as 97, 98 and 99 mean the respondent was asked and gave a non-substantive answer; they are not the same as `NA` and should usually be excluded before analysis.

---

## The shape of the data

**One row per answer.** A respondent appears once for every question they answered, so their demographic values repeat down their rows. 

Each row carries four things: who the respondent is, which survey they came from, which question is being answered, and the recoded value.

| | columns |
|---|---|
| respondent and survey | `response_id`, `survey_id`, `source`, `year`, `start_date`, `end_date`, `date_source` |
| demographics | `gender`, `age`, `age_cats`, `region`, `province`, `com_100`, `com_500`, `degree`, `occupation`, `religion`, `union_household`, `language`, `language_var`, `language_home`, `mother_tongue`, `survey_mode` |
| the question | `policy_domain`, `policy_domain_label`, `issue_label`, `question_id` |
| the answer | `value` |

Vote choice and vote intention are questions here, not columns. They sit in the domain "Vote Intention & Choice" alongside the policy items, so they group and plot the same way.

### response_id

`response_id` is **the file name, minus its extension, plus the row number in that file padded to five digits**. The first data row is row 1. There are no exceptions and no lookup table:

    cipo-143-E-1945-06_F1.sav, row 7   ->   cipo-143-E-1945-06_F1_00007
    1965.dta                            ->   CES-E-1965_F1_00007

The second line is the case worth noting: `survey_id` names the survey, which for the CES is a short wave label, while `response_id` is built from the *file*. Where one archive file holds several waves, the file is archived once per wave — `ces2004-6-8_2004wave.dta`, `ces2004-6-8_2006wave.dta` — so the rule still holds.

---

## Demographics and voting

### Identifiers and survey attributes

**`source`** — which archive the observation comes from, as listed above.

**`survey_id`** — the original data file, with its extension. This is the key back to the source material and to `demographics_codebook.csv`.

**`survey_mode`** — how the survey was administered. Assigned by hand from survey documentation, not read from the data files, and coded numerically so that every variable in the dataset is a numeric code.

    1  Face to face    Gallup 1945–1999, Environics to 1990s, CES to 1980s
    3  Telephone       from 1972 (Gallup), all Pollara, Environics from the 1990s
    2  Online          from 2015 (CES 2015, all Democracy Checkup, bridge survey)
    4  Unknown         1,018 respondents, Gallup 1992 only

It is a property of the survey rather than the respondent and is constant within a survey everywhere except CES 2015, which ran a telephone and an online sample.

---

### Gender

**`gender`** — respondent's gender.

    0  Man
    1  Woman
    2  Non-binary / other gender identity

Present in every survey that carries demographics (681 of the 683 survey files; the two exceptions are Gallup polls that contribute issue questions only). 1945–2026.

Code 2 exists only from 2019 — CES 2019 and 2021, Democracy Checkup 2019–2024, and the 2026 Bridge Survey — and covers 748 respondents. Before that the question was asked as a binary and the variable is strictly 0/1, so analyses spanning the full period should expect 2 to be absent for all but the last few years. Where a source offered both a "non-binary" and an "another gender, please specify" option, the two are combined into 2. Gender is missing for 4,027 respondents.

---

### Age

**`age`** — age in years, either asked directly or computed from year of birth. Available 1945–1951 and 1974–2026. Gallup replaced continuous age with bands between 1952 and 1973, so there is no `age` for those years.

Gallup year-of-birth questions in 28 waves between 1974 and 1977 carry a bottom code — "PRIOR TO 1900", "BEFORE 1900", "1900 & PRIOR", "BORN IN 1800s". These respondents are assigned a **floor age**: the youngest age consistent with the code, which is the survey year minus 1899, or minus 1900 where the label includes 1900 itself. Floors run from 75 to 78, and 912 respondents are affected. Their true ages are at least this and may be higher, so the oldest tail of the age distribution in these waves is compressed rather than missing.

One further respondent, in `cipo-912-1-E-1989-12`, carries the same kind of code on an age variable rather than a year-of-birth variable and remains `NA`.

**`age_cats`** — age in three categories, available for the whole period.

    1  18–29
    2  30–49
    3  50+

Where continuous age exists, `age_cats` is computed from it directly. Where it does not, it is built from the survey's own age bands, and this is where the variable needs care. The source bands changed repeatedly: 21–29 / 30–39 / 40–49 / 50+ from 1953 to 1970; 18–20 added from 1971; the top band split into 50–59 and 60+ in 1974.

**Some source bands cross our cutpoints and cannot be assigned.** A band of "25 to 34" spans both 18–29 and 30–49; "45 to 54" spans 30–49 and 50+. Rather than guess, these respondents are `NA`. About 25,000 respondents across 56 surveys are `NA` for this reason, concentrated in Pollara and later Environics waves. A typical case is Pollara 1992_Q1, where 18–24 → 1, 35–44 → 2, 55–64 and 65+ → 3, and the 25–34 and 45–54 bands drop out — 606 of 1,212 respondents.

---

### Geography

**`province`** — Statistics Canada provincial codes.

    10 Newfoundland and Labrador   35 Ontario
    11 Prince Edward Island        46 Manitoba
    12 Nova Scotia                 47 Saskatchewan
    13 New Brunswick               48 Alberta
    24 Quebec                      59 British Columbia
    60 Yukon   61 Northwest Territories   62 Nunavut

Newfoundland appears from 1949, on joining Confederation. The territories appear only sparsely and only from 1992 (Yukon and NWT) and 1997 (Nunavut); together they are 1,366 respondents in the whole dataset. A small number of surveys carry only a region indicator and have `NA` here.

**`region`**

    1 Atlantic (NL, PE, NS, NB)      4 Prairies (MB, SK, AB)
    2 Quebec                         5 British Columbia
    3 Ontario                        6 North (YT, NT, NU)

**`com_500`** — lives in a community of more than 500,000.

    0 No    1 Yes

Available 1965–1991, then again for CES 2015, 2019, 2021 and Democracy Checkup 2019–2022. Absent in between. In the recent surveys it was constructed by hand from the respondent's municipality rather than asked.

**`com_100`** — lives in a community of more than 100,000. Same 0/1 coding. Available 1945–2001, 2006–2013, and 2015–2022.

Both were generally recorded by the interviewer rather than asked. In a few CES cases they were reconstructed from postal codes and census subdivision sizes.

---

### Education

**`degree`** — holds a university degree.

    0 No university degree
    1 Bachelor's degree or above

Available 1949–2026. Three changes matter:

- **1962.** Before 1962 Gallup coded the category reached whether or not it was completed. From 1962 the categories distinguish "some university" from "graduated university".
- **1993.** Gallup split the question in two — school attended, then whether the respondent graduated. Reported graduation rises across this break.
- **CES 1965 and 1968.** 1965 records years of schooling; 17 or more years is treated as a degree. The 1968 documentation is garbled, so coding follows the 1968 ICPSR codebook, treating three or more years of university as a degree. Teachers' college and nursing are not counted as degrees in this period.

The 2026 bridge survey originally coded this wrongly — bachelor's and master's holders `NA`, doctorates carrying an invalid 8, and no respondent coded 1. Fixed; 2,413 respondents (34.4%) hold a degree.

---

### Religion

**`religion`**

    1  Catholic — Roman Catholic, Ukrainian Catholic, Apostolic
    2  Protestant — United, Anglican, Presbyterian, Baptist, Lutheran, Pentecostal,
       Salvation Army, Mennonite, Evangelical, Christian Reformed, Church of Christ,
       Christian Alliance, Seventh-day Adventist, Church of the Nazarene, Disciples
       of Christ, Brethren, Free Methodist, nondenominational, Christian Science,
       Church of God, Protestant unspecified and other Protestant
    3  Jewish
    4  Other — Greek Orthodox, Jehovah's Witness, Mormon/LDS, Muslim, Hindu, Sikh,
       Buddhist, Unitarian, Spiritualist, Hutterite, Christadelphian, Wicca,
       Native/tribal beliefs
    5  None — none, agnostic, atheist
    97 Refused / wildcode
    99 Don't know / prefer not to answer

Asked sporadically in early Gallup. A "none" option appears only from 1978, so the absence of code 5 before then reflects the question, not the respondents.

Gallup codebooks in the early 1970s do not always match the values in the data files, which assigned some Catholic and Jewish respondents the wrong code. This was found through an implausible spike in Jewish respondents around 1973 and corrected.

Two coding errors have been corrected here. CES 2015 sent refusals to 98 rather than 97 (283 respondents). Five earlier CES studies, 1968 to 1984, sent "no regular church" to 98 as though it were a missing value, when the None category explicitly covers no regular attendance (12 respondents). Code 98 no longer appears in this variable.

---

### Language

**`language`** — the respondent's language, and the variable to use.

    1  French                    4  Other
    2  English                  98  Refused
    3  English and French       99  Don't know

Two questions feed it. Some surveys ask the language spoken most often at home, some ask the language learned in childhood ("mother tongue"), a few ask both. `language` takes the language spoken at home where it exists and mother tongue otherwise, which lifts coverage to **935,703 of 1,010,004 respondents (92.6%)**. Neither question alone comes close: mother tongue covers 584,686 and home language 396,062.

**`language_var`** — which question supplied the value, so the two can be separated again:

    1  Language spoken at home
    2  Mother tongue

Where a survey asked both — ten Canadian Election Studies — the two answers agree 82% of the time, so the home-first priority decides 8,103 respondents. For those, `language` keeps the home answer and the mother-tongue answer is not carried separately.

The Gallup question changed in 1960: before then the options were English, French and Both; from 1960 "Both" was dropped and "Other" added, so code 3 largely disappears after that.

In CES 2019 and 2021 and Democracy Checkup 2020–2024, childhood language is asked as a tick-box battery with one column per language rather than a single question; the recode is a priority rule over that set.

### Union membership

**`union_household`** — respondent or someone in their household is a union member.

    0 No    1 Yes

Available 1945–2026. Because it asks about the household, the proportion runs well above census union density and should not be compared with it directly.

**`union`** records *who* the union member is, where the survey asked:

    0  No
    1  Yes, unspecified
    2  Respondent
    3  Spouse
    4  Both

`union_household` is this collapsed to 0/1, and agrees with it everywhere.

Which coding appears depends on the wave, and no wave mixes them: 175 Gallup surveys between 1945 and 1989 asked a plain yes/no and use 0/1, while 265 surveys between 1979 and 2000 asked who and use 0/2/3/4. The two eras overlap, so a series spanning 1979–1989 will contain both codings across files.

---

### Occupation

**`occupation`** — following Evans and Tilley (2017), via Richard Johnston.

    1  Managers, executives, business owners    6  Farmer and fisherman
    2  Professional                             7  Retired
    3  Routine non-manual                       8  Unemployed
    4  Working class                            9  Student
    5  Armed forces                            99  Other (includes housewife/homemaker)

Available 1945–2021. This is the least stable variable in the dataset. The categories that fare worst over time are Armed Forces, Retired and Student, which different surveys treat as occupations or as separate statuses. The meaning of "Managers, Executives, Business Owners" also depends on what the original survey offered. Change within a category over time is more trustworthy than differences between categories.

**Category 8 is broader than "unemployed".** Most Gallup surveys between 1960 and 1989 offer a single response option covering everyone outside paid work — labelled "NOT IN LABOUR FORCE" or "NOT IN LABOR FORCE" — rather than separating the unemployed from the retired, from homemakers, from students. Those answers are coded 8. For the Gallup era, category 8 should be read as *not in paid work* rather than *unemployed and seeking work*, and a series of "unemployment" across the full period will show a level shift where the question changes rather than a change in the labour market.

Where a survey does distinguish them, the finer categories are used: 7 Retired, 9 Student, and 99 Other for homemakers. This means the boundary between 7, 8, 9 and 99 moves with the questionnaire, which is the main reason changes *within* a category over time are more trustworthy than differences *between* categories.

CES 1993, 1997, 2004, 2011 and 2015 code occupation with four-digit NOC classifications, mapped individually. Each also carries a block of 999x residual codes for people the classification could not place, and **the residual scheme is not the same in all of them**, so they are read survey by survey rather than by a common rule.

| code | 1993, 1997, 2004 | goes to | 2011, 2015 | goes to |
|---|---|---|---|---|
| 9992 | unemployed | 8 in 1997, `NA` in 1993 and 2004 | unlabelled | `NA` |
| 9993 | self-employed | **1 Managers, executives, owners** | unlabelled | `NA` |
| 9994 | housewife / taking care of family | 99 Other | taking care of family | 99 Other |
| 9995 | student | 9 Student | student | 9 Student |
| 9996 | disabled | 99 Other | **retired** | 7 Retired |
| 9997 | retired | 7 Retired | **cannot code** | `NA` |

Self-employment is treated as ownership and goes to category 1, covering 92 respondents across 1993, 1997 and 2004.

CES 2011 leaves 33 respondents in codes 9991, 9992 and 9993 with no value. Those codes carry no label in the data file, and the published CES 2011 codebook lists them with counts and no label either, so there is nothing to map them from. Since 2011 also moves the meaning of 9996 and 9997, the labels from the earlier surveys cannot be carried across.

---

### Vote

**`vote_intention`** — "If a federal election were held today, which party do you think you would vote for?" Available 1945–2026.

**`vote_choice`** — reported vote in the most recent federal election. Generally limited to election years and to polls that asked about the previous election. Available 1945–2021. Same coding:

    1  Liberal                        8  Reform / Alliance
    2  PC / Conservative              9  Other party
    3  CCF / NDP                     10  Green Party
    4  Social Credit / Créditiste    95  Spoiled ballot
    5  Labour Progressive            96  Does not vote
    6  Bloc Québécois                97  Ineligible to vote
    7  Bloc Populaire                98  Not stated / refused / multiple
                                     99  Undecided / don't know

The party codes reflect the period each party existed: Labour Progressive ends in 1979, Social Credit in 2000, Reform/Alliance runs 1956–2004, the Bloc Québécois appears from 1990 and the Greens from 1984. Bloc Populaire should appear only in 1945.

Codes 95, 96, 97 and 98 are asked inconsistently across surveys and are usually best excluded. Code 99 is kept separate so decided and undecided respondents can be compared.


**Code 97 in Gallup is broader than "ineligible."** Many Gallup files offer a single code labelled INAPPLICABLE on the recalled-vote question, without separating people who were too young from those who did not vote, were not on the roll, or were never asked. Fifty-six surveys map that code to 97.

**All 17,297 respondents at `vote_choice = 97` are Gallup**, and in 33 surveys between 1961 and 1975 the code covers more than 15% of the sample, reaching 33%. No plausible share of the electorate was legally ineligible at those rates, so for Gallup, 97 should be read as *the question did not apply* rather than *ineligible to vote*. Where a file does distinguish them — cipo-338 in 1969 separates "did not vote", "too young" and "don't remember" — the finer codes are used, which is why the boundary between 96, 97, 98 and 99 moves with the questionnaire.

Excluding 95 through 99 before analysis, as recommended above, sidesteps this.

---

## Policy issues

The individual items are not documented here. There are 631 distinct items and they are described, survey by survey, in **`question_codebook.csv`** — 4,799 rows covering 672 surveys. This section explains how to read that file.

### Policy Codebook Rows

One row per **survey, item, and source variable**. An item asked in forty surveys has forty rows. An item built from two variables in the same survey — a split ballot, or a campaign and a post-election form — has one row per variable, so a single (survey, item) pair can appear more than once.

To go from the data to the codebook, join `dataset.parquet$question_id` to `question_codebook.csv$issue_question_id`, and `survey_id` to `survey_id`.

### Policy Codebook Columns

| column | what it holds |
|---|---|
| `survey_id` | the survey, matching `dataset.parquet` |
| `issue_question_id` | the item, matching `question_id` in the data |
| `original_question_id` | the variable(s) read from the original file, separated by ` \| ` |
| `policy_domain`, `policy_domain_label` | the domain, matching the data |
| `issue_label` | a short directional name for the item |
| `question_wording` | the wording, synthesised where it varies slightly across surveys |
| `question_wording_original` | the wording exactly as that survey put it |
| `question_coding` | the original response options and their codes, as the source records them |
| `question_recoded` | the rule that turns the original codes into `value` |
| `fallback_variable`, `fallback_recoded` | for a coalesce, the variable used when the first yields nothing, and its own rule |
| `rule_kind` | how to read `question_recoded` |
| `recode_type` | every value the item is allowed to take |
| `value_labels` | a short label for each substantive value, in ascending order |
| `middle_category_varies` | `TRUE` where some surveys of the item lack the middle category |

`issue_question_id` **is** the harmonised item. Where the same question was asked by different houses in different decades, all of them carry one id. Of the 629 policy items, 551 appear in a single source, 72 in two and 6 in three. 

### Reading `question_recoded`

The common form is a value map, `1:2=1; 3=0; 9999=9999`, read as "source codes 1 and 2 become 1, code 3 becomes 0". A trailing tag in brackets names the scale. Two things to watch:

- **A code the rule does not mention becomes `NA`.** This is deliberate and is how wild codes, blank punch columns and unused options are excluded.
- **`=NA` is explicit.** The rule maps that code to missing on purpose.

`rule_kind` says how the rule is applied:

| kind | rows | how to read it |
|---|---|---|
| `value_map` | 3,668 | a plain map from one variable |
| `raw` | 1,108 | the same, for the two vote items |
| `coalesce`, `coalesce_n` | 20 | try each variable in order; the first that *recodes to something* wins, so an arm whose code the rule does not map falls through to the next, which uses `fallback_recoded` |
| `pair` | 3 | the key is two variables joined by `+`, as in `8+NA=0`; `NA` is a literal part of the key, not an absence |

### The scales

`recode_type` lists every value an item may take. Most items are one of three shapes, always with the directional sense given by `issue_label`, so `1` means the direction the label names:

| scale | meaning |
|---|---|
| `0/1` | opposes / supports |
| `-1/0/1` | less / about the same / more |
| `0/1/2` | ordered, where a binary would lose the middle position — the classic case is abortion never / in some circumstances / always |

`9999` is don't know, undecided, or no opinion, and is present in most items. It is a real answer, distinct from `NA`, and belongs in the denominator only if that is what you intend.

The two vote items use the party frame instead, documented under Vote above.

### Value labels

`value_labels` names each substantive value, comma-separated, **in ascending order of the value** — so `-1/0/1` reads `Less, Same, More` and `0/1` reads `Disagree, Agree`. Missing codes are not labelled: `9999` and `NA` have no entry, and the label count therefore matches the number of substantive values, not the length of `recode_type`. The labels are a property of the item, so every row of an `issue_question_id` carries the same string. They are written for plotting, not for quotation: where an item's wording drifts across surveys they follow the synthesised `question_wording`.

Where a source offered an explicit "neither" that the recode folds into one pole, the label says so — `Disagree/Neither, Agree` rather than `Disagree, Agree` — so that the fence-sitters inside that category are visible.

**`middle_category_varies` marks the ten items whose surveys disagree about whether a middle category exists.** Gallup routinely offered a "qualified" answer that Environics and the CES did not, so an item such as `bri_idim_002` is three-category in its Gallup waves and two-category everywhere else. For these ten the labels describe the union — all three — and the app must map **by value, not by position**: a two-category survey uses the first and last labels, never the first two. Which rows are affected is recoverable from `recode_type`, where a row lacking the middle carries only two substantive values. Everywhere else the row's own `recode_type` and the label count agree.

A middle that appears and disappears down a series is a property of the questionnaire, not a gap in the data, and is better suppressed than plotted as zero in the waves that never offered it.

### Domains

| code | domain | items |
|---|---|---|
| `econ` | Economy and Taxation | 139 |
| `soim` | Social Issues, Rights and Justice | 124 |
| `idim` | Immigration, Diversity and Federalism | 118 |
| `hwps` | Health, Education and Social Programs | 85 |
| `intd` | Foreign Policy and Identity | 73 |
| `ener` | Energy and Environment | 57 |
| `dpin` | Democracy and Institutions | 34 |
| `vote` | Vote Intention & Choice | 2 |
