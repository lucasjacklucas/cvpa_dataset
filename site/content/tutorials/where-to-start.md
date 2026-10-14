---
title: "Demographic Divides: Where to Start"
---

The CVPA dataset has more than 600 policy questions, each of which can be broken down by gender, age, education, language, region, religion, union membership, and community size. If you're interested in one of these groups and aren't sure where to begin, the questions below offer some good starting points for exploration. 

These questions work well alongside our [interactive app](https://www.quantoid.ca/files/app-js-remote/), which lets you explore long-term changes in policy attitudes and voting without writing any code. Pick a question below, find it in the app, and follow the hint.

For each question we give its label, its question code (which you can look up on the [Data page](/data/) or pass to the [R package](/tutorials/cvpa-r-package/)), the years it's available, and a hint about what to look for. We leave the findings for you to discover! 

## Gender

Comparing women and men.

- **General public allowed to own a gun** (`bri_soim_012`, 1994–2026). Look at which group is more supportive, and whether the gap is as large in 2026 as in 1994.
- **Compulsory military training at 18** (`bri_intd_001`, 1955–2026). Compare the gender gap in the earliest surveys with the gap in 2026.
- **The feminist movement** (`bri_soim_010`, 1993–2026). Look at what happens to the gap between 2008 and 2026, and which group's views moved.
- **Hunger a serious problem in Canada** (`bri_hwps_008`, 1989–2026). Notice how consistent the gap is from one year to the next.

## Age

Comparing respondents aged 18–29 with those aged 50 and over.

- **Same-sex marriage** (`bri_soim_011`, 1994–2015). Track the gap over time. Does it grow, shrink, or both? Which age group's views changed more?
- **Confidence in the police** (`ces_soim_003`, 1993–2021). Compare the surveys before 2010 with those from 2019 and 2021.
- **Small marijuana possession a criminal offence** (`bri_soim_006`, 1977–2026). Compare the gap in the 1970s and 1980s with 2026, and look at overall levels of agreement in each period.
- **Labour unions too powerful** (`bri_econ_003`, 1979–2026). Look at the direction of the age gap, and at how views in both groups changed between 1989 and 2026.

## Education

Comparing respondents with and without a university degree.

- **Too much immigration to Canada** (`bri_idim_007`, 1981–2026). Follow the size of the education gap from the 1980s to 2026, and look at what happened to overall levels of agreement.
- **Immigrants take jobs from other Canadians** (`bri_idim_011`, 1989–2015). Compare the gap in the 1990s with the gap after 2000.
- **Capital punishment** (`bri_soim_002`, 1958–2010). Compare the earliest survey with the later decades.
- **Want a larger Canadian population** (`bri_idim_001`, 1955–2026). Check the direction of the gap in 1955 against the direction in later years.

## Language

Comparing French and English speakers.

- **Keep the monarchy** (`gal_intd_003`, 1968–1989, and `bri_intd_008`, 1991–2026). These two versions of the question together cover almost sixty years. Look at how large and how stable the language gap is across both.
- **Quebec separation** (`bri_idim_005`, 1979–2026). This question was asked of national samples, so francophones outside Quebec are included. Compare the gap around 1980, the mid-1990s, and 2026.
- **Federal spending on defence** (`bri_intd_004`, 1985–2021). Look at whether the gap changes after 2008, and which language group's views moved.
- **Confidence in organized religion** (`ces_soim_004`, 1993–2021). Compare the direction of the gap in the 1990s with its direction in 2019 and 2021.

## Region

Compare the five main regions (Atlantic, Quebec, Ontario, Prairies, and British Columbia).

- **General public allowed to own a gun** (`bri_soim_012`, 1994–2026). Find the regions at either end, and see whether the distance between them grows over time.
- **Registration of all firearms** (`gal_soim_006`, 1975–2000). Compare the regional differences in 1975 with those in the late 1990s, and note which regions are at either end.
- **Federal spending on defence** (`bri_intd_004`, 1985–2021). Look for the region that stands out from the others, and whether the regional differences narrow over time.

## Religion

Comparing respondents with no religion and Catholics and Protestants combined. Religion is available up to 2024 but not in the 2026 Bridge Survey.

- **Same-sex marriage** (`bri_soim_011`, 1994–2015). Look at when the religious gap is largest, and how it compares with the same question's age gap (above).
- **Abortion legal in all circumstances** (`bri_soim_005`, 1983–2000). Notice how stable the gap is across the period.
- **Crack down on crime even if people lose rights** (`ces_soim_012`, 1993–2011). Compare the gap in 1993 with the gap in 2011.
- **Better if more women stayed home with children** (`ces_soim_008`, 1993–2008). Compare the gap in 1993 with the surveys that follow.

## Union membership

Comparing respondents with and without a union member in their household.

- **Labour unions too powerful** (`bri_econ_003`, 1979–2026). Look at the size of the gap, and at how both groups' views changed between 1989 and 2026.
- **Workers should have the right to strike** (`bri_hwps_002`, 1962–2026). Compare the gap in earlier decades with 2026, and look at which group's views moved.
- **Essential workers' right to strike** (`gal_hwps_002`, 1974–1989). Notice how steady the gap is across the period.

## Community size

Comparing respondents in communities of more than 100,000 people with those in smaller communities. Community size is available up to 2022 but not in the 2026 Bridge Survey.

- **Immigrants take jobs from other Canadians** (`bri_idim_011`, 1989–2015). Compare the urban–rural gap in the early 1990s with the gap after 2005.
- **Too much immigration to Canada** (`bri_idim_007`, 1981–2001). Compare this gap with the education gap on the same question (above).
- **Every woman who wants an abortion should be able to have one** (`env_soim_010`, 1985–1997). Look at which group is more likely to agree.

## Next steps

To compute these gaps yourself and plot how they changed, see [CVPA R Package: Getting Started](/tutorials/cvpa-r-package/). Pass any of the question codes above to `question_data()`, and the group variable to `wtd_response()`.
