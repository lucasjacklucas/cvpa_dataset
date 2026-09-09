# Demographics and Vote Choice — Codebook

Written documentation for the demographic and vote variables in the Canadian
policy preferences dataset. Companion to `demographics_codebook.csv`, which
records how each variable is built from each individual survey; this document
describes what the finished variables mean and how each series changes over time.

Coverage is 681 surveys from five sources:

| source | years |
|---|---|
| Gallup Canada | 1945–2000 |
| Canadian Election Study and C-DEM Democracy Checkup | 1965–2024 |
| Environics Focus Canada | 1978–2013 |
| Pollara Perspectives Canada | 1992–2002 |
| CVPA Bridge Survey | 2026 |

Year coverage is not continuous. Gallup is missing 1946–1948, 1950 and 1952.
Environics ends in 2013 and the Democracy Checkup begins in 2019, so 2014 and
2016–2018 have no data.

Throughout, a value that a survey does not supply is `NA`. Codes such as 97, 98
and 99 mean the respondent was asked and gave a non-substantive answer; they are
not the same as `NA` and should usually be excluded before analysis.

---

## Identifiers and survey attributes

**`source`** — which archive the observation comes from, as listed above.

**`survey_id`** — the original data file, with its extension. This is the key back
to the source material and to `demographics_codebook.csv`.

**`survey_mode`** — how the survey was administered. Assigned by hand from survey
documentation, not read from the data files, and coded numerically so that every
variable in the dataset is a numeric code.

    1  Face to face    Gallup 1945–1999, Environics to 1990s, CES to 1980s
    3  Telephone       from 1972 (Gallup), all Pollara, Environics from the 1990s
    2  Online          from 2015 (CES 2015, all Democracy Checkup, bridge survey)
    4  Unknown         1,018 respondents, Gallup 1992 only

It is a property of the survey rather than the respondent and is constant within
a survey everywhere except CES 2015, which ran a telephone and an online sample.

This is the same 1–4 coding used in the 2025 CJPS paper.

---

## Gender

**`gender`** — respondent's gender.

    0  Man
    1  Woman
    2  Non-binary / other gender identity

Present in every survey that carries demographics (681 of the 683 survey files;
the two exceptions are Gallup polls that contribute issue questions only).
1945–2026.

Code 2 exists only from 2019 — CES 2019 and 2021, Democracy Checkup 2019–2024,
and the 2026 Bridge Survey — and covers 748 respondents. Before that the question
was asked as a binary and the variable is strictly 0/1, so analyses spanning the
full period should expect 2 to be absent for all but the last few years. Where a
source offered both a "non-binary" and an "another gender, please specify"
option, the two are combined into 2. Gender is missing for 4,027 respondents.

The variable was called `woman` until it was renamed here; it has never been an
indicator, so the old name was misleading once code 2 appeared.

---

## Age

**`age`** — age in years, either asked directly or computed from year of birth.
Available 1945–1951 and 1974–2026. Gallup replaced continuous age with bands
between 1952 and 1973, so there is no `age` for those years.

Gallup year-of-birth questions in 28 waves between 1974 and 1977 carry a bottom
code — "PRIOR TO 1900", "BEFORE 1900", "1900 & PRIOR", "BORN IN 1800s". These
respondents are assigned a **floor age**: the youngest age consistent with the code,
which is the survey year minus 1899, or minus 1900 where the label includes 1900
itself. Floors run from 75 to 78, and 912 respondents are affected. Their true ages
are at least this and may be higher, so the oldest tail of the age distribution in
these waves is compressed rather than missing.

One further respondent, in `cipo-912-1-E-1989-12`, carries the same kind of code on
an age variable rather than a year-of-birth variable and remains `NA`.

**`age_cats`** — age in three categories, available for the whole period.

    1  18–29
    2  30–49
    3  50+

Where continuous age exists, `age_cats` is computed from it directly. Where it does
not, it is built from the survey's own age bands, and this is where the variable
needs care. The source bands changed repeatedly: 21–29 / 30–39 / 40–49 / 50+ from
1953 to 1970; 18–20 added from 1971; the top band split into 50–59 and 60+ in 1974.

**Some source bands cross our cutpoints and cannot be assigned.** A band of "25 to
34" spans both 18–29 and 30–49; "45 to 54" spans 30–49 and 50+. Rather than guess,
these respondents are `NA`. About 25,000 respondents across 56 surveys are `NA` for
this reason, concentrated in Pollara and later Environics waves. A typical case is
Pollara 1992_Q1, where 18–24 → 1, 35–44 → 2, 55–64 and 65+ → 3, and the 25–34 and
45–54 bands drop out — 606 of 1,212 respondents.

---

## Geography

**`province`** — Statistics Canada provincial codes.

    10 Newfoundland and Labrador   35 Ontario
    11 Prince Edward Island        46 Manitoba
    12 Nova Scotia                 47 Saskatchewan
    13 New Brunswick               48 Alberta
    24 Quebec                      59 British Columbia
    60 Yukon   61 Northwest Territories   62 Nunavut

