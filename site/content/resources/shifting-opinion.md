---
title: "Shifting Opinion: Where to Start"
---

Canadian public opinion on some issues has barely moved in fifty years. On others it has shifted dramatically, sometimes steadily over decades and sometimes within a few years. The questions below are good places to look for change. Some changed steadily, some reversed direction, and some moved sharply around a particular event.

These questions work well alongside our [interactive app](https://policyattitudes.ca/app/), which lets you explore long-term changes in policy attitudes and voting without writing any code. In the app, you choose a policy domain first and then an issue within it. The headings below are the app's domains, and each question is listed by its issue name in the app.

We also give each question's code (which you can look up on the [Data page](/data/) or pass to the [R package](/resources/cvpa-r-package/)), the years it's available, and a hint about what to look for. We leave the findings for you to discover!

**A note on comparing surveys.** Many questions were asked by different survey organizations at different times, for example by Gallup in one decade and by the Canadian Election Study in the next. When a question changes hands, part of any change you see may come from differences between the surveys rather than from a change in opinion. Changes within a single source are the safest to interpret.

## Democracy and Institutions

- **MPs lose touch (agree/disagree)** (`ces_dpin_001`, 1965–2011). Compare the 1960s and 1970s with 1993.

## Economy and Taxation

- **Canada better/worse off w free trade** (`gal_econ_006`, 1963–1990). Follow opinion through the 1980s, and look closely at the years around the 1988 "free trade election."
- **Labour unions too powerful** (`bri_econ_003`, 1979–2026). Compare the late 1970s with 1989, and then with 2026. Watch the middle category ("About right") as well as "Too much."
- **Govt wastes tax money** (`ces_econ_001`, 1965–2011). Compare the 1960s, the early 1990s, and the 2000s.

## Energy and Environment

- **Increase or stop nuclear generation** (`bri_ener_001`, 1976–2026). Follow opinion from 1976 to 1988, and think about the nuclear accidents at Three Mile Island (1979) and Chernobyl (1986). Then compare the 1980s with 2026.

## Foreign Policy and Identity

- **Opinion of US favourable** (`env_intd_003`, 1981–2005). Look at what changes between 2001 and 2004. What happened in between?
- **Fed spending: defence** (`bri_intd_004`, 1985–2021). Compare the mid-2000s with the years after 2008.

## Health, Education and Social Programs

- **Fed spending: health care** (`bri_hwps_009`, 1991–2015). Focus on the 1990s. The survey source changes in 2000, so treat the jump between 1999 and 2000 with care.

## Immigration, Diversity and Federalism

- **Want larger Cdn population** (`bri_idim_001`, 1955–2026). Compare the 1950s and 1960s with the years from 1975 onward.
- **Immigration: increase/decrease level** (`bri_idim_004`, 1975–2026). Follow the late 1990s closely, then compare 2000 with 2026.
- **Immigration: admit more/fewer** (`bri_idim_010`, 1988–2026). Watch the middle category ("Same") as well as "More" and "Fewer." When does it peak, and what happens afterward? Compare 2026 with the previous question.
- **Many refugees not real refugees** (`env_idim_028`, 1987–2010). Track agreement from the late 1980s to the late 2000s.

## Social Issues, Rights and Justice

- **Favour same-sex marriage** (`bri_soim_011`, 1994–2015). Look for the point where the balance of opinion tips. Same-sex marriage became legal across Canada in 2005.
- **Abortion legal in all/some/no cases** (`bri_soim_005`, 1975–2026). Watch the middle category ("Some cases") as well as "Always legal," and compare 2000 with 2026.
- **Doctors may end life: mercy killing** (`bri_soim_003`, 1968–2026). Compare 1968 and 1974 with the years from 1989 onward.
- **Favour capital punishment** (`bri_soim_002`, 1958–2010). Canada abolished the death penalty in 1976. Compare the 1960s, the early 1980s, and the 2000s.
- **Confidence in: organized religion** (`ces_soim_004`, 1993–2021). Compare 2011 with 2019.

## Next steps

To compute these trends yourself and plot them, see [CVPA R Package: Getting Started](/resources/cvpa-r-package/). Pass any of the question codes above to `question_data()` and then to `wtd_response()`. For differences between groups rather than change over time, see [Demographic Divides: Where to Start](/resources/where-to-start/).
