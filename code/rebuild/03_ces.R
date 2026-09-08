###############################################################################
# Canadian Election Study
# 16 survey blocks, oldest first. One block per survey, per wave for panel
# files. Edit a recode_values() arm to change a coding; add a line to add a
# variable.
###############################################################################

# 1965.dta -- Canadian Election Study, 2 questions
survey(
  survey_id = "1965.dta",
  source    = "Canadian Election Study",
  file_name = "CES-E-1965_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # MPs lose touch (agree/disagree)
      # V46
      ces_dpin_001 = recode_values(V46, 1 ~ 1, 2 ~ 0),

      # Govt wastes tax money
      # V38
      ces_econ_001 = recode_values(V38, 1 ~ 2, 2 ~ 1, 3 ~ 0)
    )
  }
)

# 1968.dta -- Canadian Election Study, 3 questions
survey(
  survey_id = "1968.dta",
  source    = "Canadian Election Study",
  file_name = "CES-E-1968_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # var306
      bri_idim_002 = recode_values(var306, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1),

      # MPs lose touch (agree/disagree)
      # var090
      ces_dpin_001 = recode_values(var090, 1 ~ 1, 2 ~ 0),

      # Govt wastes tax money
      # var097
      ces_econ_001 = recode_values(var097, 1 ~ 2, 2 ~ 1, 3 ~ 0)
    )
  }
)

# 1974-1980.dta -- Canadian Election Study, 2 questions (wave 1974.dta)
survey(
  survey_id = "1974-1980.dta",
  source    = "Canadian Election Study",
  file_name = "CES-E-1974-1980_F1.dta",
  id_stem   = "CES-E-1974-1980_F1(1974 Wave)",
  wave      = "1974.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # v124
      bri_idim_002 = recode_values(v124, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0),

      # MPs lose touch (agree/disagree)
      # v20
      ces_dpin_001 = recode_values(v20, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0)
    )
  }
)

# 1974-1980.dta -- Canadian Election Study, 1 question (wave 1980.dta)
survey(
  survey_id = "1974-1980.dta",
  source    = "Canadian Election Study",
  file_name = "CES-E-1974-1980_F1.dta",
  id_stem   = "CES-E-1974-1980_F1(1980 Wave)",
  wave      = "1980.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour QC option: special status
      # v3010
      ces_idim_001 = recode_values(v3010, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 1974-1980.dta -- Canadian Election Study, 1 question (wave 1979.dta)
survey(
  survey_id = "1974-1980.dta",
  source    = "Canadian Election Study",
  file_name = "CES-E-1974-1980_F1.dta",
  id_stem   = "CES-E-1974-1980_F1(1979 Wave)",
  wave      = "1979.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour QC option: special status
      # v1186
      ces_idim_001 = recode_values(v1186, c(1, 2) ~ 1, c(3, 4) ~ 0)
    )
  }
)