Newfoundland appears from 1949, on joining Confederation. The territories appear
only sparsely and only from 1992 (Yukon and NWT) and 1997 (Nunavut); together they
are 1,366 respondents in the whole dataset. A small number of surveys carry only a
region indicator and have `NA` here.

**`region`**

    1 Atlantic (NL, PE, NS, NB)      4 Prairies (MB, SK, AB)
    2 Quebec                         5 British Columbia
    3 Ontario                        6 North (YT, NT, NU)

**`com_500`** — lives in a community of more than 500,000.

    0 No    1 Yes

Available 1965–1991, then again for CES 2015, 2019, 2021 and Democracy Checkup
2019–2022. Absent in between. In the recent surveys it was constructed by hand from
the respondent's municipality rather than asked.

**`com_100`** — lives in a community of more than 100,000. Same 0/1 coding.
Available 1945–2001, 2006–2013, and 2015–2022.

Both were generally recorded by the interviewer rather than asked. In a few CES
cases they were reconstructed from postal codes and census subdivision sizes.

---

## Education

**`degree`** — holds a university degree.

    0 No university degree
    1 Bachelor's degree or above

Available 1949–2026. Three changes matter:

- **1962.** Before 1962 Gallup coded the category reached whether or not it was
  completed. From 1962 the categories distinguish "some university" from
  "graduated university".
- **1993.** Gallup split the question in two — school attended, then whether the
  respondent graduated. Reported graduation rises across this break.
- **CES 1965 and 1968.** 1965 records years of schooling; 17 or more years is
  treated as a degree. The 1968 documentation is garbled, so coding follows the
  1968 ICPSR codebook, treating three or more years of university as a degree.
  Teachers' college and nursing are not counted as degrees in this period.

The 2026 bridge survey originally coded this wrongly — bachelor's and master's
holders `NA`, doctorates carrying an invalid 8, and no respondent coded 1. Fixed;
2,413 respondents (34.4%) hold a degree.

---

## Religion

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

Asked sporadically in early Gallup. A "none" option appears only from 1978, so the
absence of code 5 before then reflects the question, not the respondents.

Gallup codebooks in the early 1970s do not always match the values in the data
files, which assigned some Catholic and Jewish respondents the wrong code. This was
found through an implausible spike in Jewish respondents around 1973 and corrected.

Two coding errors have been corrected here. CES 2015 sent refusals to 98 rather than
97 (283 respondents). Five earlier CES studies, 1968 to 1984, sent "no regular
church" to 98 as though it were a missing value, when the None category explicitly
covers no regular attendance (12 respondents). Code 98 no longer appears in this
variable.

---

## Language

**`language`** — the respondent's language, and the variable to use.

    1  French                    4  Other
    2  English                  98  Refused
    3  English and French       99  Don't know

Two questions feed it. Some surveys ask the language spoken most often at home, some
ask the language learned in childhood ("mother tongue"), a few ask both. `language`
takes the language spoken at home where it exists and mother tongue otherwise, which
lifts coverage from 808,831 respondents to **955,048 of 1,032,877 (92.5%)**.

**`language_var`** — which question supplied the value, so the two can be separated
again:

    1  Language spoken at home
    2  Mother tongue

Where a survey asked both — ten Canadian Election Studies — the two answers agree 82%
of the time, so the home-first priority decides about 8,200 respondents. For those,
`language` keeps the home answer and the mother-tongue answer is not carried
separately.

The Gallup question changed in 1960: before then the options were English, French and
Both; from 1960 "Both" was dropped and "Other" added, so code 3 largely disappears
after that.

In CES 2019 and 2021 and Democracy Checkup 2020–2024, childhood language is asked as
a tick-box battery with one column per language rather than a single question; the
recode is a priority rule over that set.

**A correction worth knowing about.** Gallup asked mother tongue, not language spoken
at home, but the answer had been filed under the home variable for 387 of its 446
language rows — labels reading "LANGUAGE OF CHILDHOOD", "MOTHER TONGUE", "LANGUAGE
FIRST SPOKEN AS CHILD". These are now credited to mother tongue. This does not change
anyone's language, only which source `language_var` reports, but it moves the bulk of
Gallup from `language_var = 1` to `language_var = 2`.

## Union membership

**`union_household`** — respondent or someone in their household is a union member.

    0 No    1 Yes

Available 1945–2026. Because it asks about the household, the proportion runs well
above census union density and should not be compared with it directly.

**`union`** records *who* the union member is, where the survey asked:

    0  No
    1  Yes, unspecified
    2  Respondent
    3  Spouse
    4  Both

`union_household` is this collapsed to 0/1, and agrees with it everywhere.

Which coding appears depends on the wave, and no wave mixes them: 175 Gallup surveys
between 1945 and 1989 asked a plain yes/no and use 0/1, while 265 surveys between
1979 and 2000 asked who and use 0/2/3/4. The two eras overlap, so a series spanning
1979–1989 will contain both codings across files even though no single file is
ambiguous. Use `union_household` for anything binary; use `union` only for the
self/spouse/both distinction, and only within one coding era.

