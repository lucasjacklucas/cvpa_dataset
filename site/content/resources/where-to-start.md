---
title: "Demographic Divides: Where to Start"
aliases: ["/tutorials/where-to-start/"]
---

The CVPA dataset has more than 600 policy questions, each of which can be broken down by gender, age, education, language, region, religion, union membership, and community size. If you're interested in one of these groups and aren't sure where to begin, the questions below offer some good starting points for exploration. 

These questions work well alongside our [interactive app](https://www.quantoid.ca/files/app-js-remote/), which lets you explore long-term changes in policy attitudes and voting without writing any code. In the app, you choose a policy domain first and then an issue within it. For each question below we give both, in the form *Domain* → **Issue**.

We also give each question's code (which you can look up on the [Data page](/data/) or pass to the [R package](/resources/cvpa-r-package/)), the years it's available, and a hint about what to look for. We leave the findings for you to discover! 

## Gender

Comparing women and men.

- *Social Issues, Rights and Justice* → **General public allowed to own gun** (`bri_soim_012`, 1994–2026). Look at which group is more supportive, and whether the gap is as large in 2026 as in 1994.
- *Foreign Policy and Identity* → **Compulsory military training at 18** (`bri_intd_001`, 1955–2026). Compare the gender gap in the earliest surveys with the gap in 2026.
- *Social Issues, Rights and Justice* → **Feminism: equal treatment vs men down** (`bri_soim_010`, 1993–2026). Look at what happens to the gap between 2008 and 2026, and which group's views moved.
- *Health, Education and Social Programs* → **Hunger serious problem in Canada** (`bri_hwps_008`, 1989–2026). Notice how consistent the gap is from one year to the next.

## Age

Comparing respondents aged 18–29 with those aged 50 and over.

- *Social Issues, Rights and Justice* → **Favour same-sex marriage** (`bri_soim_011`, 1994–2015). Track the gap over time. Does it grow, shrink, or both? Which age group's views changed more?
- *Social Issues, Rights and Justice* → **Confidence in: police** (`ces_soim_003`, 1993–2021). Compare the surveys before 2010 with those from 2019 and 2021.
- *Social Issues, Rights and Justice* → **Small marijuana possession an offence** (`bri_soim_006`, 1977–2026). Compare the gap in the 1970s and 1980s with 2026, and look at overall levels of agreement in each period.
- *Economy and Taxation* → **Labour unions too powerful** (`bri_econ_003`, 1979–2026). Look at the direction of the age gap, and at how views in both groups changed between 1989 and 2026.

## Education

Comparing respondents with and without a university degree.

- *Immigration, Diversity and Federalism* → **Too much immigration to Canada** (`bri_idim_007`, 1981–2026). Follow the size of the education gap from the 1980s to 2026, and look at what happened to overall levels of agreement.
- *Immigration, Diversity and Federalism* → **Immigrants take jobs from Cdns** (`bri_idim_011`, 1989–2015). Compare the gap in the 1990s with the gap after 2000.
- *Social Issues, Rights and Justice* → **Favour capital punishment** (`bri_soim_002`, 1958–2010). Compare the earliest survey with the later decades.
- *Immigration, Diversity and Federalism* → **Want larger Cdn population** (`bri_idim_001`, 1955–2026). Check the direction of the gap in 1955 against the direction in later years.

## Language

Comparing French and English speakers.

- *Foreign Policy and Identity* → **Keep Queen/King vs republic** (`gal_intd_003`, 1968–1989) and **Keep monarch as head of state** (`bri_intd_008`, 1991–2026). These two versions of the question together cover almost sixty years. Look at how large and how stable the language gap is across both.
- *Immigration, Diversity and Federalism* → **Favour Quebec separation (referendum)** (`bri_idim_005`, 1979–2026). This question was asked of national samples, so francophones outside Quebec are included. Compare the gap around 1980, the mid-1990s, and 2026.
- *Foreign Policy and Identity* → **Fed spending: defence** (`bri_intd_004`, 1985–2021). Look at whether the gap changes after 2008, and which language group's views moved.
- *Social Issues, Rights and Justice* → **Confidence in: organized religion** (`ces_soim_004`, 1993–2021). Compare the direction of the gap in the 1990s with its direction in 2019 and 2021.

## Region

Compare the five main regions (Atlantic, Quebec, Ontario, Prairies, and British Columbia).

- *Social Issues, Rights and Justice* → **General public allowed to own gun** (`bri_soim_012`, 1994–2026). Find the regions at either end, and see whether the distance between them grows over time.
- *Social Issues, Rights and Justice* → **Favour registration of all firearms** (`gal_soim_006`, 1975–2000). Compare the regional differences in 1975 with those in the late 1990s, and note which regions are at either end.
- *Foreign Policy and Identity* → **Fed spending: defence** (`bri_intd_004`, 1985–2021). Look for the region that stands out from the others, and whether the regional differences narrow over time.

## Religion

Comparing respondents with no religion and Catholics and Protestants combined. Religion is available up to 2024 but not in the 2026 Bridge Survey.

- *Social Issues, Rights and Justice* → **Favour same-sex marriage** (`bri_soim_011`, 1994–2015). Look at when the religious gap is largest, and how it compares with the same question's age gap (above).
- *Social Issues, Rights and Justice* → **Abortion legal in all/some/no cases** (`bri_soim_005`, 1983–2000). Notice how stable the gap is across the period.
- *Social Issues, Rights and Justice* → **Crack down on crime vs rights** (`ces_soim_012`, 1993–2011). Compare the gap in 1993 with the gap in 2011.
- *Social Issues, Rights and Justice* → **Better if more women stayed home** (`ces_soim_008`, 1993–2008). Compare the gap in 1993 with the surveys that follow.

## Union membership

Comparing respondents with and without a union member in their household.

- *Economy and Taxation* → **Labour unions too powerful** (`bri_econ_003`, 1979–2026). Look at the size of the gap, and at how both groups' views changed between 1989 and 2026.
- *Health, Education and Social Programs* → **Workers should have right to strike** (`bri_hwps_002`, 1962–2026). Compare the gap in earlier decades with 2026, and look at which group's views moved.
- *Health, Education and Social Programs* → **Essential services right to strike** (`gal_hwps_002`, 1974–1989). Notice how steady the gap is across the period.

## Community size

Comparing respondents in communities of more than 100,000 people with those in smaller communities. Community size is available up to 2022 but not in the 2026 Bridge Survey.

- *Immigration, Diversity and Federalism* → **Immigrants take jobs from Cdns** (`bri_idim_011`, 1989–2015). Compare the urban–rural gap in the early 1990s with the gap after 2005.
- *Immigration, Diversity and Federalism* → **Too much immigration to Canada** (`bri_idim_007`, 1981–2001). Compare this gap with the education gap on the same question (above).
- *Social Issues, Rights and Justice* → **Abortion: any woman who wants one** (`env_soim_010`, 1985–1997). Look at which group is more likely to agree.

## Next steps

To compute these gaps yourself and plot how they changed, see [CVPA R Package: Getting Started](/resources/cvpa-r-package/). Pass any of the question codes above to `question_data()`, and the group variable to `wtd_response()`.