# 1988.dta -- Canadian Election Study, 7 questions
survey(
  survey_id = "1988.dta",
  source    = "Canadian Election Study",
  file_name = "ces1988.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigration: admit more/fewer
      # l5
      bri_idim_010 = recode_values(l5, 1 ~ 1, 3 ~ 0, 5 ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # h2a
      bri_intd_005 = recode_values(h2a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Fed policies made economy better/worse
      # g3
      ces_econ_002 = recode_values(g3, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Trade unions more/less power
      # h3
      ces_econ_003 = recode_values(h3, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Abortion: choice/need/never
      # xf4b
      # l6b
      # split ballot, 2 forms
      ces_soim_001 = coalesce(
        recode_values(xf4b, 1 ~ 2, 3 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(l6b, 1 ~ 2, 3 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Govt wastes tax money
      # qg2
      ces_econ_001 = recode_values(qg2, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999)
    )
  }
)

# 1993.dta -- Canadian Election Study, 44 questions
survey(
  survey_id = "1993.dta",
  source    = "Canadian Election Study",
  file_name = "ces1993.dta",
  recode = function(d) {
    d %>% transmute(
      # Decent living vs get ahead on own
      # mbsb4
      bri_econ_010 = recode_values(mbsb4, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # pese15
      bri_econ_011 = recode_values(pese15, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # mbsa12
      bri_ener_008 = recode_values(mbsa12, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Do more for racial minorities
      # cpsk3a
      bri_idim_014 = recode_values(cpsk3a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Immigration: admit more/fewer
      # cpsg5
      bri_idim_010 = recode_values(cpsg5, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # cpsf2a
      bri_intd_005 = recode_values(cpsf2a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Feminism: equal treatment vs men down
      # mbse2
      bri_soim_010 = recode_values(mbse2, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Living standard if QC separates
      # cpsg12
      ces_idim_002 = recode_values(cpsg12, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed policies made economy better/worse
      # cpsh3
      ces_econ_002 = recode_values(cpsh3, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # mbsf8
      ces_econ_004 = recode_values(mbsf8, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Don't get ahead: blame self not system
      # mbsa2
      ces_econ_005 = recode_values(mbsa2, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Confidence in: big business
      # mbsf12
      ces_econ_006 = recode_values(mbsf12, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Favour/oppose Cda-US free trade deal
      # cpsl1
      bri_econ_009 = recode_values(cpsl1, 0 ~ 9999, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Trade unions more/less power
      # cpsk1a
      ces_econ_003 = recode_values(cpsk1a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Welfare state reduces self-reliance
      # mbsa14
      ces_hwps_001 = recode_values(mbsa14, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Immigrants don't want to fit in
      # mbsg6
      ces_idim_005 = recode_values(mbsg6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Confidence in: armed forces
      # mbsf2
      ces_intd_001 = recode_values(mbsf2, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Peacekeeping abroad despite risk
      # mbsg1
      bri_intd_009 = recode_values(mbsg1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Better if more women stayed home
      # cpsg7a
      ces_soim_008 = recode_values(cpsg7a, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # cpsk2a
      ces_soim_002 = recode_values(cpsk2a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Homosexual couples allowed to marry
      # cpsg7b
      ces_soim_009 = recode_values(cpsg7b, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Gone too far pushing equal rights
      # mbsa1
      ces_soim_005 = recode_values(mbsa1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # French language threatened in QC
      # refe12
      ces_idim_003 = recode_values(refe12, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Only married should have children
      # cpsg7e
      ces_soim_006 = recode_values(cpsg7e, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Look after Cdn-born first
      # mbsa19
      ces_idim_006 = recode_values(mbsa19, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Fed services in one language per region
      # mbsd16
      ces_idim_008 = recode_values(mbsd16, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Govt heed well-informed citizens
      # mbsd10
      ces_soim_010 = recode_values(mbsd10, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Abortion: choice/need/never
      # cpsg6a
      # cpsg6b
      # cpsg6c
      # split ballot, 3 forms
      ces_soim_001 = coalesce(
        recode_values(cpsg6a, 1 ~ 0, 2 ~ 1, 3 ~ 2, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(cpsg6b, 1 ~ 1, 2 ~ 2, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(cpsg6c, 1 ~ 2, 2 ~ 0, 3 ~ 1, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Feminism: independent vs selfish
      # mbse8
      ces_soim_011 = recode_values(mbse8, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Majority rule vs minority rights
      # mbse3
      # refh20
      # split ballot, 2 forms
      ces_soim_007 = coalesce(
        recode_values(mbse3, 1 ~ 1, 2 ~ 0, 8 ~ 9999),
        recode_values(refh20, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # MPs lose touch (agree/disagree)
      # mbsd1
      ces_dpin_001 = recode_values(mbsd1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ NA_real_),

      # Cap punishment never justified
      # cpsg7c
      ces_soim_013 = recode_values(cpsg7c, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: police
      # mbsf9
      ces_soim_003 = recode_values(mbsf9, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Crack down on crime vs rights
      # pese15b
      ces_soim_012 = recode_values(pese15b, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: civil service
      # mbsf6
      ces_dpin_002 = recode_values(mbsf6, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # mbsf10
      ces_dpin_003 = recode_values(mbsf10, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Govt wastes tax money
      # mbsh2
      ces_econ_001 = recode_values(mbsh2, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # mbsf1
      ces_soim_004 = recode_values(mbsf1, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # mbsf11
      ces_dpin_004 = recode_values(mbsf11, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more/less for Quebec
      # cpsf1a
      ces_idim_004 = recode_values(cpsf1a, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Aboriginals could be well off if tried
      # mbse9
      ces_idim_007 = recode_values(mbse9, 1 ~ 1, 2 ~ 0, 8 ~ 9999)
    )
  }
)

# 1997.dta -- Canadian Election Study, 57 questions
survey(
  survey_id = "1997.dta",
  source    = "Canadian Election Study",
  file_name = "ces1997.dta",
  recode = function(d) {
    d %>% transmute(
      # Decent living vs get ahead on own
      # mbsb1
      bri_econ_010 = recode_values(mbsb1, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # cpsf6
      bri_econ_011 = recode_values(cpsf6, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # mbsa6
      bri_ener_008 = recode_values(mbsa6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigration: admit more/fewer
      # cpsj18
      bri_idim_010 = recode_values(cpsj18, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # pese4
      bri_intd_005 = recode_values(pese4, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Living standard if QC separates
      # pese10a
      ces_idim_002 = recode_values(pese10a, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC right to separate regardless
      # mbsg7
      ces_idim_013 = recode_values(mbsg7, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed policies made economy better/worse
      # cpsg1a
      # cpsg1b
      # split ballot, 2 forms
      ces_econ_002 = coalesce(
        recode_values(cpsg1a, 1 ~ 1, 5 ~ 0, 7 ~ -1, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(cpsg1b, 1 ~ -1, 5 ~ 0, 7 ~ 1, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Business profits benefit everyone
      # pese20
      ces_econ_007 = recode_values(pese20, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Cdn economy past year better/worse
      # cpsg1
      ces_econ_010 = recode_values(cpsg1, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # mbsf6
      ces_econ_004 = recode_values(mbsf6, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Want work, can find a job
      # mbsa12
      ces_econ_008 = recode_values(mbsa12, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Don't get ahead: blame self not system
      # pese19
      ces_econ_005 = recode_values(pese19, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: big business
      # mbsf10
      ces_econ_006 = recode_values(mbsf10, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Intl trade creates more jobs than lost
      # mbsd11
      ces_econ_009 = recode_values(mbsd11, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Free trade w US good for econ
      # mbsg10
      bri_econ_012 = recode_values(mbsg10, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Trade unions more/less power
      # pese3
      ces_econ_003 = recode_values(pese3, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: public schools
      # mbsf3
      ces_hwps_002 = recode_values(mbsf3, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Immigrants contribute to country
      # mbsd12
      ces_idim_009 = recode_values(mbsd12, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants don't want to fit in
      # mbsg4
      ces_idim_005 = recode_values(mbsg4, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: armed forces
      # mbsf2
      ces_intd_001 = recode_values(mbsf2, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Peacekeeping abroad despite risk
      # mbsg1
      bri_intd_009 = recode_values(mbsg1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Better if more women stayed home
      # cpsf3
      ces_soim_008 = recode_values(cpsf3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # pese1
      ces_soim_002 = recode_values(pese1, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Homosexual couples allowed to marry
      # mbsg3
      ces_soim_009 = recode_values(mbsg3, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing equal rights
      # mbsa1
      ces_soim_005 = recode_values(mbsa1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing bilingualism
      # mbsd7
      ces_idim_010 = recode_values(mbsd7, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # French language threatened in QC
      # pese10d
      ces_idim_003 = recode_values(pese10d, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Only married should have children
      # cpsf2
      ces_soim_006 = recode_values(cpsf2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Look after Cdn-born first
      # mbsa11
      ces_idim_006 = recode_values(mbsa11, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # How often hold referendums
      # mbsh5
      ces_dpin_007 = recode_values(mbsh5, 1 ~ 2, 2 ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Minority groups need special rights
      # mbsa14
      ces_idim_011 = recode_values(mbsa14, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Newer lifestyles break down society
      # mbsa7
      ces_soim_015 = recode_values(mbsa7, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt heed well-informed citizens
      # mbsd4
      ces_soim_010 = recode_values(mbsd4, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Abortion: choice/need/never
      # pese5c
      ces_soim_001 = recode_values(pese5c, 1 ~ 2, 2 ~ 0, 3 ~ 1, 8 ~ 9999, 9 ~ NA_real_),

      # More women in Parliament protects women
      # mbsd8
      ces_soim_016 = recode_values(mbsd8, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Feminism: independent vs selfish
      # mbse7
      ces_soim_011 = recode_values(mbse7, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Emphasize traditional family values
      # mbsa9
      ces_soim_017 = recode_values(mbsa9, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Majority seats w/o majority votes ok
      # mbsh7
      ces_dpin_006 = recode_values(mbsh7, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Majority rule vs minority rights
      # mbse3
      ces_soim_007 = recode_values(mbse3, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # MPs lose touch (agree/disagree)
      # cpsb10a
      ces_dpin_001 = recode_values(cpsb10a, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Cap punishment never justified
      # pese13
      ces_soim_013 = recode_values(pese13, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: courts
      # mbsf4
      ces_soim_018 = recode_values(mbsf4, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Final say on Charter: courts vs govt
      # mbse5
      ces_soim_019 = recode_values(mbse5, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Only police/military should have guns
      # pese12
      bri_soim_013 = recode_values(pese12, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: police
      # mbsf7
      ces_soim_003 = recode_values(mbsf7, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: media
      # mbsf11
      ces_soim_014 = recode_values(mbsf11, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: civil service
      # mbsf5
      ces_dpin_002 = recode_values(mbsf5, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # mbsf8
      ces_dpin_003 = recode_values(mbsf8, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Parties keep promises
      # cpsj13
      ces_dpin_005 = recode_values(cpsj13, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Govt wastes tax money
      # mbsb6
      ces_econ_001 = recode_values(mbsb6, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # mbsf1
      ces_soim_004 = recode_values(mbsf1, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # mbsf9
      ces_dpin_004 = recode_values(mbsf9, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Aboriginals could be well off if tried
      # mbse8
      ces_idim_007 = recode_values(mbse8, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Aboriginal peoples better/worse off
      # cpsj9
      ces_idim_014 = recode_values(cpsj9, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC anglos treated better than francos
      # mbsg6
      ces_idim_012 = recode_values(mbsg6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 2000.dta -- Canadian Election Study, 77 questions
survey(
  survey_id = "2000.dta",
  source    = "Canadian Election Study",
  file_name = "ces2000.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # cpsc13
      bri_econ_013 = recode_values(cpsc13, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Decent living vs get ahead on own
      # mbsb1
      bri_econ_010 = recode_values(mbsb1, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # cpsf6
      bri_econ_011 = recode_values(cpsf6, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # mbsa6
      bri_ener_008 = recode_values(mbsa6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt spending: welfare
      # pesd1b
      bri_hwps_004 = recode_values(pesd1b, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more for racial minorities
      # cpsc11
      bri_idim_014 = recode_values(cpsc11, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Immigration: admit more/fewer
      # cpsj18
      bri_idim_010 = recode_values(cpsj18, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # pesd4
      bri_intd_005 = recode_values(pesd4, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Feminism: equal treatment vs men down
      # mbsb2
      bri_soim_010 = recode_values(mbsb2, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Living standard if QC separates
      # pesc9
      ces_idim_002 = recode_values(pesc9, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC right to separate regardless
      # pesg18
      ces_idim_013 = recode_values(pesg18, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Business profits benefit everyone
      # pesg16
      ces_econ_007 = recode_values(pesg16, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Cdn economy past year better/worse
      # cpsg1
      ces_econ_010 = recode_values(cpsg1, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # mbsdf
      ces_econ_004 = recode_values(mbsdf, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Want work, can find a job
      # mbsa11
      ces_econ_008 = recode_values(mbsa11, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Should move to where jobs are
      # cpsf20
      ces_econ_011 = recode_values(cpsf20, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Don't get ahead: blame self not system
      # pesg15
      ces_econ_005 = recode_values(pesg15, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: big business
      # mbsdj
      ces_econ_006 = recode_values(mbsdj, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Intl trade creates more jobs than lost
      # mbse2
      ces_econ_009 = recode_values(mbse2, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Free trade w US good for econ
      # pesg17
      bri_econ_012 = recode_values(pesg17, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: health care
      # pesd1d
      bri_hwps_009 = recode_values(pesd1d, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Health care quality last 5 years
      # cpsc6
      ces_hwps_004 = recode_values(cpsc6, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Trade unions more/less power
      # pesd2
      ces_econ_003 = recode_values(pesd2, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: education
      # pesd1f
      bri_hwps_011 = recode_values(pesd1f, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: public schools
      # mbsdc
      ces_hwps_002 = recode_values(mbsdc, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Welfare state reduces self-reliance
      # mbsa4
      ces_hwps_001 = recode_values(mbsa4, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants contribute to country
      # mbsc10
      ces_idim_009 = recode_values(mbsc10, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants don't want to fit in
      # mbse3
      ces_idim_005 = recode_values(mbse3, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: armed forces
      # mbsdb
      ces_intd_001 = recode_values(mbsdb, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed spending: defence
      # pesd1a
      bri_intd_004 = recode_values(pesd1a, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Peacekeeping abroad despite risk
      # mbse1
      bri_intd_009 = recode_values(mbse1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Better if more women stayed home
      # cpsf3
      ces_soim_008 = recode_values(cpsf3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # cpsc10
      ces_soim_002 = recode_values(cpsc10, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Homosexual couples allowed to marry
      # cpsf18
      ces_soim_009 = recode_values(cpsf18, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Discrimination blocks women's jobs
      # mbsa5
      ces_soim_020 = recode_values(mbsa5, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing equal rights
      # mbsa1
      ces_soim_005 = recode_values(mbsa1, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing bilingualism
      # mbsc13
      ces_idim_010 = recode_values(mbsc13, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Non-voters no right to criticize
      # mbsc3
      ces_dpin_009 = recode_values(mbsc3, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # French language threatened in QC
      # pesc7
      ces_idim_003 = recode_values(pesc7, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Harder for non-whites to succeed
      # mbsa10
      bri_idim_012 = recode_values(mbsa10, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Only married should have children
      # mbse4
      ces_soim_006 = recode_values(mbse4, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Parties cater too much to minorities
      # mbsc6
      ces_idim_016 = recode_values(mbsc6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Look after Cdn-born first
      # mbsa12
      ces_idim_006 = recode_values(mbsa12, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Abortion access easy/difficult
      # pesg8
      ces_soim_021 = recode_values(pesg8, 0 ~ NA_real_, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # How often hold referendums
      # pesg4b
      # pesg4a
      # split ballot, 2 forms
      ces_dpin_007 = coalesce(
        recode_values(pesg4b, 1 ~ 2, 3 ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(pesg4a, 1 ~ 2, 3 ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Minority groups need special rights
      # mbsa14
      ces_idim_011 = recode_values(mbsa14, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Newer lifestyles break down society
      # mbsa7
      ces_soim_015 = recode_values(mbsa7, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed services in one language per region
      # mbse7
      ces_idim_008 = recode_values(mbse7, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt heed well-informed citizens
      # mbsc4
      ces_soim_010 = recode_values(mbsc4, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # More women in Parliament protects women
      # mbsa15
      ces_soim_016 = recode_values(mbsa15, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Feminism: independent vs selfish
      # mbsb7
      ces_soim_011 = recode_values(mbsb7, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # No point voting for small party
      # pesk13
      ces_dpin_010 = recode_values(pesk13, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Emphasize traditional family values
      # mbsa9
      ces_soim_017 = recode_values(mbsa9, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Majority seats w/o majority votes ok
      # pesg3
      ces_dpin_006 = recode_values(pesg3, 1 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Majority rule vs minority rights
      # mbsb3
      ces_soim_007 = recode_values(mbsb3, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # MPs lose touch (agree/disagree)
      # mbsc5
      ces_dpin_001 = recode_values(mbsc5, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Lay off women w working husbands first
      # mbsa3
      ces_hwps_003 = recode_values(mbsa3, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Referendum: reinstate death penalty
      # cpsc15
      bri_soim_007 = recode_values(cpsc15, 1 ~ 1, 5 ~ -1, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Final say on Charter: courts vs govt
      # pesg2
      ces_soim_019 = recode_values(pesg2, 1 ~ 1, 5 ~ 0, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Only police/military should have guns
      # cpsf19
      bri_soim_013 = recode_values(cpsf19, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: Supreme Court
      # mbsdd
      bri_soim_008 = recode_values(mbsdd, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: police
      # mbsdg
      ces_soim_003 = recode_values(mbsdg, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Crack down on crime vs rights
      # mbse5
      ces_soim_012 = recode_values(mbse5, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: media
      # mbsdk
      ces_soim_014 = recode_values(mbsdk, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: civil service
      # mbsde
      ces_dpin_002 = recode_values(mbsde, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # mbsdh
      ces_dpin_003 = recode_values(mbsdh, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Parties keep promises
      # cpsj13
      ces_dpin_005 = recode_values(cpsj13, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Right to know party campaign funds
      # cpsf7
      ces_dpin_008 = recode_values(cpsf7, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt wastes tax money
      # mbsb6
      ces_econ_001 = recode_values(mbsb6, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # mbsda
      ces_soim_004 = recode_values(mbsda, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # mbsdi
      ces_dpin_004 = recode_values(mbsdi, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more/less for Quebec
      # cpsc12
      ces_idim_004 = recode_values(cpsc12, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # QC separation: French lang better/worse
      # pesc8
      ces_idim_015 = recode_values(pesc8, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Aboriginals could be well off if tried
      # mbsb4
      ces_idim_007 = recode_values(mbsb4, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Aboriginal peoples better/worse off
      # cpsj9
      ces_idim_014 = recode_values(cpsj9, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC anglos treated better than francos
      # mbse6
      ces_idim_012 = recode_values(mbse6, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 2004-2006-2008.dta -- Canadian Election Study, 89 questions (wave 2004.dta)
survey(
  survey_id = "2004-2006-2008.dta",
  source    = "Canadian Election Study",
  file_name = "ces2004-6-8.dta",
  id_stem   = "ces2004-6-8(2004 Wave)",
  wave      = "2004.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # ces04_cps_f6
      bri_econ_013 = recode_values(ces04_cps_f6, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Decent living vs get ahead on own
      # ces04_mbs_b1
      bri_econ_010 = recode_values(ces04_mbs_b1, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # ces04_cps_p11
      bri_econ_011 = recode_values(ces04_cps_p11, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # ces04_mbs_a6
      bri_ener_008 = recode_values(ces04_mbs_a6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Pay to get medical treatment sooner
      # ces04_pes_g10
      bri_hwps_013 = recode_values(ces04_pes_g10, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt spending: welfare
      # ces04_pes_d1b
      bri_hwps_004 = recode_values(ces04_pes_d1b, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more for racial minorities
      # ces04_cps_f8
      bri_idim_014 = recode_values(ces04_cps_f8, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Immigration: admit more/fewer
      # ces04_cps_p9
      bri_idim_010 = recode_values(ces04_cps_p9, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # ces04_cps_f10
      bri_intd_005 = recode_values(ces04_cps_f10, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7, 8) ~ 9999, 9 ~ NA_real_),

      # Feminism: equal treatment vs men down
      # ces04_mbs_b2
      bri_soim_010 = recode_values(ces04_mbs_b2, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Favour same-sex marriage
      # ces04_cps_i1_3
      bri_soim_011 = recode_values(ces04_cps_i1_3, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Living standard if QC separates
      # ces04_pes_c13
      ces_idim_002 = recode_values(ces04_pes_c13, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC right to separate regardless
      # ces04_pes_g6
      ces_idim_013 = recode_values(ces04_pes_g6, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Corporate taxes up/down/same
      # ces04_pes_d1l
      ces_econ_012 = recode_values(ces04_pes_d1l, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Personal income taxes up/down/same
      # ces04_pes_d1k
      ces_econ_013 = recode_values(ces04_pes_d1k, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Business profits benefit everyone
      # ces04_pes_g2
      ces_econ_007 = recode_values(ces04_pes_g2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # ces04_mbs_df
      ces_econ_004 = recode_values(ces04_mbs_df, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Want work, can find a job
      # ces04_mbs_a11
      ces_econ_008 = recode_values(ces04_mbs_a11, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Should move to where jobs are
      # ces04_cps_p13
      ces_econ_011 = recode_values(ces04_cps_p13, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Don't get ahead: blame self not system
      # ces04_pes_g11
      ces_econ_005 = recode_values(ces04_pes_g11, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: big business
      # ces04_mbs_dj
      ces_econ_006 = recode_values(ces04_mbs_dj, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Intl trade creates more jobs than lost
      # ces04_mbs_g2
      ces_econ_009 = recode_values(ces04_mbs_g2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Free trade w US good for econ
      # ces04_pes_g4
      bri_econ_012 = recode_values(ces04_pes_g4, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: environment
      # ces04_pes_d1f
      ces_ener_001 = recode_values(ces04_pes_d1f, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Favour private hospitals in Cda
      # ces04_cps_i5
      ces_hwps_005 = recode_values(ces04_cps_i5, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: health care
      # ces04_pes_d1c
      bri_hwps_009 = recode_values(ces04_pes_d1c, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Trade unions more/less power
      # ces04_pes_d8
      ces_econ_003 = recode_values(ces04_pes_d8, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: education
      # ces04_pes_d1d
      bri_hwps_011 = recode_values(ces04_pes_d1d, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: public schools
      # ces04_mbs_dc
      ces_hwps_002 = recode_values(ces04_mbs_dc, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Welfare state reduces self-reliance
      # ces04_mbs_a4
      ces_hwps_001 = recode_values(ces04_mbs_a4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants contribute to country
      # ces04_mbs_e10
      ces_idim_009 = recode_values(ces04_mbs_e10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants don't want to fit in
      # ces04_mbs_g3
      ces_idim_005 = recode_values(ces04_mbs_g3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: armed forces
      # ces04_mbs_db
      ces_intd_001 = recode_values(ces04_mbs_db, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed spending: defence
      # ces04_pes_d1a
      bri_intd_004 = recode_values(ces04_pes_d1a, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Peacekeeping abroad despite risk
      # ces04_mbs_g1
      bri_intd_009 = recode_values(ces04_mbs_g1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # 10% of vote should get 10% of seats
      # ces04_mbs_e8
      ces_dpin_012 = recode_values(ces04_mbs_e8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Better if more women stayed home
      # ces04_cps_p14
      ces_soim_008 = recode_values(ces04_cps_p14, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # ces04_cps_f7
      ces_soim_002 = recode_values(ces04_cps_f7, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Homosexual couples allowed to marry
      # ces04_pes_g12_3
      ces_soim_009 = recode_values(ces04_pes_g12_3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Discrimination blocks women's jobs
      # ces04_mbs_a5
      ces_soim_020 = recode_values(ces04_mbs_a5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing equal rights
      # ces04_mbs_a1
      ces_soim_005 = recode_values(ces04_mbs_a1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing bilingualism
      # ces04_mbs_a13
      ces_idim_010 = recode_values(ces04_mbs_a13, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Non-voters no right to criticize
      # ces04_mbs_e3
      ces_dpin_009 = recode_values(ces04_mbs_e3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Duty to vote in fed elections
      # ces04_cps_p16
      ces_dpin_014 = recode_values(ces04_cps_p16, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Harder for non-whites to succeed
      # ces04_mbs_a10
      bri_idim_012 = recode_values(ces04_mbs_a10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Only married should have children
      # ces04_mbs_g4
      ces_soim_006 = recode_values(ces04_mbs_g4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Parties cater too much to minorities
      # ces04_mbs_e6
      ces_idim_016 = recode_values(ces04_mbs_e6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Look after Cdn-born first
      # ces04_mbs_a12
      ces_idim_006 = recode_values(ces04_mbs_a12, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Abortion access easy/difficult
      # ces04_pes_g13
      ces_soim_021 = recode_values(ces04_pes_g13, c(1, 2) ~ 1, c(3, 4) ~ 0, 6 ~ NA_real_, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Minority groups need special rights
      # ces04_mbs_a14
      ces_idim_011 = recode_values(ces04_mbs_a14, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Newer lifestyles break down society
      # ces04_mbs_a7
      ces_soim_015 = recode_values(ces04_mbs_a7, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed services in one language per region
      # ces04_mbs_g7
      ces_idim_008 = recode_values(ces04_mbs_g7, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt heed well-informed citizens
      # ces04_mbs_a2
      ces_soim_010 = recode_values(ces04_mbs_a2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Minority govt good/bad thing
      # ces04_cps_p0
      ces_soim_022 = recode_values(ces04_cps_p0, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # More women in Parliament protects women
      # ces04_mbs_a15
      ces_soim_016 = recode_values(ces04_mbs_a15, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Feminism: independent vs selfish
      # ces04_mbs_b6
      ces_soim_011 = recode_values(ces04_mbs_b6, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # No point voting for small party
      # ces04_pes_g5
      ces_dpin_010 = recode_values(ces04_pes_g5, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Emphasize traditional family values
      # ces04_mbs_a9
      ces_soim_017 = recode_values(ces04_mbs_a9, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Majority seats w/o majority votes ok
      # ces04_mbs_k7
      ces_dpin_006 = recode_values(ces04_mbs_k7, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Majority rule vs minority rights
      # ces04_mbs_b3
      ces_soim_007 = recode_values(ces04_mbs_b3, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Require female candidates by law
      # ces04_pes_k11b
      # ces04_pes_k11a: 1=required by law have minimum female candidates 2=each party decide how to get more female candidates 8=don't know 9=refused
      # split ballot, 2 forms
      ces_soim_025 = coalesce(
        recode_values(ces04_pes_k11b, 1 ~ 0, 2 ~ 1, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces04_pes_k11a, 1 ~ 1, 2 ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Adapt moral views to changing world
      # ces04_mbs_a8
      ces_soim_023 = recode_values(ces04_mbs_a8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # MPs lose touch (agree/disagree)
      # ces04_mbs_e5
      ces_dpin_001 = recode_values(ces04_mbs_e5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Small parties treated unfairly
      # ces04_mbs_g10
      ces_dpin_013 = recode_values(ces04_mbs_g10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Lay off women w working husbands first
      # ces04_mbs_a3
      ces_hwps_003 = recode_values(ces04_mbs_a3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Referendum: reinstate death penalty
      # ces04_cps_p10
      bri_soim_007 = recode_values(ces04_cps_p10, 1 ~ 1, 5 ~ -1, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Final say on Charter: courts vs govt
      # ces04_mbs_f12
      ces_soim_019 = recode_values(ces04_mbs_f12, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Only police/military should have guns
      # ces04_cps_p12
      bri_soim_013 = recode_values(ces04_cps_p12, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: Supreme Court
      # ces04_mbs_dd
      bri_soim_008 = recode_values(ces04_mbs_dd, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: police
      # ces04_mbs_dg
      ces_soim_003 = recode_values(ces04_mbs_dg, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Gun registry should be scrapped
      # ces04_cps_p15
      ces_soim_024 = recode_values(ces04_cps_p15, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Crack down on crime vs rights
      # ces04_mbs_g5
      ces_soim_012 = recode_values(ces04_mbs_g5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: media
      # ces04_mbs_dk
      ces_soim_014 = recode_values(ces04_mbs_dk, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Anger at sponsorship scandal
      # ces04_cps_l2
      ces_intd_002 = recode_values(ces04_cps_l2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Corp/union donation ban good thing
      # ces04_cps_fin_2
      ces_econ_016 = recode_values(ces04_cps_fin_2, 1 ~ 1, 3 ~ 0, c(5, 8) ~ 9999, 9 ~ NA_real_),

      # Confidence in: civil service
      # ces04_mbs_de
      ces_dpin_002 = recode_values(ces04_mbs_de, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # ces04_mbs_dh
      ces_dpin_003 = recode_values(ces04_mbs_dh, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Parties keep promises
      # ces04_cps_p6
      ces_dpin_005 = recode_values(ces04_cps_p6, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Govt wastes tax money
      # ces04_mbs_b8
      ces_econ_001 = recode_values(ces04_mbs_b8, -9 ~ NA_real_, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # ces04_mbs_da
      ces_soim_004 = recode_values(ces04_mbs_da, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # ces04_mbs_di
      ces_dpin_004 = recode_values(ces04_mbs_di, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more/less for Quebec
      # ces04_cps_f9
      ces_idim_004 = recode_values(ces04_cps_f9, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Favour Quebec separation
      # ces04_pes_c10
      bri_idim_002 = recode_values(ces04_pes_c10, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # No sovereignist party in Ottawa
      # ces04_cps_j4
      ces_idim_017 = recode_values(ces04_cps_j4, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC separation: French lang better/worse
      # ces04_pes_c12
      ces_idim_015 = recode_values(ces04_pes_c12, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Aboriginals could be well off if tried
      # ces04_mbs_b4
      ces_idim_007 = recode_values(ces04_mbs_b4, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Aboriginal peoples better/worse off
      # ces04_pes_d5
      ces_idim_014 = recode_values(ces04_pes_d5, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC anglos treated better than francos
      # ces04_mbs_g6
      ces_idim_012 = recode_values(ces04_mbs_g6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 2004-2006-2008.dta -- Canadian Election Study, 46 questions (wave 2006.dta)
survey(
  survey_id = "2004-2006-2008.dta",
  source    = "Canadian Election Study",
  file_name = "ces2004-6-8.dta",
  id_stem   = "ces2004-6-8(2006 Wave)",
  wave      = "2006.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # ces06_cps_f6
      bri_econ_013 = recode_values(ces06_cps_f6, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Leave job creation to private sector
      # ces06_cps_i2
      bri_econ_011 = recode_values(ces06_cps_i2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Pay to get medical treatment sooner
      # ces06_pes_g8
      bri_hwps_013 = recode_values(ces06_pes_g8, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fund public daycare vs money to parents
      # ces06_pes_g14
      bri_hwps_014 = recode_values(ces06_pes_g14, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt spending: welfare
      # ces06_pes_d1b
      bri_hwps_004 = recode_values(ces06_pes_d1b, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more for racial minorities
      # ces06_pes_i3
      bri_idim_014 = recode_values(ces06_pes_i3, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 98 ~ 9999, 99 ~ NA_real_),

      # Immigration: admit more/fewer
      # ces06_cps_p7
      bri_idim_010 = recode_values(ces06_cps_p7, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # ces06_cps_f8
      bri_intd_005 = recode_values(ces06_cps_f8, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7, 8) ~ 9999, 9 ~ NA_real_),

      # Favour same-sex marriage
      # ces06_cps_i9
      bri_soim_011 = recode_values(ces06_cps_i9, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Living standard if QC separates
      # ces06_pes_c13
      ces_idim_002 = recode_values(ces06_pes_c13, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Corporate taxes up/down/same
      # ces06_pes_d1l
      ces_econ_012 = recode_values(ces06_pes_d1l, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Personal income taxes up/down/same
      # ces06_pes_d1k
      ces_econ_013 = recode_values(ces06_pes_d1k, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Business profits benefit everyone
      # ces06_pes_g1
      ces_econ_007 = recode_values(ces06_pes_g1, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # NDP govt would hurt economy
      # ces06_cps_j4
      ces_econ_015 = recode_values(ces06_cps_j4, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Should move to where jobs are
      # ces06_cps_i5
      ces_econ_011 = recode_values(ces06_cps_i5, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Don't get ahead: blame self not system
      # ces06_pes_g9
      ces_econ_005 = recode_values(ces06_pes_g9, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Free trade w US good for econ
      # ces06_cps_i3
      bri_econ_012 = recode_values(ces06_cps_i3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: environment
      # ces06_pes_d1f
      ces_ener_001 = recode_values(ces06_pes_d1f, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Favour private hospitals in Cda
      # ces06_cps_i10
      ces_hwps_005 = recode_values(ces06_cps_i10, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: health care
      # ces06_pes_d1c
      bri_hwps_009 = recode_values(ces06_pes_d1c, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: education
      # ces06_pes_d1d
      bri_hwps_011 = recode_values(ces06_pes_d1d, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Immigrants take jobs from Cdns
      # ces06_pes_g10
      bri_idim_011 = recode_values(ces06_pes_g10, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: defence
      # ces06_pes_d1a
      bri_intd_004 = recode_values(ces06_pes_d1a, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Better if more women stayed home
      # ces06_cps_p3
      ces_soim_008 = recode_values(ces06_cps_p3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # ces06_pes_i4
      ces_soim_002 = recode_values(ces06_pes_i4, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 98 ~ 9999, 99 ~ NA_real_),

      # Homosexual couples allowed to marry
      # ces06_pes_g7
      ces_soim_009 = recode_values(ces06_pes_g7, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # French language threatened in QC
      # ces06_pes_c11
      ces_idim_003 = recode_values(ces06_pes_c11, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Duty to vote in fed elections
      # ces06_cps_p5
      ces_dpin_014 = recode_values(ces06_cps_p5, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Abortion access easy/difficult
      # ces06_pes_g11
      ces_soim_021 = recode_values(ces06_pes_g11, c(1, 2) ~ 1, c(3, 4) ~ 0, 6 ~ NA_real_, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Require female candidates by law
      # ces06_pes_g18a
      ces_soim_025 = recode_values(ces06_pes_g18a, 1 ~ 1, 2 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Minority govt good/bad thing
      # ces06_cps_min_1
      ces_soim_022 = recode_values(ces06_cps_min_1, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # No point voting for small party
      # ces06_pes_g3
      ces_dpin_010 = recode_values(ces06_pes_g3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Vote for reinstating death penalty
      # ces06_cps_i11
      bri_soim_004 = recode_values(ces06_cps_i11, 1 ~ 1, 3 ~ 0, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Only police/military should have guns
      # ces06_cps_p1
      bri_soim_013 = recode_values(ces06_cps_p1, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Gun registry should be scrapped
      # ces06_cps_p4
      ces_soim_024 = recode_values(ces06_cps_p4, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Anger at sponsorship scandal
      # ces06_cps_l2b
      # ces06_cps_l2a
      # split ballot, 2 forms
      ces_intd_002 = coalesce(
        recode_values(ces06_cps_l2b, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces06_cps_l2a, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Corp/union donation ban good thing
      # ces06_cps_fin_2
      ces_econ_016 = recode_values(ces06_cps_fin_2, 1 ~ 1, 3 ~ 0, c(5, 8) ~ 9999, 9 ~ NA_real_),

      # Parties keep promises
      # ces06_cps_p9
      # ces06_pes_g12
      # split ballot, 2 forms
      ces_dpin_005 = coalesce(
        recode_values(ces06_cps_p9, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),
        recode_values(ces06_pes_g12, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_)
      ),

      # Right to know party campaign funds
      # ces06_cps_i0
      ces_dpin_008 = recode_values(ces06_cps_i0, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for Quebec
      # ces06_cps_f7
      ces_idim_004 = recode_values(ces06_cps_f7, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 7 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Strong fed govt vs provincial power
      # ces06_pes_g13
      ces_idim_018 = recode_values(ces06_pes_g13, 1 ~ 1, 3 ~ 0, 5 ~ -1, 6 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Favour Quebec separation
      # ces06_pes_c10
      # ces06_cps_i8
      # split ballot, 2 forms
      bri_idim_002 = coalesce(
        recode_values(ces06_pes_c10, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces06_cps_i8, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # No sovereignist party in Ottawa
      # ces06_cps_j5
      ces_idim_017 = recode_values(ces06_cps_j5, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_)
    )
  }
)

# 2004-2006-2008.dta -- Canadian Election Study, 92 questions (wave 2008.dta)
survey(
  survey_id = "2004-2006-2008.dta",
  source    = "Canadian Election Study",
  file_name = "ces2004-6-8.dta",
  id_stem   = "ces2004-6-8(2008 Wave)",
  wave      = "2008.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # ces08_pes_f6
      bri_econ_013 = recode_values(ces08_pes_f6, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Decent living vs get ahead on own
      # ces08_mbs_b1
      bri_econ_010 = recode_values(ces08_mbs_b1, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # ces08_pes_i2n
      bri_econ_011 = recode_values(ces08_pes_i2n, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # ces08_mbs_a15
      bri_ener_008 = recode_values(ces08_mbs_a15, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Pay to get medical treatment sooner
      # ces08_pes_g6
      bri_hwps_013 = recode_values(ces08_pes_g6, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fund public daycare vs money to parents
      # ces08_pes_g14
      bri_hwps_014 = recode_values(ces08_pes_g14, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt spending: welfare
      # ces08_pes_d1b
      bri_hwps_004 = recode_values(ces08_pes_d1b, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more for racial minorities
      # ces08_pes_i3
      bri_idim_014 = recode_values(ces08_pes_i3, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Immigration: admit more/fewer
      # ces08_pes_p6
      bri_idim_010 = recode_values(ces08_pes_p6, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # ces08_pes_f8
      bri_intd_005 = recode_values(ces08_pes_f8, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7, 8) ~ 9999, 9 ~ NA_real_),

      # Feminism: equal treatment vs men down
      # ces08_mbs_b2
      bri_soim_010 = recode_values(ces08_mbs_b2, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Favour same-sex marriage
      # ces08_pes_p7
      bri_soim_011 = recode_values(ces08_pes_p7, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Living standard if QC separates
      # ces08_pes_c12
      ces_idim_002 = recode_values(ces08_pes_c12, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Corporate taxes up/down/same
      # ces08_pes_d1l
      ces_econ_012 = recode_values(ces08_pes_d1l, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Personal income taxes up/down/same
      # ces08_pes_d1k
      ces_econ_013 = recode_values(ces08_pes_d1k, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt involvement vs private sector
      # ces08_pes_g15
      ces_econ_014 = recode_values(ces08_pes_g15, 1 ~ 1, 5 ~ -1, 7 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Business profits benefit everyone
      # ces08_pes_g1
      ces_econ_007 = recode_values(ces08_pes_g1, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # ces08_mbs_df
      ces_econ_004 = recode_values(ces08_mbs_df, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Want work, can find a job
      # ces08_mbs_a11
      ces_econ_008 = recode_values(ces08_mbs_a11, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Should move to where jobs are
      # ces08_pes_i5n
      ces_econ_011 = recode_values(ces08_pes_i5n, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Don't get ahead: blame self not system
      # ces08_pes_g7
      ces_econ_005 = recode_values(ces08_pes_g7, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: big business
      # ces08_mbs_dj
      ces_econ_006 = recode_values(ces08_mbs_dj, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Intl trade creates more jobs than lost
      # ces08_mbs_h2
      ces_econ_009 = recode_values(ces08_mbs_h2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Free trade w US good for econ
      # ces08_pes_i3n
      bri_econ_012 = recode_values(ces08_pes_i3n, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: environment
      # ces08_pes_d1f
      ces_ener_001 = recode_values(ces08_pes_d1f, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Favour private hospitals in Cda
      # ces08_pes_p8
      ces_hwps_005 = recode_values(ces08_pes_p8, 1 ~ 1, 3 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: health care
      # ces08_pes_d1c
      bri_hwps_009 = recode_values(ces08_pes_d1c, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: education
      # ces08_pes_d1d
      bri_hwps_011 = recode_values(ces08_pes_d1d, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: public schools
      # ces08_mbs_dc
      ces_hwps_002 = recode_values(ces08_mbs_dc, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Welfare state reduces self-reliance
      # ces08_mbs_a4
      ces_hwps_001 = recode_values(ces08_mbs_a4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants contribute to country
      # ces08_mbs_a6
      ces_idim_009 = recode_values(ces08_mbs_a6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants take jobs from Cdns
      # ces08_mbs_h10
      bri_idim_011 = recode_values(ces08_mbs_h10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants don't want to fit in
      # ces08_mbs_h3
      ces_idim_005 = recode_values(ces08_mbs_h3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: armed forces
      # ces08_mbs_db
      ces_intd_001 = recode_values(ces08_mbs_db, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed spending: defence
      # ces08_pes_d1a
      bri_intd_004 = recode_values(ces08_pes_d1a, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Peacekeeping abroad despite risk
      # ces08_mbs_h1
      bri_intd_009 = recode_values(ces08_mbs_h1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Crack down on terrorists vs rights
      # ces08_mbs_h12
      bri_intd_011 = recode_values(ces08_mbs_h12, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # 10% of vote should get 10% of seats
      # ces08_mbs_e9
      ces_dpin_012 = recode_values(ces08_mbs_e9, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Better if more women stayed home
      # ces08_pes_p3
      ces_soim_008 = recode_values(ces08_pes_p3, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more/less for women
      # ces08_pes_i4
      ces_soim_002 = recode_values(ces08_pes_i4, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 8 ~ 9999, 9 ~ NA_real_),

      # Homosexual couples allowed to marry
      # ces08_pes_g5
      ces_soim_009 = recode_values(ces08_pes_g5, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Discrimination blocks women's jobs
      # ces08_mbs_a5
      ces_soim_020 = recode_values(ces08_mbs_a5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing equal rights
      # ces08_mbs_a1
      ces_soim_005 = recode_values(ces08_mbs_a1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing bilingualism
      # ces08_mbs_a13
      ces_idim_010 = recode_values(ces08_mbs_a13, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Non-voters no right to criticize
      # ces08_mbs_e3
      ces_dpin_009 = recode_values(ces08_mbs_e3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Duty to vote in fed elections
      # ces08_cps_p1
      ces_dpin_014 = recode_values(ces08_cps_p1, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Harder for non-whites to succeed
      # ces08_mbs_a10
      bri_idim_012 = recode_values(ces08_mbs_a10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Only married should have children
      # ces08_mbs_h4
      ces_soim_006 = recode_values(ces08_mbs_h4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Parties cater too much to minorities
      # ces08_mbs_e6
      ces_idim_016 = recode_values(ces08_mbs_e6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Look after Cdn-born first
      # ces08_mbs_a12
      ces_idim_006 = recode_values(ces08_mbs_a12, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Abortion access easy/difficult
      # ces08_pes_g11
      ces_soim_021 = recode_values(ces08_pes_g11, c(1, 2) ~ 1, c(3, 4) ~ 0, 6 ~ NA_real_, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Minority groups need special rights
      # ces08_mbs_a14
      ces_idim_011 = recode_values(ces08_mbs_a14, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Newer lifestyles break down society
      # ces08_mbs_a7
      ces_soim_015 = recode_values(ces08_mbs_a7, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed services in one language per region
      # ces08_mbs_h6
      ces_idim_008 = recode_values(ces08_mbs_h6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt heed well-informed citizens
      # ces08_mbs_a2
      ces_soim_010 = recode_values(ces08_mbs_a2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Minority govt good/bad thing
      # ces08_pes_min_1
      # ces08_cps_min_1
      # split ballot, 2 forms
      ces_soim_022 = coalesce(
        recode_values(ces08_pes_min_1, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces08_cps_min_1, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # More women in Parliament protects women
      # ces08_mbs_e10
      ces_soim_016 = recode_values(ces08_mbs_e10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Feminism: independent vs selfish
      # ces08_mbs_b6
      ces_soim_011 = recode_values(ces08_mbs_b6, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # No point voting for small party
      # ces08_cps_p2
      ces_dpin_010 = recode_values(ces08_cps_p2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Emphasize traditional family values
      # ces08_mbs_a9
      ces_soim_017 = recode_values(ces08_mbs_a9, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Majority seats w/o majority votes ok
      # ces08_mbs_g7
      ces_dpin_006 = recode_values(ces08_mbs_g7, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Majority rule vs minority rights
      # ces08_mbs_b3
      ces_soim_007 = recode_values(ces08_mbs_b3, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Adapt moral views to changing world
      # ces08_mbs_a8
      ces_soim_023 = recode_values(ces08_mbs_a8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # MPs lose touch (agree/disagree)
      # ces08_mbs_e5
      ces_dpin_001 = recode_values(ces08_mbs_e5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Small parties treated unfairly
      # ces08_mbs_h8
      ces_dpin_013 = recode_values(ces08_mbs_h8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Lay off women w working husbands first
      # ces08_mbs_a3
      ces_hwps_003 = recode_values(ces08_mbs_a3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Vote for reinstating death penalty
      # ces08_pes_p9
      bri_soim_004 = recode_values(ces08_pes_p9, 1 ~ 1, 3 ~ 0, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Final say on Charter: courts vs govt
      # ces08_mbs_b9
      ces_soim_019 = recode_values(ces08_mbs_b9, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Only police/military should have guns
      # ces08_pes_p1
      bri_soim_013 = recode_values(ces08_pes_p1, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: Supreme Court
      # ces08_mbs_dd
      bri_soim_008 = recode_values(ces08_mbs_dd, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: police
      # ces08_mbs_dg
      ces_soim_003 = recode_values(ces08_mbs_dg, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Crack down on crime vs rights
      # ces08_mbs_h5
      ces_soim_012 = recode_values(ces08_mbs_h5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: media
      # ces08_mbs_dk
      ces_soim_014 = recode_values(ces08_mbs_dk, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Corp/union donation ban good thing
      # ces08_mbs_k2
      ces_econ_016 = recode_values(ces08_mbs_k2, -9 ~ NA_real_, 1 ~ 1, 5 ~ 0, 8 ~ 9999),

      # Confidence in: Elections Canada
      # ces08_mbs_dl
      ces_dpin_011 = recode_values(ces08_mbs_dl, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: civil service
      # ces08_mbs_de
      ces_dpin_002 = recode_values(ces08_mbs_de, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # ces08_mbs_dh
      ces_dpin_003 = recode_values(ces08_mbs_dh, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Parties keep promises
      # ces08_pes_g12
      ces_dpin_005 = recode_values(ces08_pes_g12, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Right to know party campaign funds
      # ces08_mbs_e4
      ces_dpin_008 = recode_values(ces08_mbs_e4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt wastes tax money
      # ces08_mbs_b8
      ces_econ_001 = recode_values(ces08_mbs_b8, -9 ~ NA_real_, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # ces08_mbs_da
      ces_soim_004 = recode_values(ces08_mbs_da, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # ces08_mbs_di
      ces_dpin_004 = recode_values(ces08_mbs_di, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more/less for Quebec
      # ces08_pes_f7
      ces_idim_004 = recode_values(ces08_pes_f7, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 7 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Favour Quebec separation
      # ces08_cps_q9
      # ces08_pes_c10
      # split ballot, 2 forms
      bri_idim_002 = coalesce(
        recode_values(ces08_cps_q9, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces08_pes_c10, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # Strong fed govt vs provincial power
      # ces08_pes_g13
      ces_idim_018 = recode_values(ces08_pes_g13, 0 ~ 9999, 1 ~ 1, 3 ~ 0, 5 ~ -1, 6 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # No sovereignist party in Ottawa
      # ces08_cps_j2
      # ces08_pes_g9
      # split ballot, 2 forms
      ces_idim_017 = coalesce(
        recode_values(ces08_cps_j2, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),
        recode_values(ces08_pes_g9, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_)
      ),

      # QC separation: French lang better/worse
      # ces08_pes_c11
      ces_idim_015 = recode_values(ces08_pes_c11, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Aboriginals could be well off if tried
      # ces08_mbs_b4
      ces_idim_007 = recode_values(ces08_mbs_b4, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # QC anglos treated better than francos
      # ces08_mbs_h11
      ces_idim_012 = recode_values(ces08_mbs_h11, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 2011.dta -- Canadian Election Study, 83 questions
survey(
  survey_id = "2011.dta",
  source    = "Canadian Election Study",
  file_name = "CES2011_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # PES11_41
      bri_econ_013 = recode_values(PES11_41, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Decent living vs get ahead on own
      # MBS11_B3
      bri_econ_010 = recode_values(MBS11_B3, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Leave job creation to private sector
      # PES11_22
      bri_econ_011 = recode_values(PES11_22, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Environment more important than jobs
      # MBS11_C14
      bri_ener_008 = recode_values(MBS11_C14, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Pay to get medical treatment sooner
      # PES11_25
      bri_hwps_013 = recode_values(PES11_25, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fund public daycare vs money to parents
      # PES11_56
      bri_hwps_014 = recode_values(PES11_56, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt spending: welfare
      # CPS11_33
      bri_hwps_004 = recode_values(CPS11_33, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Do more for racial minorities
      # PES11_42
      bri_idim_014 = recode_values(PES11_42, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Immigration: admit more/fewer
      # PES11_28
      bri_idim_010 = recode_values(PES11_28, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Ties with US closer/more distant
      # PES11_45
      bri_intd_005 = recode_values(PES11_45, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 8) ~ 9999, 9 ~ NA_real_),

      # Favour same-sex marriage
      # PES11_29
      bri_soim_011 = recode_values(PES11_29, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Living standard if QC separates
      # PES11_40
      ces_idim_002 = recode_values(PES11_40, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed policies made economy better/worse
      # CPS11_40
      ces_econ_002 = recode_values(CPS11_40, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Corporate taxes up/down/same
      # CPS11_31
      ces_econ_012 = recode_values(CPS11_31, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Personal income taxes up/down/same
      # CPS11_30
      ces_econ_013 = recode_values(CPS11_30, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Govt involvement vs private sector
      # PES11_57
      ces_econ_014 = recode_values(PES11_57, 1 ~ 1, 5 ~ -1, 7 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Business profits benefit everyone
      # PES11_47
      ces_econ_007 = recode_values(PES11_47, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # NDP govt would hurt economy
      # PES11_52b
      ces_econ_015 = recode_values(PES11_52b, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: labour unions
      # MBS11_D2f
      ces_econ_004 = recode_values(MBS11_D2f, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Want work, can find a job
      # MBS11_C10
      ces_econ_008 = recode_values(MBS11_C10, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Should move to where jobs are
      # PES11_24
      ces_econ_011 = recode_values(PES11_24, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Don't get ahead: blame self not system
      # PES11_49
      ces_econ_005 = recode_values(PES11_49, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: big business
      # MBS11_D2j
      ces_econ_006 = recode_values(MBS11_D2j, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Intl trade creates more jobs than lost
      # MBS11_I2
      ces_econ_009 = recode_values(MBS11_I2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Free trade w US good for econ
      # MBS11_A3
      bri_econ_012 = recode_values(MBS11_A3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed spending: environment
      # CPS11_35
      ces_ener_001 = recode_values(CPS11_35, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: health care
      # CPS11_32
      bri_hwps_009 = recode_values(CPS11_32, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Health care quality last 5 years
      # MBS11_E1
      ces_hwps_004 = recode_values(MBS11_E1, -9 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 8 ~ 9999),

      # Fed spending: education
      # CPS11_34
      bri_hwps_011 = recode_values(CPS11_34, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: public schools
      # MBS11_D2c
      ces_hwps_002 = recode_values(MBS11_D2c, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Welfare state reduces self-reliance
      # MBS11_C2
      ces_hwps_001 = recode_values(MBS11_C2, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants contribute to country
      # MBS11_C4
      ces_idim_009 = recode_values(MBS11_C4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Immigrants take jobs from Cdns
      # PES11_51
      bri_idim_011 = recode_values(PES11_51, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Immigrants don't want to fit in
      # MBS11_I3
      ces_idim_005 = recode_values(MBS11_I3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed spending: immigrants/minorities
      # CPS11_38
      ces_idim_019 = recode_values(CPS11_38, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: armed forces
      # MBS11_D2b
      ces_intd_001 = recode_values(MBS11_D2b, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed spending: defence
      # CPS11_37
      bri_intd_004 = recode_values(CPS11_37, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Peacekeeping abroad despite risk
      # MBS11_I1
      bri_intd_009 = recode_values(MBS11_I1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Crack down on terrorists vs rights
      # MBS11_I12
      bri_intd_011 = recode_values(MBS11_I12, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # 10% of vote should get 10% of seats
      # MBS11_A13
      ces_dpin_012 = recode_values(MBS11_A13, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Do more/less for women
      # PES11_43
      ces_soim_002 = recode_values(PES11_43, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Discrimination blocks women's jobs
      # MBS11_C3
      ces_soim_020 = recode_values(MBS11_C3, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing equal rights
      # MBS11_C1
      ces_soim_005 = recode_values(MBS11_C1, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Gone too far pushing bilingualism
      # MBS11_C12
      ces_idim_010 = recode_values(MBS11_C12, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # French language threatened in QC
      # MBS11_G8
      ces_idim_003 = recode_values(MBS11_G8, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Harder for non-whites to succeed
      # MBS11_C9
      bri_idim_012 = recode_values(MBS11_C9, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Only married should have children
      # MBS11_I4
      ces_soim_006 = recode_values(MBS11_I4, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Look after Cdn-born first
      # MBS11_C11
      ces_idim_006 = recode_values(MBS11_C11, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Minority groups need special rights
      # MBS11_C13
      ces_idim_011 = recode_values(MBS11_C13, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Newer lifestyles break down society
      # MBS11_C6
      ces_soim_015 = recode_values(MBS11_C6, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Fed services in one language per region
      # MBS11_I7
      ces_idim_008 = recode_values(MBS11_I7, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Minority govt good/bad thing
      # CPS11_46
      ces_soim_022 = recode_values(CPS11_46, 1 ~ 1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # More women in Parliament protects women
      # MBS11_A9
      ces_soim_016 = recode_values(MBS11_A9, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Emphasize traditional family values
      # MBS11_C8
      ces_soim_017 = recode_values(MBS11_C8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Majority seats w/o majority votes ok
      # MBS11_G5
      ces_dpin_006 = recode_values(MBS11_G5, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Majority rule vs minority rights
      # MBS11_B4
      ces_soim_007 = recode_values(MBS11_B4, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Adapt moral views to changing world
      # MBS11_C7
      ces_soim_023 = recode_values(MBS11_C7, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # MPs lose touch (agree/disagree)
      # MBS11_A8
      ces_dpin_001 = recode_values(MBS11_A8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Small parties treated unfairly
      # MBS11_I8
      ces_dpin_013 = recode_values(MBS11_I8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: courts
      # MBS11_D2d
      ces_soim_018 = recode_values(MBS11_D2d, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Referendum: reinstate death penalty
      # PES11_36
      bri_soim_007 = recode_values(PES11_36, 1 ~ 1, 5 ~ -1, 7 ~ NA_real_, 8 ~ 9999, 9 ~ NA_real_),

      # Fed spending: crime and justice
      # CPS11_36
      ces_soim_026 = recode_values(CPS11_36, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Final say on Charter: courts vs govt
      # MBS11_B8
      ces_soim_019 = recode_values(MBS11_B8, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # Only police/military should have guns
      # PES11_23
      bri_soim_013 = recode_values(PES11_23, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Confidence in: police
      # MBS11_D2g
      ces_soim_003 = recode_values(MBS11_D2g, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Gun registry should be scrapped
      # PES11_27
      ces_soim_024 = recode_values(PES11_27, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Crack down on crime vs rights
      # MBS11_I5
      ces_soim_012 = recode_values(MBS11_I5, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Confidence in: media
      # MBS11_D2k
      ces_soim_014 = recode_values(MBS11_D2k, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: Elections Canada
      # MBS11_D2l
      ces_dpin_011 = recode_values(MBS11_D2l, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: civil service
      # MBS11_D2e
      ces_dpin_002 = recode_values(MBS11_D2e, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: federal govt
      # MBS11_D2h
      ces_dpin_003 = recode_values(MBS11_D2h, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Parties keep promises
      # PES11_54
      ces_dpin_005 = recode_values(PES11_54, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Right to know party campaign funds
      # MBS11_J8
      ces_dpin_008 = recode_values(MBS11_J8, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Govt wastes tax money
      # MBS11_B6
      ces_econ_001 = recode_values(MBS11_B6, -9 ~ NA_real_, 1 ~ 2, 2 ~ 1, 3 ~ 0, 8 ~ 9999),

      # Confidence in: organized religion
      # MBS11_D2a
      ces_soim_004 = recode_values(MBS11_D2a, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Confidence in: provincial govt
      # MBS11_D2i
      ces_dpin_004 = recode_values(MBS11_D2i, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more/less for Quebec
      # PES11_44
      ces_idim_004 = recode_values(PES11_44, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, 9 ~ NA_real_),

      # Senate should be abolished
      # MBS11_A14
      ces_dpin_015 = recode_values(MBS11_A14, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999),

      # Favour Quebec separation
      # CPS11_75
      bri_idim_002 = recode_values(CPS11_75, c(1, 3) ~ 1, c(5, 7) ~ -1, 98 ~ 9999, 99 ~ NA_real_),

      # No sovereignist party in Ottawa
      # PES11_52c
      ces_idim_017 = recode_values(PES11_52c, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC separation: French lang better/worse
      # PES11_39
      ces_idim_015 = recode_values(PES11_39, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Aboriginals could be well off if tried
      # MBS11_B5
      ces_idim_007 = recode_values(MBS11_B5, -9 ~ NA_real_, 1 ~ 1, 2 ~ 0, 8 ~ 9999),

      # QC anglos treated better than francos
      # MBS11_I11
      ces_idim_012 = recode_values(MBS11_I11, -9 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 8 ~ 9999)
    )
  }
)

# 2015.dta -- Canadian Election Study, 34 questions
survey(
  survey_id = "2015.dta",
  source    = "Canadian Election Study",
  file_name = "CES2015_Combined.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # p_gap
      bri_econ_013 = recode_values(p_gap, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Leave job creation to private sector
      # p_iss_priv
      bri_econ_011 = recode_values(p_iss_priv, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Pay to get medical treatment sooner
      # p_iss_medi
      bri_hwps_013 = recode_values(p_iss_medi, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fund public daycare vs money to parents
      # p_daycare
      bri_hwps_014 = recode_values(p_daycare, 1 ~ 1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Govt spending: welfare
      # spnd_welf
      bri_hwps_004 = recode_values(spnd_welf, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Do more for racial minorities
      # p_racmin
      bri_idim_014 = recode_values(p_racmin, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Immigration: admit more/fewer
      # p_immg
      bri_idim_010 = recode_values(p_immg, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Ties with US closer/more distant
      # p_usties
      bri_intd_005 = recode_values(p_usties, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Favour same-sex marriage
      # p_ssm
      bri_soim_011 = recode_values(p_ssm, 1 ~ 1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Living standard if QC separates
      # p_sovliving
      ces_idim_002 = recode_values(p_sovliving, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Fed policies made economy better/worse
      # econ_fdpol
      ces_econ_002 = recode_values(econ_fdpol, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Corporate taxes up/down/same
      # taxes_corp
      ces_econ_012 = recode_values(taxes_corp, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Personal income taxes up/down/same
      # taxes
      ces_econ_013 = recode_values(taxes, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Govt involvement vs private sector
      # p_govpriv
      ces_econ_014 = recode_values(p_govpriv, 1 ~ 1, 5 ~ -1, 7 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Business profits benefit everyone
      # p_iss_busi
      ces_econ_007 = recode_values(p_iss_busi, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # NDP govt would hurt economy
      # ndp_econ
      ces_econ_015 = recode_values(ndp_econ, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # Should move to where jobs are
      # p_iss_jobs
      ces_econ_011 = recode_values(p_iss_jobs, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Don't get ahead: blame self not system
      # p_iss_blam
      ces_econ_005 = recode_values(p_iss_blam, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: environment
      # spnd_envi
      ces_ener_001 = recode_values(spnd_envi, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: health care
      # spnd_hlth
      bri_hwps_009 = recode_values(spnd_hlth, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: education
      # spnd_educ
      bri_hwps_011 = recode_values(spnd_educ, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Immigrants take jobs from Cdns
      # p_iss_immg
      bri_idim_011 = recode_values(p_iss_immg, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: immigrants/minorities
      # spnd_immg
      ces_idim_019 = recode_values(spnd_immg, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: defence
      # spnd_defn
      bri_intd_004 = recode_values(spnd_defn, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Crack down on terrorists vs rights
      # p_iss_terr
      bri_intd_011 = recode_values(p_iss_terr, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Do more/less for women
      # p_women
      ces_soim_002 = recode_values(p_women, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Fed spending: crime and justice
      # spnd_crim
      ces_soim_026 = recode_values(spnd_crim, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Only police/military should have guns
      # p_iss_guns
      bri_soim_013 = recode_values(p_iss_guns, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Parties keep promises
      # p_promises
      ces_dpin_005 = recode_values(p_promises, 1 ~ 2, 3 ~ 1, 5 ~ 0, c(7, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Do more/less for Quebec
      # p_doquebec
      ces_idim_004 = recode_values(p_doquebec, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(7, 8) ~ 9999, c(9, 1000) ~ NA_real_),

      # Senate should be abolished
      # p_iss_abol
      ces_dpin_015 = recode_values(p_iss_abol, c(1, 2, 3) ~ 1, c(5, 6, 7) ~ 0, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # Favour Quebec separation
      # sov
      bri_idim_002 = recode_values(sov, c(1, 3) ~ 1, c(5, 7) ~ -1, 8 ~ 9999, c(9, 1000) ~ NA_real_),

      # No sovereignist party in Ottawa
      # noreason_sov
      ces_idim_017 = recode_values(noreason_sov, c(1, 3) ~ 1, c(5, 7) ~ 0, 8 ~ 9999, 9 ~ NA_real_),

      # QC separation: French lang better/worse
      # p_sovfrench
      ces_idim_015 = recode_values(p_sovfrench, 1 ~ 1, 3 ~ -1, 5 ~ 0, 8 ~ 9999, 9 ~ NA_real_)
    )
  }
)

# 2019.dta -- Canadian Election Study, 44 questions
survey(
  survey_id = "2019.dta",
  source    = "Canadian Election Study",
  file_name = "2019+Canadian+Election+Study+-+Online+Survey+v1.0.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # pes19_gap
      bri_econ_013 = recode_values(pes19_gap, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Decent living vs get ahead on own
      # pes19_stdofliving
      bri_econ_010 = recode_values(pes19_stdofliving, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt should continue carbon tax
      # cps19_pos_carbon
      # pes19_pos_carbon
      # split ballot, 2 forms
      bri_ener_009 = coalesce(
        recode_values(cps19_pos_carbon, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes19_pos_carbon, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Jobs come first over environment
      # cps19_pos_jobs
      # pes19_envirojob
      # split ballot, 2 forms
      bri_ener_010 = coalesce(
        recode_values(cps19_pos_jobs, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes19_envirojob, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Fed govt help energy sector/pipelines
      # cps19_pos_energy
      # pes19_pos_energy
      # split ballot, 2 forms
      bri_ener_011 = coalesce(
        recode_values(cps19_pos_energy, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes19_pos_energy, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Do more for racial minorities
      # pes19_donerm
      bri_idim_014 = recode_values(pes19_donerm, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Immigration: admit more/fewer
      # cps19_imm
      bri_idim_010 = recode_values(cps19_imm, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Admit more or fewer refugees
      # cps19_refugees
      bri_idim_008 = recode_values(cps19_refugees, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Ties with US closer/more distant
      # pes19_tieus
      bri_intd_005 = recode_values(pes19_tieus, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Abortion legal in all/some/no cases
      # pes19_abort2
      bri_soim_005 = recode_values(pes19_abort2, 1 ~ 0, 2 ~ 1, 3 ~ 2, 4 ~ 9999),

      # Living standard if QC separates
      # pes19_qcsol
      ces_idim_002 = recode_values(pes19_qcsol, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed policies made economy better/worse
      # cps19_econ_fed
      ces_econ_002 = recode_values(cps19_econ_fed, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Income inequality a big problem
      # pes19_inequal
      ces_econ_017 = recode_values(pes19_inequal, c(1, 2) ~ 1, 3 ~ 9999, c(4, 5) ~ 0, 6 ~ 9999),

      # Confidence in: labour unions
      # pes19_conf_inst2_6
      ces_econ_004 = recode_values(pes19_conf_inst2_6, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: big business
      # pes19_conf_inst2_5
      ces_econ_006 = recode_values(pes19_conf_inst2_5, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: environment
      # cps19_spend_env
      ces_ener_001 = recode_values(cps19_spend_env, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Fed spending: education
      # cps19_spend_educ
      bri_hwps_011 = recode_values(cps19_spend_educ, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: public schools
      # pes19_conf_inst2_4
      ces_hwps_002 = recode_values(pes19_conf_inst2_4, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: immigrants/minorities
      # cps19_spend_imm_min
      ces_idim_019 = recode_values(cps19_spend_imm_min, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: armed forces
      # pes19_conf_inst2_3
      ces_intd_001 = recode_values(pes19_conf_inst2_3, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: defence
      # cps19_spend_defence
      bri_intd_004 = recode_values(cps19_spend_defence, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Do more/less for women
      # pes19_donew
      ces_soim_002 = recode_values(pes19_donew, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # French language threatened in QC
      # pes19_langQC
      ces_idim_003 = recode_values(pes19_langQC, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion access easy/difficult
      # pes19_abort5
      ces_soim_021 = recode_values(pes19_abort5, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Abortion: choice/need/never
      # pes19_abort4
      ces_soim_001 = recode_values(pes19_abort4, 21 ~ 2, 22 ~ 0, 23 ~ 1, 24 ~ 9999),

      # Change electoral system to prop rep
      # cps19_pos_fptp
      # pes19_pos_fptp
      # split ballot, 2 forms
      ces_dpin_016 = coalesce(
        recode_values(cps19_pos_fptp, c(1, 2) ~ 0, 3 ~ 9999, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes19_pos_fptp, c(1, 2) ~ 0, 3 ~ 9999, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Confidence in: courts
      # pes19_conf_inst2_1
      ces_soim_018 = recode_values(pes19_conf_inst2_1, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: crime and justice
      # cps19_spend_just_law
      ces_soim_026 = recode_values(cps19_spend_just_law, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: police
      # pes19_conf_inst2_8
      ces_soim_003 = recode_values(pes19_conf_inst2_8, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cannabis possession a criminal offence
      # cps19_pos_cannabis
      ces_soim_027 = recode_values(cps19_pos_cannabis, c(1, 2) ~ 0, 3 ~ 9999, c(4, 5) ~ 1, 6 ~ 9999),

      # Confidence in: media
      # pes19_conf_inst1_3
      ces_soim_014 = recode_values(pes19_conf_inst1_3, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: Elections Canada
      # pes19_conf_inst2_9
      ces_dpin_011 = recode_values(pes19_conf_inst2_9, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: civil service
      # pes19_conf_inst2_7
      ces_dpin_002 = recode_values(pes19_conf_inst2_7, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: federal govt
      # pes19_conf_inst1_1
      ces_dpin_003 = recode_values(pes19_conf_inst1_1, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Parties keep promises
      # pes19_keepromises
      ces_dpin_005 = recode_values(pes19_keepromises, 1 ~ 2, 2 ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Confidence in: organized religion
      # pes19_conf_inst2_2
      ces_soim_004 = recode_values(pes19_conf_inst2_2, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: provincial govt
      # pes19_conf_inst1_2
      ces_dpin_004 = recode_values(pes19_conf_inst1_2, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Do more/less for Quebec
      # pes19_doneqc
      ces_idim_004 = recode_values(pes19_doneqc, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Favour Quebec separation
      # cps19_quebec_sov
      bri_idim_002 = recode_values(cps19_quebec_sov, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # QC separation: French lang better/worse
      # pes19_qclang
      ces_idim_015 = recode_values(pes19_qclang, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# 2021.dta -- Canadian Election Study, 39 questions
survey(
  survey_id = "2021.dta",
  source    = "Canadian Election Study",
  file_name = "2021 Canadian Election Study v1.0.dta",
  recode = function(d) {
    d %>% transmute(
      # How much to reduce rich-poor gap
      # pes21_gap
      bri_econ_013 = recode_values(pes21_gap, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Decent living vs get ahead on own
      # pes21_stdofliving
      bri_econ_010 = recode_values(pes21_stdofliving, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt should continue carbon tax
      # cps21_pos_carbon
      # pes21_pos_carbon
      # split ballot, 2 forms
      bri_ener_009 = coalesce(
        recode_values(cps21_pos_carbon, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes21_pos_carbon, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Jobs come first over environment
      # cps21_pos_jobs
      # pes21_envirojob
      # split ballot, 2 forms
      bri_ener_010 = coalesce(
        recode_values(cps21_pos_jobs, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes21_envirojob, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Fed govt help energy sector/pipelines
      # cps21_pos_energy
      # pes21_pos_energy
      # split ballot, 2 forms
      bri_ener_011 = coalesce(
        recode_values(cps21_pos_energy, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999),
        recode_values(pes21_pos_energy, c(1, 2) ~ -1, 3 ~ 0, c(4, 5) ~ 1, 6 ~ 9999)
      ),

      # Do more for racial minorities
      # pes21_donerm
      bri_idim_014 = recode_values(pes21_donerm, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Immigration: admit more/fewer
      # cps21_imm
      bri_idim_010 = recode_values(cps21_imm, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Admit more or fewer refugees
      # cps21_refugees
      bri_idim_008 = recode_values(cps21_refugees, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Ties with US closer/more distant
      # pes21_tieus
      bri_intd_005 = recode_values(pes21_tieus, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Abortion legal in all/some/no cases
      # pes21_abort2
      bri_soim_005 = recode_values(pes21_abort2, 1 ~ 0, 2 ~ 1, 3 ~ 2, 4 ~ 9999),

      # Living standard if QC separates
      # pes21_qcsol
      ces_idim_002 = recode_values(pes21_qcsol, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed policies made economy better/worse
      # cps21_econ_fed_bette
      ces_econ_002 = recode_values(cps21_econ_fed_bette, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Income inequality a big problem
      # pes21_inequal
      ces_econ_017 = recode_values(pes21_inequal, c(1, 2) ~ 1, 3 ~ 9999, c(4, 5) ~ 0, 6 ~ 9999),

      # Fed spending: environment
      # cps21_spend_env
      ces_ener_001 = recode_values(cps21_spend_env, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Fed spending: education
      # cps21_spend_educ
      bri_hwps_011 = recode_values(cps21_spend_educ, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: public schools
      # pes21_conf_inst2_4
      ces_hwps_002 = recode_values(pes21_conf_inst2_4, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: immigrants/minorities
      # cps21_spend_imm_min
      ces_idim_019 = recode_values(cps21_spend_imm_min, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: armed forces
      # pes21_conf_inst2_3
      ces_intd_001 = recode_values(pes21_conf_inst2_3, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: defence
      # cps21_spend_defence
      bri_intd_004 = recode_values(cps21_spend_defence, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Do more/less for women
      # pes21_donew
      ces_soim_002 = recode_values(pes21_donew, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # French language threatened in QC
      # pes21_langQC
      ces_idim_003 = recode_values(pes21_langQC, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Change electoral system to prop rep
      # cps21_pos_fptp
      ces_dpin_016 = recode_values(cps21_pos_fptp, c(1, 2) ~ 0, 3 ~ 9999, c(4, 5) ~ 1, 6 ~ 9999),

      # Confidence in: courts
      # pes21_conf_inst2_1
      ces_soim_018 = recode_values(pes21_conf_inst2_1, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: crime and justice
      # cps21_spend_just_law
      ces_soim_026 = recode_values(cps21_spend_just_law, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Confidence in: police
      # pes21_conf_inst2_6
      ces_soim_003 = recode_values(pes21_conf_inst2_6, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cannabis possession a criminal offence
      # cps21_pos_cannabis
      ces_soim_027 = recode_values(cps21_pos_cannabis, c(1, 2) ~ 0, 3 ~ 9999, c(4, 5) ~ 1, 6 ~ 9999),

      # Confidence in: media
      # pes21_conf_inst1_3
      ces_soim_014 = recode_values(pes21_conf_inst1_3, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: Elections Canada
      # pes21_conf_inst1_4
      ces_dpin_011 = recode_values(pes21_conf_inst1_4, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: civil service
      # pes21_conf_inst2_5
      ces_dpin_002 = recode_values(pes21_conf_inst2_5, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: federal govt
      # pes21_conf_inst1_1
      ces_dpin_003 = recode_values(pes21_conf_inst1_1, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Parties keep promises
      # pes21_keepromises
      ces_dpin_005 = recode_values(pes21_keepromises, 1 ~ 2, 2 ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Confidence in: organized religion
      # pes21_conf_inst2_2
      ces_soim_004 = recode_values(pes21_conf_inst2_2, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confidence in: provincial govt
      # pes21_conf_inst1_2
      ces_dpin_004 = recode_values(pes21_conf_inst1_2, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Do more/less for Quebec
      # pes21_doneqc
      ces_idim_004 = recode_values(pes21_doneqc, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Favour Quebec separation
      # cps21_quebec_sov
      bri_idim_002 = recode_values(cps21_quebec_sov, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # QC separation: French lang better/worse
      # pes21_qclang
      ces_idim_015 = recode_values(pes21_qclang, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)