---

## Occupation

**`occupation`** — following Evans and Tilley (2017), via Richard Johnston.

    1  Managers, executives, business owners    6  Farmer and fisherman
    2  Professional                             7  Retired
    3  Routine non-manual                       8  Unemployed
    4  Working class                            9  Student
    5  Armed forces                            99  Other (includes housewife/homemaker)

Available 1945–2021. This is the least stable variable in the dataset. The
categories that fare worst over time are Armed Forces, Retired and Student, which
different surveys treat as occupations or as separate statuses. The meaning of
"Managers, Executives, Business Owners" also depends on what the original survey
offered. Change within a category over time is more trustworthy than differences
between categories.

**Category 8 is broader than "unemployed", and this matters.** Most Gallup surveys
between 1960 and 1989 offer a single response option covering everyone outside paid
work — labelled "NOT IN LABOUR FORCE" or "NOT IN LABOR FORCE" — rather than separating
the unemployed from the retired, from homemakers, from students. Those answers are
coded 8.

The scale is not marginal. **17,685 respondents across 140 Gallup surveys reach
category 8 that way, which is 53% of everyone in category 8 in the whole dataset.** So
for the Gallup era, category 8 should be read as *not in paid work* rather than
*unemployed and seeking work*, and a series of "unemployment" across the full period
will show a level shift where the question changes rather than a change in the labour
market.

Where a survey does distinguish them, the finer categories are used: 7 Retired,
9 Student, and 99 Other for homemakers. This means the boundary between 7, 8, 9 and 99
moves with the questionnaire, which is the main reason changes *within* a category over
time are more trustworthy than differences *between* categories.

CES 1993 and 2004 code occupation with four-digit NOC classifications, mapped
individually. A few NOC codes have no home in the scheme and are currently `NA`:
self-employed (9993) and disabled (9996).

---

## Vote

**`vote_intention`** — "If a federal election were held today, which party do you
think you would vote for?" Available 1945–2026.

**`vote_choice`** — reported vote in the most recent federal election. Generally
limited to election years and to polls that asked about the previous election.
Available 1945–2021. Same coding:

    1  Liberal                        8  Reform / Alliance
    2  PC / Conservative              9  Other party
    3  CCF / NDP                     10  Green Party
    4  Social Credit / Créditiste    95  Spoiled ballot
    5  Labour Progressive            96  Does not vote
    6  Bloc Québécois                97  Ineligible to vote
    7  Bloc Populaire                98  Not stated / refused / multiple
                                     99  Undecided / don't know

The party codes reflect the period each party existed: Labour Progressive ends in
1979, Social Credit in 2000, Reform/Alliance runs 1956–2004, the Bloc Québécois
appears from 1990 and the Greens from 1984. Bloc Populaire should appear only in
1945.

Codes 95, 96, 97 and 98 are asked inconsistently across surveys and are usually
best excluded. Code 99 is kept separate so decided and undecided respondents can be
compared.

**CES 1972 (November) excludes Form C, deliberately.** `qa13a1a` is labelled
"FORM A,B: How did you vote in election last monday", and the recode keys on the
form variable so that only Forms A and B are read. Ninety-one Form C respondents
carry a value in that column even though the question was never put to them;
those values are not answers and are left unmapped. Do not "complete" this rule.

**Code 97 in Gallup is broader than "ineligible", and this matters.** Many Gallup
files offer a single code labelled INAPPLICABLE on the recalled-vote question, without
separating people who were too young from those who did not vote, were not on the
roll, or were never asked. Fifty-six surveys map that code to 97.

**All 17,297 respondents at `vote_choice = 97` are Gallup**, and in 33 surveys between
1961 and 1975 the code covers more than 15% of the sample, reaching 33%. No plausible
share of the electorate was legally ineligible at those rates, so for Gallup, 97 should
be read as *the question did not apply* rather than *ineligible to vote*. Where a file
does distinguish them — cipo-338 in 1969 separates "did not vote", "too young" and
"don't remember" — the finer codes are used, which is why the boundary between 96, 97,
98 and 99 moves with the questionnaire.

Excluding 95 through 99 before analysis, as recommended above, sidesteps this.

The 2026 bridge survey originally coded 416 Bloc Québécois supporters as 7 (Bloc
Populaire) and carried "Don't know" as 9999; both are fixed, to 6 and 99.

---

## What is not in the release

Ten working and legacy columns present in earlier versions have been dropped, and
their codebook rows removed with them: `union`, `agecat`, `commsize`, `commtype`,
`education`, `yob`, `QE_R1`, `newgen`, `gender` and the two `_fix` patch columns. Each
either duplicated a properly named variable or was an unstandardised precursor of one.
Nothing that survives is built from any of them.

`language_home` and `mother_tongue` are documented in the codebook but not released.
They are the two source questions behind `language` and `language_var`, kept so the
construction is specified; `language_var` lets you recover which one applies to any
respondent.
