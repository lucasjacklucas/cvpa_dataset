###############################################################################
# Environics  -  Focus Canada
# 132 survey blocks, oldest first. One block per survey, per wave for panel
# files. Edit a recode_values() arm to change a coding; add a line to add a
# variable.
###############################################################################

# cora-efc1978-E-1978-4_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1978-E-1978-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1978-E-1978-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q10: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know/refused
      env_econ_001 = recode_values(q10, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q11: 0=no response 1=better 2=worse 3=same 9=don't know/refused
      env_econ_002 = recode_values(q11, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Tax gasoline to conserve oil
      # q5j: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_005 = recode_values(q5j, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q9: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know/refused
      env_econ_003 = recode_values(q9, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Allow strip mining for coal
      # q5c: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_001 = recode_values(q5c, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt should develop solar energy
      # q5d: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_002 = recode_values(q5d, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Outlaw disposable plastic pkgs
      # q5h: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_003 = recode_values(q5h, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Relax pollution rules to use coal
      # q5g: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_004 = recode_values(q5g, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1978-E-1978-5_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1978-E-1978-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1978-E-1978-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q28: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q28, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q40: 0=refuse 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q40, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Post Office to crown corp
      # q26: 0=refuse 1=strongly support 2=somewhat support 3=do not support 9=don't know
      env_econ_005 = recode_values(q26, 0 ~ NA_real_, c(1, 2) ~ 1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q27: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q27, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Business system basically sound
      # q13: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_econ_004 = recode_values(q13, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn organized labour sound/unsound
      # q14: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_econ_006 = recode_values(q14, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn judicial system sound/unsound
      # q12: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_soim_001 = recode_values(q12, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1979-E-1979-1_F1.dta -- Environics, 10 questions
survey(
  survey_id = "cora-efc1979-E-1979-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1979-E-1979-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Large cos too big and powerful
      # q5b: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_econ_009 = recode_values(q5b, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Corps responsible for creating jobs
      # q5g: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_econ_011 = recode_values(q5g, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Breadwinner holds a job
      # q9: 0=no response 1=yes 2=no 9=don't know
      env_econ_007 = recode_values(q9, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q12: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q12, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q14: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q14, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q10: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q10, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Right: medical care
      # q1b: 0=no response 1=a right 2=should be earned 9=don't know
      env_hwps_001 = recode_values(q1b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Foreign corps contribute more to econ
      # q5a: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_econ_008 = recode_values(q5a, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Can depend on political leaders
      # q4a: 0=no response 1=very confident 2=somewhat confident 3=not very confident 4=not at all confident 9=don't know
      env_soim_004 = recode_values(q4a, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Quebec independence w/ econ assoc
      # q47: 0=no response 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=don't know
      env_idim_001 = recode_values(q47, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1979-E-1979-2_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1979-E-1979-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1979-E-1979-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q4: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q3: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q13f: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_002 = recode_values(q13f, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # My prov benefits more from Canada
      # q13a: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_005 = recode_values(q13a, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West more in common w US west
      # q13e: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_004 = recode_values(q13e, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West benefits more from Confederation
      # q13c: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_006 = recode_values(q13c, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q13d: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_003 = recode_values(q13d, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1979-E-1979-3_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1979-E-1979-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1979-E-1979-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=refuse 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q15: 0=refuse 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=don't know
      env_ener_006 = recode_values(q15, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Crime rate forecast 6 months
      # q36: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_soim_003 = recode_values(q36, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Afraid to walk at night
      # q37: 0=no response 1=yes 2=no 9=don't know
      env_soim_002 = recode_values(q37, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Favour capital punishment
      # q42: 0=no response 1=in favour of capital punishment for certain crimes 2=against capital punishment 9=don't know
      bri_soim_002 = recode_values(q42, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1979-E-1979-4_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1979-E-1979-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1979-E-1979-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=refuse 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Tax gasoline to conserve oil
      # q6j: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_005 = recode_values(q6j, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Allow strip mining for coal
      # q6c: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_001 = recode_values(q6c, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt should develop solar energy
      # q6d: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_002 = recode_values(q6d, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Outlaw disposable plastic pkgs
      # q6h: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_003 = recode_values(q6h, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Relax pollution rules to use coal
      # q6g: 0=no response 1=should 2=should not 9=don't know/refuse
      env_ener_004 = recode_values(q6g, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1979-E-1979-5_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1979-E-1979-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1979-E-1979-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Business system basically sound
      # q24: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_econ_004 = recode_values(q24, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Confid: business leaders
      # q27: 0=refuse 1=Great confidence 2=Fair confidence 3=Not much confidence 4=No confidence at all 9=Don't know
      env_econ_010 = recode_values(q27, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=refuse 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Post Office to crown corp
      # q21: 0=refuse 1=strongly support 2=somewhat support 3=do not support 9=don't know
      env_econ_005 = recode_values(q21, 0 ~ NA_real_, c(1, 2) ~ 1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=refuse 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Cdn organized labour sound/unsound
      # q25: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_econ_006 = recode_values(q25, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Quebec independence w/ econ assoc
      # q53: 0=refuse 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=don't know
      env_idim_001 = recode_values(q53, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn judicial system sound/unsound
      # q23: 0=no answer 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound,
      env_soim_001 = recode_values(q23, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1980-E-1980-1_F1.dta -- Environics, 11 questions
survey(
  survey_id = "cora-efc1980-E-1980-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1980-E-1980-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 1=Better 2=Worse 3=Same 9=DK/NA
      env_econ_002 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q41: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=dk
      env_ener_006 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Bill 101 restricts English not enough
      # q29: 1=too much 2=just enough 3=not enough 9=dk
      env_idim_007 = recode_values(q29, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Crime rate forecast 6 months
      # q45: 1=will increase 2=will decrease 3=will remain the same 9=dk
      env_soim_003 = recode_values(q45, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # English important: earn living QC
      # q25: 1=more important 2=less important 3=equally important 4=it depends 9=dk
      env_idim_010 = recode_values(q25, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # English important: promotion QC
      # q26: 1=more important 2=less important 3=equally important 4=it depends 9=dk
      env_idim_011 = recode_values(q26, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # French will gain/lose ground QC
      # q23: 1=gain ground 2=lose ground 3=stay the same 9=dk
      env_idim_008 = recode_values(q23, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q28: 1=more widespread 2=less widespread 3=equally widespread 9=dk
      env_idim_009 = recode_values(q28, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Using more/less French at work
      # qd: 1=more French 2=less French 3=the same proportion 9=dk
      env_idim_012 = recode_values(qd, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1980-E-1980-2_F1.dta -- Environics, 3 questions
survey(
  survey_id = "cora-efc1980-E-1980-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1980-E-1980-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know 0 no response
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1980-E-1980-3_F1.dta -- Environics, 15 questions
survey(
  survey_id = "cora-efc1980-E-1980-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1980-E-1980-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Right to strike: plumbers
      # q29n1: 0=no response 1=should have 2=should not have 9=don't know
      env_hwps_002 = recode_values(q29n1, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q9: 0=no response 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=don't know
      env_ener_006 = recode_values(q9, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Cda in war within 10 yrs likely
      # q50: 0=no response 1=very likely 2=somewhat likely 3=somewhat unlikely 4=very unlikely 9=don't know
      env_intd_001 = recode_values(q50, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Compulsory military service
      # q51: 0=no response 1=favour it for all persons of military age (18 to 29) 2=favour it only for men of military age (18 to 29) 3=oppose compuls
      env_intd_002 = recode_values(q51, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, 9 ~ 9999),

      # Liberal govt sensitive to West
      # q61n6: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_013 = recode_values(q61n6, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Marijuana vs alcohol danger
      # q69: 0=no response 1=more dangerous 2=as dangerous 3=less dangerous 9=don't know
      env_soim_005 = recode_values(q69, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9 ~ 9999),

      # Marijuana vs tobacco danger
      # q70: 0=no response 1=more dangerous 2=as dangerous 3=less dangerous 9=don't know
      env_soim_006 = recode_values(q70, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9 ~ 9999),

      # My prov benefits more from Canada
      # q61n1: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_005 = recode_values(q61n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q61n5: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_002 = recode_values(q61n5, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q61n3: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_003 = recode_values(q61n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West more in common w US west
      # q61n4: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_004 = recode_values(q61n4, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West benefits more from Confederation
      # q61n2: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_006 = recode_values(q61n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1980-E-1980-4_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc1980-E-1980-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1980-E-1980-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Corps should invest in poorer areas
      # q11n1: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_econ_012 = recode_values(q11n1, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn corps should invest in Canada
      # q11n3: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      bri_econ_005 = recode_values(q11n3, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Corps should invest for max profit
      # q11n4: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_econ_013 = recode_values(q11n4, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1980-E-1980-5_F1.dta -- Environics, 3 questions
survey(
  survey_id = "cora-efc1980-E-1980-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1980-E-1980-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1981-E-1981-1_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc1981-E-1981-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1981-E-1981-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Breadwinner holds a job
      # q5: 1=yes 2=no 9=don't know
      env_econ_007 = recode_values(q5, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Too much immigration to Canada
      # q50n1: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      bri_idim_007 = recode_values(q50n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Important: good relations w US
      # q63n1: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know
      env_intd_004 = recode_values(q63n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Bill 101 restricts English not enough
      # q58: 1=too much 2=just enough 3=not enough 9=don't know
      env_idim_007 = recode_values(q58, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # English important: earn living QC
      # q54: 1=more important 2=less important 3=equally important 4=it depends 9=don't know
      env_idim_010 = recode_values(q54, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # English important: promotion QC
      # q55: 1=more important 2=less important 3=equally important 4=it depends 9=don't know
      env_idim_011 = recode_values(q55, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # French will gain/lose ground QC
      # q52: 1=gain ground 2=lose ground 3=stay the same 9=don't know
      env_idim_008 = recode_values(q52, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q57: 1=more widespread 2=less widespread 3=equally widespread 9=don't know
      env_idim_009 = recode_values(q57, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Liberal govt sensitive to West
      # q61n6: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_013 = recode_values(q61n6, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # My prov benefits more from Canada
      # q61n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_005 = recode_values(q61n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Using more/less French at work
      # qd: 1=more French 2=less French 3=the same proportion 9=don't know
      env_idim_012 = recode_values(qd, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q61n5: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_002 = recode_values(q61n5, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q61n3: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_003 = recode_values(q61n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West more in common w US west
      # q61n4: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_004 = recode_values(q61n4, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West benefits more from Confederation
      # q61n2: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_006 = recode_values(q61n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1981-E-1981-2_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1981-E-1981-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1981-E-1981-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Lower prices vs enviro protection
      # q65: 1=pay higher prices/protect environment 2=pay lower prices/more pollution 9=don't know
      bri_ener_003 = recode_values(q65, 0 ~ NA_real_, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Breadwinner holds a job
      # q58: 1=yes 2=no 9=don't know
      env_econ_007 = recode_values(q58, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Post Office to crown corp
      # q54: 1=strongly support 2=somewhat support 3=do not support 9=don't know
      env_econ_005 = recode_values(q54, 0 ~ NA_real_, c(1, 2) ~ 1, 3 ~ 0, 9 ~ 9999),

      # Aid to devt countries prevents wars
      # q78n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_intd_007 = recode_values(q78n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cda-US econ relations closer/less
      # q86: 1=closer ties 2=less close 3=about same as now 9=don't know
      env_intd_006 = recode_values(q86, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q79: 1=very favourable 2=somewhat favourable 3=neither favourable nor unfavourable 4=somewhat unfavourable 5=very unfavourable 9=don't know
      env_intd_003 = recode_values(q79, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # US investment in Cda beneficial
      # q87: 1=very beneficial 2=somewhat beneficial 3=somewhat harmful 4=very harmful 9=don't know
      env_econ_015 = recode_values(q87, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # US should lead in world affairs
      # q81: 1=very desirable 2=somewhat desirable 3=not very desirable 4=not at all desirable 9=don't know
      env_intd_005 = recode_values(q81, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1981-E-1981-3_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc1981-E-1981-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1981-E-1981-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Allow strip mining for coal
      # q5n3: 1=should 2=should not 9=don't know
      env_ener_001 = recode_values(q5n3, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt should develop solar energy
      # q5n4: 1=should 2=should not 9=don't know
      env_ener_002 = recode_values(q5n4, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Outlaw disposable plastic pkgs
      # q5n8: 1=should 2=should not 9=don't know
      env_ener_003 = recode_values(q5n8, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Relax pollution rules to use coal
      # q5n7: 1=should 2=should not 9=don't know
      env_ener_004 = recode_values(q5n7, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Afraid to walk at night
      # q10: 1=yes 2=no 9=don't know
      env_soim_002 = recode_values(q10, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Favour capital punishment
      # q12: 1=in favour of capital punishment for certain crimes 2=against capital punishment 9=don't know
      bri_soim_002 = recode_values(q12, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1981-E-1981-4_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1981-E-1981-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1981-E-1981-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q3: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Privatize: Petro-Canada
      # q37: 0=no response 1=Changed into a private company 2=Kept as a crown corporation 9=Don't know
      bri_econ_006 = recode_values(q37, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Keep profitable crown corps public
      # q36: 0=no response 1=Changed into a private company 2=Kept as a crown corporation 9=Don't know
      env_econ_014 = recode_values(q36, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Can depend on political leaders
      # q61n1: 0=no response 1=Very confident 2=Somewhat confident 3=Not very confident 4=Not at all confident 9=Don't know
      env_soim_004 = recode_values(q61n1, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Discrimination serious problem
      # q89: 0=no response 1=very serious 2=somewhat serious 3=not very serious 4=not at all serious 9=don't know
      env_idim_015 = recode_values(q89, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1981-E-1981-5_F1.dta -- Environics, 2 questions
survey(
  survey_id = "cora-efc1981-E-1981-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1981-E-1981-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military service
      # q91: 0=no response 1=favor it for all persons of military age (18 to 29) 2=favor it only for men of military age (18 to 29) 3=oppose compulsor
      env_intd_002 = recode_values(q91, 0 ~ 9999, c(1, 2) ~ 1, 3 ~ 0, 9 ~ 9999),

      # Fed importance: land claims not enough
      # q95: 0=no response 1=too much importance 2=not enough importance 3=just enough importance 9=don't know
      env_idim_014 = recode_values(q95, 0 ~ 9999, 1 ~ -1, 2 ~ 1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1982-E-1982-1_F1.dta -- Environics, 21 questions
survey(
  survey_id = "cora-efc1982-E-1982-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1982-E-1982-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q3: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Not enough financial means for food
      # q5n1: 0=no response 1=more than enough 2=enough 3=not enough 9=don't know
      env_hwps_003 = recode_values(q5n1, 0 ~ 9999, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Accept more pollution for energy
      # q39n2: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_ener_010 = recode_values(q39n2, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q26: 0=no response 1=very favorable 2=somewhat favorable 3=somewhat unfavorable 4=very unfavorable 5=it depends 9=don't know
      env_ener_006 = recode_values(q26, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Likely nuclear plant will blow up
      # q28n1: 0=no response 1=very likely 2=somewhat likely 3=somewhat unlikely 4=very unlikely 9=don't know
      env_ener_011 = recode_values(q28n1, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Neighbourhood pollution trend
      # q36n1: 0=no response 1=Increased 2=Decreased 3=Same 9=Don't know
      env_ener_007 = recode_values(q36n1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Acid rain most serious enviro issue
      # q39n1: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_ener_008 = recode_values(q39n1, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Bill 101 restricts English not enough
      # q87: 0=no response 1=too much 2=just enough 3=not enough 9=don't know
      env_idim_007 = recode_values(q87, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # English important: earn living QC
      # q82: 0=no response 1=more important 2=less important 3=equally important 4=it depends 9=don't know
      env_idim_010 = recode_values(q82, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # English important: promotion QC
      # q83: 0=no response 1=more important 2=less important 3=equally important 4=it depends 9=don't know
      env_idim_011 = recode_values(q83, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # French will gain/lose ground QC
      # q81: 0=no response 1=gain ground 2=lose ground 3=stay the same 9=don't know
      env_idim_008 = recode_values(q81, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q86: 0=no response 1=more widespread 2=less widespread 3=equally widespread 9=don't know
      env_idim_009 = recode_values(q86, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Important: speak both off langs
      # q80: 0=no response 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know
      env_idim_017 = recode_values(q80, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West few benefits, should go alone
      # q92n6: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_idim_016 = recode_values(q92n6, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Using more/less French at work
      # qd: 0=no response 1=more French 2=less French 3=the same proportion 9=don't know
      env_idim_012 = recode_values(qd, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Liberal govt sensitive to West
      # q92n5: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_idim_013 = recode_values(q92n5, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West more in common w US west
      # q92n3: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_idim_004 = recode_values(q92n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q92n4: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_idim_002 = recode_values(q92n4, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q92n2: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_idim_003 = recode_values(q92n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1982-E-1982-2_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1982-E-1982-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1982-E-1982-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Lower prices vs enviro protection
      # q9: 0=no response 1=pay higher prices/protect environment 2=pay lower prices/more pollution 9=don't know
      bri_ener_003 = recode_values(q9, 0 ~ NA_real_, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Corps should invest in poorer areas
      # q10n1: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_econ_012 = recode_values(q10n1, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn corps should invest in Canada
      # q10n3: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      bri_econ_005 = recode_values(q10n3, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Right to strike: plumbers
      # q6n1: 0=no response 1=Should have 2=Should not have 9=Don't know
      env_hwps_002 = recode_values(q6n1, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Cda in war within 10 yrs likely
      # q167: 0=no response 1=very likely 2=somewhat likely 3=somewhat unlikely 4=very unlikely 9=don't know
      env_intd_001 = recode_values(q167, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Afraid to walk at night
      # q14: 0=no response 1=Yes 2=No 9=Don't know
      env_soim_002 = recode_values(q14, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Corps should invest for max profit
      # q10n4: 0=no response 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_econ_013 = recode_values(q10n4, 0 ~ 9999, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Favour capital punishment
      # q18: 0=refuse/no response 1=in favor of capital punishment for certain crimes 2=against capital punishment 9=don't know
      bri_soim_002 = recode_values(q18, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1982-E-1982-3_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1982-E-1982-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1982-E-1982-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Computers cause job losses
      # q19n1: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_econ_018 = recode_values(q19n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Breadwinner holds a job
      # q10: 1=yes 2=no 9=don't know
      env_econ_007 = recode_values(q10, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Business system basically sound
      # q107: 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound, needs fund
      env_econ_004 = recode_values(q107, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn organized labour sound/unsound
      # q108: 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound, needs fund
      env_econ_006 = recode_values(q108, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cda-US econ relations closer/less
      # q101: 1=closer ties 2=less close 3=about same as now 9=don't know
      env_intd_006 = recode_values(q101, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q98: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=indifferent 9=don't know
      env_intd_003 = recode_values(q98, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Favourable opinion of US Pres Reagan
      # q104: 1=very favorable 2=somewhat favorable 3=somewhat unfavorable 4=very unfavorable 5=indifferent 9=don't know
      env_intd_008 = recode_values(q104, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # US investment in Cda beneficial
      # q102: 1=very beneficial 2=somewhat beneficial 3=somewhat harmful 4=very harmful 9=don't know
      env_econ_015 = recode_values(q102, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn judicial system sound/unsound
      # q106: 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound, needs fund
      env_soim_001 = recode_values(q106, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1982-E-1982-4_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1982-E-1982-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1982-E-1982-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q3: 0=no response 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Keep profitable crown corps public
      # q32: 0=no response 1=changed into a private company 2=kept as a crown corporation 9=don't know
      env_econ_014 = recode_values(q32, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 0=no response 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Tap water unfit for drinking
      # q65: 0=no response 1=yes 2=no 9=don't know
      env_ener_009 = recode_values(q65, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Satisfied with fed govt
      # q133: 1=very satisfied 2=somewhat satisfied 3=somewhat dissatisfied 4=very dissatisfied 5=indifferent 9=don't know
      env_dpin_001 = recode_values(q133, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # West few benefits, should go alone
      # q98n3: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_016 = recode_values(q98n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q98n2: 0=no response 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know
      env_idim_002 = recode_values(q98n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1982-E-1982-5_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1982-E-1982-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1982-E-1982-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Worried about Cdn economy
      # q11: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know
      env_econ_016 = recode_values(q11, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Breadwinner holds a job
      # q3: 1=yes 2=no 9=don't know
      env_econ_007 = recode_values(q3, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q9: 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q15: 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q15, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q6: 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Regional jobs next 6 mos more/fewer
      # q8: 1=there will be more jobs available 2=there will be fewer jobs available 3=the employment situation will remain the same as now 9=don't kn
      env_econ_017 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q100: 1=very favourable 2=somewhat favourable 3=neither favourable nor unfavourable 4=somewhat unfavourable 9=don't know
      env_intd_003 = recode_values(q100, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # US should lead in world affairs
      # q102: 1=very desirable 2=somewhat desirable 3=not very desirable 4=not at all desirable 9=don't know
      env_intd_005 = recode_values(q102, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1983-E-1983-1_F1.dta -- Environics, 15 questions
survey(
  survey_id = "cora-efc1983-E-1983-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1983-E-1983-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q3: 1=better 2=worse 3=same 9=don't know
      env_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Not enough financial means for food
      # q5n1: 1=more than enough 2=enough 3=not enough 9=don't know
      env_hwps_003 = recode_values(q5n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q42: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=don't know
      env_ener_006 = recode_values(q42, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Likely nuclear plant will blow up
      # q46n1: 1=Very likely 2=Somewhat likely 3=Somewhat unlikely 4=Very unlikely 9=Don't know
      env_ener_011 = recode_values(q46n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Bill 101 restricts English not enough
      # q62: 1=too much 2=just enough 3=not enough 9=don't know
      env_idim_007 = recode_values(q62, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # English important: earn living QC
      # q60: 1=more useful 2=less useful 3=as useful 4=it depends 9=don't know
      env_idim_010 = recode_values(q60, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # English important: promotion QC
      # q61: 1=more useful 2=less useful 3=as useful 4=it depends 9=don't know
      env_idim_011 = recode_values(q61, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # French Charter effective: signs
      # q63n1: 1=Very effective 2=Somewhat effective 3=Not very effective 4=Not at all effective 9=Don't know
      env_idim_022 = recode_values(q63n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # French will gain/lose ground QC
      # q58: 1=gain ground 2=lose ground 3=stay the same/no change 9=don't know
      env_idim_008 = recode_values(q58, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q59: 1=more wide-spread 2=less wide-spread 3=as wide-spread 9=don't know
      env_idim_009 = recode_values(q59, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Quality of French in QC trend
      # q57: 1=improved 2=deteriorated 3=has not changed 4=it depends 9=don't know
      env_idim_023 = recode_values(q57, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Satisfied QC French improvement
      # q64: 1=very satisfied 2=quite satisfied 3=not very satisfied 4=not at all satisfied 9=don't know
      env_idim_018 = recode_values(q64, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Use of French at work more/less
      # qf: 1=more wide-spread 2=less wide-spread 3=no change 9=don't know
      env_idim_024 = recode_values(qf, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1983-E-1983-2_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc1983-E-1983-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1983-E-1983-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Reject higher prices to protect enviro
      # q89: 1=pay slightly higher prices/protect environment 2=change neither price nor level of pollution 9=don't know/no answer
      env_ener_013 = recode_values(q89, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Worried about Cdn economy
      # q7: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q7, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q5: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Right to strike: plumbers
      # q110n1: 1=should have 2=should not have 9=don't know/no answer
      env_hwps_002 = recode_values(q110n1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q4: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Following acid rain issue
      # q90: 1=very closely 2=somewhat closely 3=not closely 4=not at all 9=don't know/no answer
      env_ener_012 = recode_values(q90, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Neighbourhood pollution trend
      # q87n1: 1=increased 2=decreased 3=same 9=don't know/no answer
      env_ener_007 = recode_values(q87n1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Acid rain most serious enviro issue
      # q91n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=don't know/no answer
      env_ener_008 = recode_values(q91n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Crime rate forecast 6 months
      # q101: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_soim_003 = recode_values(q101, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Discrimination serious problem
      # q109: 1=very serious 2=somewhat serious 3=not very serious 4=not at all serious 9=don't know/no answer
      env_idim_015 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Afraid to walk at night
      # q103: 1=yes 2=no 9=don't know/no answer
      env_soim_002 = recode_values(q103, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Favour capital punishment
      # q105: 1=in favour of capital punishment for certain 2=against capital punishment 9=don't know/no answer
      bri_soim_002 = recode_values(q105, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Cdn cinemas show too few Cdn films
      # q27a: 1=too many 2=enough 3=not enough 9=don't know/no answer
      env_intd_010 = recode_values(q27a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999)
    )
  }
)

# cora-efc1983-E-1983-3_F1.dta -- Environics, 15 questions
survey(
  survey_id = "cora-efc1983-E-1983-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1983-E-1983-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Computers cause job losses
      # q47n1: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=Don't know
      env_econ_018 = recode_values(q47n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Corps should invest in poorer areas
      # q10n1: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=don't know
      env_econ_012 = recode_values(q10n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn corps should invest in Canada
      # q10n3: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=don't know
      bri_econ_005 = recode_values(q10n3, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q7: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q7, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q5: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q12: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q12, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q4: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q100: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=indifferent 9=don't know
      env_intd_003 = recode_values(q100, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Important: good relations w US
      # q99n1: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know
      env_intd_004 = recode_values(q99n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Favourable opinion of US Pres Reagan
      # q101: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=indifferent 9=don't know
      env_intd_008 = recode_values(q101, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Fed importance: land claims not enough
      # q41: 1=too much importance 2=not enough importance 3=just enough importance 9=don't know
      env_idim_014 = recode_values(q41, 1 ~ -1, 2 ~ 1, 3 ~ 0, 9 ~ 9999),

      # Marijuana vs alcohol danger
      # q88: 1=more dangerous 2=as dangerous 3=less dangerous 9=don't know
      env_soim_005 = recode_values(q88, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9 ~ 9999),

      # Marijuana vs tobacco danger
      # q89: 1=more dangerous 2=as dangerous 3=less dangerous 9=don't know
      env_soim_006 = recode_values(q89, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9 ~ 9999),

      # Corps should invest for max profit
      # q10n4: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=don't know
      env_econ_013 = recode_values(q10n4, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Constit recognize native nations
      # q42: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=not at all favourable 9=don't know
      env_idim_019 = recode_values(q42, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1983-E-1983-4_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc1983-E-1983-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1983-E-1983-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favourable to US cruise missile tests
      # q85: 1=very favourable 2=rather favourable 3=rather unfavourable 4=very unfavourable 9=don't know/no answer
      env_intd_009 = recode_values(q85, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q4: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q4, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Food industry profits not enough
      # q29n1: 1=too much 2=just enough 3=not enough 9=DK/NA
      env_econ_019 = recode_values(q29n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Quality of products: food
      # q28n1: 1=very good 2=good 3=bad 4=very bad 9=DK/NA
      env_econ_020 = recode_values(q28n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Right: medical care
      # q55n2: 1=should be guaranteed by government 2=should not be guaranteed 9=DK/NA
      env_hwps_001 = recode_values(q55n2, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt should guarantee legal services
      # q55n1: 1=should be guaranteed by government 2=should not be guaranteed 9=DK/NA
      env_hwps_004 = recode_values(q55n1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Satisfied with fed govt
      # q93: 1=very satisfied 2=somewhat satisfied 3=somewhat dissatisfied 4=very dissatisfied 5=indifferent 9=don't know/no answer
      env_dpin_001 = recode_values(q93, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 6 ~ NA_real_, 9 ~ 9999),

      # Pornography serious problem
      # q74: 1=very serious 2=quite serious 3=not very serious 4=not at all serious 9=don't know/no answer
      env_soim_008 = recode_values(q74, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q88n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_002 = recode_values(q88n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q88n3: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_003 = recode_values(q88n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West few benefits, should go alone
      # q88n2: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_016 = recode_values(q88n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1983-E-1983-5_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1983-E-1983-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1983-E-1983-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favourable to US cruise missile tests
      # q117: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=don't know/no answer
      env_intd_009 = recode_values(q117, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Regional jobs next 6 mos more/fewer
      # q10: 1=there will be more jobs available 2=there will be fewer jobs available 3=that the employment situation will remain the same as now 9=do
      env_econ_017 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Anti-Jewish sentiment trend
      # q105: 0=refuse/no opinion 1=increasing 2=decreasing 3=no change 4=no anti-Jewish sentiment 9=don't know
      env_idim_020 = recode_values(q105, 0 ~ 9999, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Power in Canada: Jewish not enough
      # q104n1: 0=refused 1=too much 2=just enough 3=not enough 9=don't know
      env_idim_021 = recode_values(q104n1, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999)
    )
  }
)

# cora-efc1984-E-1984-1_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc1984-E-1984-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1984-E-1984-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favourable to US cruise missile tests
      # q83: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=DK
      env_intd_009 = recode_values(q83, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q1: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=DK/NA
      env_econ_016 = recode_values(q1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q3: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_001 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q7: 1=Better 2=Worse 3=Same 9=DK/NA
      env_econ_002 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Not enough financial means for food
      # q10n1: 1=More than enough 2=Enough 3=Not enough 9=DK/NA
      env_hwps_003 = recode_values(q10n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_003 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Accept more pollution for energy
      # q44n2: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=DK/NA
      env_ener_010 = recode_values(q44n2, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q49: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=DK
      env_ener_006 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Following acid rain issue
      # q43: 1=very closely 2=somewhat closely 3=not closely 4=not at all 9=DK/NA
      env_ener_012 = recode_values(q43, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Neighbourhood pollution trend
      # q42n1: 1=increased 2=decreased 3=same 9=DK/NA
      env_ener_007 = recode_values(q42n1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Acid rain most serious enviro issue
      # q44n1: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=DK/NA
      env_ener_008 = recode_values(q44n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q75: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable nor unfavourable 9=DK
      env_intd_003 = recode_values(q75, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Favourable opinion of US Pres Reagan
      # q76: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable nor unfavourable 9=DK
      env_intd_008 = recode_values(q76, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # US should lead in world affairs
      # q78: 1=very desirable 2=somewhat desirable 3=not very desirable 4=not at all desirable 9=DK
      env_intd_005 = recode_values(q78, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Against abortion law: mother single
      # q74n1: 0=refused 1=in favour 2=against 9=DK/NA
      env_soim_009 = recode_values(q74n1, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # French will gain/lose ground QC
      # q61: 1=gain ground 2=lose ground 3=stay the same/no change 9=DK/NA
      env_idim_008 = recode_values(q61, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q60: 1=more wide spread 2=less wide spread 3=as wide spread 9=DK/NA
      env_idim_009 = recode_values(q60, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Satisfied QC French improvement
      # q59: 1=very satisfied 2=quite satisfied 3=not very satisfied 4=not at all satisfied 9=DK/NA
      env_idim_018 = recode_values(q59, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Use of French at work more/less
      # qd: 1=more wide spread 2=less wide spread 3=no change 9=DK
      env_idim_024 = recode_values(qd, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1984-E-1984-2_F1.dta -- Environics, 2 questions
survey(
  survey_id = "cora-efc1984-E-1984-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1984-E-1984-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt aid: firms in trouble, save jobs
      # q17n3: 1=support 2=oppose 3=neither 9=DK/NA
      env_econ_023 = recode_values(q17n3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Govt aid: small business
      # q17n1: 1=support 2=oppose 3=neither 9=DK/NA
      env_econ_022 = recode_values(q17n1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1984-E-1984-3_F1.dta -- Environics, 5 questions
survey(
  survey_id = "cora-efc1984-E-1984-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1984-E-1984-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favourable to US cruise missile tests
      # q84: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=DK/NA
      env_intd_009 = recode_values(q84, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Computers cause job losses
      # q23n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK
      env_econ_018 = recode_values(q23n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Importance of cutting fed deficit
      # q5: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=DK/NA
      env_econ_021 = recode_values(q5, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q2: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=DK/NA
      env_econ_016 = recode_values(q2, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Acid rain most serious enviro issue
      # q80: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_ener_008 = recode_values(q80, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1984-E-1984-4_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1984-E-1984-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1984-E-1984-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q3: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_001 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=Better 2=Worse 3=Same 9=DK/NA
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=DK/NA
      env_econ_003 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q78: 1=very favourable 2=somewhat favourable 3=not very favourable 4=not at all favourable 9=DK/NA
      env_intd_011 = recode_values(q78, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Satisfied with fed govt
      # q82: 1=very satisfied 2=somewhat satisfied 3=somewhat dissatisfied 4=very dissatisfied 5=indifferent 9=DK/NA
      env_dpin_001 = recode_values(q82, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # West could survive without Canada
      # q92n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_002 = recode_values(q92n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Require Cdn content on TV/radio
      # q38: 1=for 2=against 9=DK/NA
      env_intd_012 = recode_values(q38, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # West ignored in national politics
      # q92n3: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_003 = recode_values(q92n3, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # West few benefits, should go alone
      # q92n2: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_idim_016 = recode_values(q92n2, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1984-E-1984-5_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1984-E-1984-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1984-E-1984-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Worried about Cdn economy
      # q1: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=DK/NA
      env_econ_016 = recode_values(q1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Regional jobs next 6 mos more/fewer
      # q3: 1=there will be more jobs available 2=there will be fewer jobs available 3=that the employment situation will remain the same as now 9=dk/
      env_econ_017 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Donated to enviro/wildlife org
      # q17: 1=yes 2=not 9=dk/na
      env_ener_014 = recode_values(q17, 1 ~ 1, 2 ~ 0, 3 ~ NA_real_, 9 ~ 9999),

      # Tap water unfit for drinking
      # q19: 1=yes 2=no 9=dk/na
      env_ener_009 = recode_values(q19, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Anti-Jewish sentiment trend
      # q93: 0=refuse/no opinion 1=increasing 2=decreasing 3=no change 4=no anti-Jewish sentiment 9=dk
      env_idim_020 = recode_values(q93, 0 ~ 9999, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Power in Canada: Jewish not enough
      # q92n1: 0=refuse 1=too much 2=just enough 3=not enough 9=dk
      env_idim_021 = recode_values(q92n1, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Pornography serious problem
      # q88: 1=very serious 2=quite serious 3=not very serious 4=not at all serious 9=dk/na
      env_soim_008 = recode_values(q88, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1985-E-1985-1_F1.dta -- Environics, 17 questions
survey(
  survey_id = "cora-efc1985-E-1985-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1985-E-1985-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Favour new nuclear stations
      # q38: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=don't know/no answer
      env_ener_006 = recode_values(q38, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q96: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable or unfavourable 9=don't know/no 
      env_intd_003 = recode_values(q96, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Important: good relations w US
      # q99: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know/no answer
      env_intd_004 = recode_values(q99, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Favourable opinion of US Pres Reagan
      # q97: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable or unfavourable 9=don't know/no 
      env_intd_008 = recode_values(q97, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # US should lead in world affairs
      # q101: 1=very desirable 2=somewhat desirable 3=not very desirable 4=not at all desirable 9=don't know/no answer
      env_intd_005 = recode_values(q101, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed importance: land claims not enough
      # q17: 1=too much importance 2=just enough importance 3=not enough importance 9=don't know/no answer
      env_idim_014 = recode_values(q17, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # French Charter effective: signs
      # q23n1: 1=very effective 2=somewhat effective 3=not very effective 4=not at all effective 9=DK/NA
      env_idim_022 = recode_values(q23n1, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # French will gain/lose ground QC
      # q21: 1=gain ground 2=lose ground 3=stay the same/no change 9=don't know/no answer
      env_idim_008 = recode_values(q21, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # French use in QC more widespread
      # q18: 1=more wide-spread 2=less wide-spread 3=as wide-spread 9=don't know/no answer
      env_idim_009 = recode_values(q18, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Important: speak both off langs
      # q29: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know/no answer
      env_idim_017 = recode_values(q29, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_, 9 ~ 9999),

      # Quality of French in QC trend
      # q19: 1=improved 2=deteriorated 3=not changed 4=it depends 9=don't know/no answer
      env_idim_023 = recode_values(q19, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Constit recognize native nations
      # q15: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 9=don't know/no answer
      env_idim_019 = recode_values(q15, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Do more to promote women's equality
      # q14n1: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=don't know/no answer
      env_soim_012 = recode_values(q14n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Satisfied QC French improvement
      # q20: 1=very satisfied 2=somewhat satisfied 3=not very satisfied 4=not at all satisfied 9=don't know/no answer
      env_idim_018 = recode_values(q20, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1985-E-1985-2_F1.dta -- Environics, 4 questions
survey(
  survey_id = "cora-efc1985-E-1985-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1985-E-1985-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt aid: small business
      # q2n1: 1=support 2=oppose 3=neither 9=DK/NA
      env_econ_022 = recode_values(q2n1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Against abortion law: mother single
      # q140n1: 0=refusal 1=for 2=against 9=don't know
      env_soim_009 = recode_values(q140n1, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Confid: private enterprise
      # q41n1: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence at all 9=DK/NA
      env_econ_025 = recode_values(q41n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed govt spends too little on arts
      # q63n1: 1=too much 2=just enough 3=not enough 9=DK/NA
      env_intd_015 = recode_values(q63n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999)
    )
  }
)

# cora-efc1985-E-1985-3_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc1985-E-1985-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1985-E-1985-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Oil price: market vs regulated
      # q72: 1=regulated 2=determined by the market place 9=don't know/no answer
      bri_ener_004 = recode_values(q72, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Worry about nuclear war
      # q113: 1=very 2=somewhat 3=not very 4=not at all worried 9=don't know/no answer
      bri_intd_003 = recode_values(q113, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Importance of cutting fed deficit
      # q5: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=don't know/no answer
      env_econ_021 = recode_values(q5, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q2: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q2, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Problem important: acid rain
      # q106: 1=very important 2=fairly important 3=not very important 4=not at all important 9=don't know/no answer
      env_ener_019 = recode_values(q106, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Energy crisis serious problem
      # q63: 1=serious 2=slight 3=none at all 9=don't know/no answer
      env_ener_017 = recode_values(q63, 1 ~ 2, 2 ~ 1, 3 ~ 0, 9 ~ 9999),

      # Fed govt effort on acid rain: not enough
      # q109n1: 1=too much 2=just enough 3=not enough 9=DK/NA
      env_ener_018 = recode_values(q109n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Oil cos making excess profits
      # q64n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_ener_020 = recode_values(q64n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Sell more oil abroad
      # q66n1: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_016 = recode_values(q66n1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: enviro protection
      # q9n2: 1=too much 2=just right 3=not enough 9=DK/NA
      env_ener_015 = recode_values(q9n2, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Fed govt handling economy properly
      # q130n1: 1=approve 2=disapprove 9=DK/NA
      bri_econ_002 = recode_values(q130n1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt spending: welfare
      # q9n1: 1=too much 2=just right 3=not enough 9=DK/NA
      bri_hwps_004 = recode_values(q9n1, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Cda-US econ relations closer/less
      # q119: 1=closer relations than we have now 2=less close relations 3=about the same as now 9=don't know/no answer
      env_intd_006 = recode_values(q119, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Nuclear war probable in 10 yrs
      # q114: 1=very 2=somewhat 3=not very 4=not at all probable 9=don't know/no answer
      env_intd_014 = recode_values(q114, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed spending: defence
      # q111: 1=too much 2=too little 3=just enough 9=don't know/no answer
      bri_intd_004 = recode_values(q111, 1 ~ -1, 2 ~ 1, 3 ~ 0, 9 ~ 9999),

      # Foreign ownership: oil and gas
      # q68: 1=too much 2=about right 3=not enough 9=don't know/no answer
      env_econ_024 = recode_values(q68, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Abortion: any woman who wants one
      # q75: 1=agree 2=disagree 8=refuse 9=don't know/no answer
      env_soim_010 = recode_values(q75, 1 ~ 1, 2 ~ 0, c(8, 9) ~ 9999),

      # Appr fed govt: fed-prov relns
      # q130n2: 1=approve 2=disapprove 9=DK/NA
      env_idim_025 = recode_values(q130n2, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Legalize marijuana favour/oppose
      # q58n1: 1=favour strongly 2=favour somewhat 3=oppose somewhat 4=oppose strongly 9=DK/NA/refusal
      env_soim_011 = recode_values(q58n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1985-E-1985-4_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc1985-E-1985-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1985-E-1985-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q5: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Quality of products: food
      # q13n1: 1=very good 2=good 3=bad 4=very bad 9=DK/NA
      env_econ_020 = recode_values(q13n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Important to speak French
      # q49n1: 1=agree completely 2=agree somewhat 3=disagree somewhat 4=disagree completely 9=DK/NA
      env_idim_026 = recode_values(q49n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn identity: the flag
      # q55n1: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=DK/NA
      env_intd_013 = recode_values(q55n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1985-E-1985-5_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc1985-E-1985-5_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1985-E-1985-5_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Reject higher prices to protect enviro
      # q39: 1=pay slightly higher prices/protect environment 2=change neither price nor level of pollution 9=don't know/no answer
      env_ener_013 = recode_values(q39, 0 ~ NA_real_, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Worried about Cdn economy
      # q1: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Regional jobs next 6 mos more/fewer
      # q3: 1=there will be more jobs available 2=there will be fewer jobs available 3=that the employment situation will remain the same as now 9=don
      env_econ_017 = recode_values(q3, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Donated to enviro/wildlife org
      # q40: 1=yes 2=no 9=don't know/no answer
      env_ener_014 = recode_values(q40, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fed govt handling economy properly
      # q68n1: 1=approve 2=disapprove 9=DK/NA
      bri_econ_002 = recode_values(q68n1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Anti-Jewish sentiment trend
      # q47: 1=increasing 2=decreasing 3=no change 4=no anti-Jewish sentiment 8=refuse/no opinion 9=don't know
      env_idim_020 = recode_values(q47, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, c(8, 9) ~ 9999),

      # Appr fed govt: fed-prov relns
      # q68n2: 1=approve 2=disapprove 9=DK/NA
      env_idim_025 = recode_values(q68n2, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Power in Canada: Jewish not enough
      # q46n1: 1=too much 2=just enough 3=not enough 8=refused 9=don't know
      env_idim_021 = recode_values(q46n1, 0 ~ NA_real_, 1 ~ -1, 2 ~ 0, 3 ~ 1, c(8, 9) ~ 9999)
    )
  }
)

# cora-efc1986-E-1986-1_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1986-E-1986-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1986-E-1986-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q9: 1=fair 2=unfair 9=don't know
      bri_econ_008 = recode_values(q9, 0 ~ NA_real_, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Should be free trade with US
      # q103: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=don't know/no answer
      env_econ_026 = recode_values(q103, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Inflation up/down next 6 months
      # q2: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Unemployment next 6 mos up/down
      # q1: 1=will increase 2=will decrease 3=will remain the same 9=don't know/no answer
      env_econ_003 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Guaranteed minimum income program
      # q7: 1=should 2=should not 3=depends 9=don't know/no answer
      env_hwps_006 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Govt guarantee retirement income
      # q89n2: 1=should 2=should not 9=DK/NA
      env_hwps_007 = recode_values(q89n2, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Right: medical care
      # q89n1: 1=should 2=should not 9=DK/NA
      env_hwps_001 = recode_values(q89n1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt ban cigarettes in public places
      # q25n1: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_soim_013 = recode_values(q25n1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1986-E-1986-2_F1.dta -- Environics, 24 questions
survey(
  survey_id = "cora-efc1986-E-1986-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1986-E-1986-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Oil price: market vs regulated
      # q81: 1=regulated 2=determined by the market place 9=don't know/no answer
      bri_ener_004 = recode_values(q81, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Worried about Cdn economy
      # q3: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q3, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Should be free trade with US
      # q97: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=don't know/no answer
      env_econ_026 = recode_values(q97, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed aid to failing industries
      # q93: 1=should 2=should not 3=maybe/it depends 9=don't know/no answer
      env_econ_033 = recode_values(q93, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Problem important: unemployment
      # q2a: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=DK/NA
      env_econ_040 = recode_values(q2a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Problem important: acid rain
      # q2b: 1=very important 2=somewhat important 3=not very important 4=not at all important 9=DK/NA
      env_ener_019 = recode_values(q2b, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Energy crisis serious problem
      # q75: 1=serious 2=slight 3=none at all 9=don't know/no answer
      env_ener_017 = recode_values(q75, 1 ~ 2, 2 ~ 1, 3 ~ 0, 9 ~ 9999),

      # Env damage: offshore oil devt
      # q41a: 1=a great deal 2=some 3=not very much 4=no damage at all 9=DK/NA
      env_ener_026 = recode_values(q41a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed govt effort on acid rain: not enough
      # q38a: 1=too much 2=just enough 3=not enough 9=DK/NA
      env_ener_018 = recode_values(q38a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Oil cos making excess profits
      # q76a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 9=DK/NA
      env_ener_020 = recode_values(q76a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdn pollution increased/decreased
      # q33: 1=increased 2=decreased 3=remained the same 9=don't know/no answer
      env_ener_025 = recode_values(q33, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Sell more/less coal abroad
      # q77e: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_021 = recode_values(q77e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Sell more/less hydro abroad
      # q77c: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_022 = recode_values(q77c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Sell more oil abroad
      # q77a: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_016 = recode_values(q77a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q77d: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_023 = recode_values(q77d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Sell more/less natural gas abroad
      # q77b: 1=more 2=less 3=neither more or less 9=DK/NA
      env_ener_024 = recode_values(q77b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Appr fed govt: health care
      # q92d: 1=approve 2=disapprove 9=DK/NA
      env_hwps_005 = recode_values(q92d, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: defence policy
      # q92f: 1=approve 2=disapprove 9=DK/NA
      env_intd_016 = recode_values(q92f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: foreign policy
      # q92e: 1=approve 2=disapprove 9=DK/NA
      env_intd_018 = recode_values(q92e, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Foreign ownership: oil and gas
      # q78: 1=too much 2=about right 3=not enough 9=don't know/no answer
      env_econ_024 = recode_values(q78, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Appr PM handling job
      # q94: 1=approve 2=disapprove 9=don't know/no answer
      env_dpin_002 = recode_values(q94, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fed govt handling economy properly
      # q92a: 1=approve 2=disapprove 9=DK/NA
      bri_econ_002 = recode_values(q92a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: fed-prov relns
      # q92b: 1=approve 2=disapprove 9=DK/NA
      env_idim_025 = recode_values(q92b, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1986-E-1986-3_F1.dta -- Environics, 16 questions
survey(
  survey_id = "cora-efc1986-E-1986-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1986-E-1986-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour deregulating fin services
      # q25: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose deregulation of financial institutions 9=don't know/no answer
      env_econ_035 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Not enough competition: insurance
      # q27b: 1=Is 2=Is not 9=DK/NA
      env_econ_030 = recode_values(q27b, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Not enough competition: auto industry
      # q27d: 1=Is 2=Is not 9=DK/NA
      env_econ_036 = recode_values(q27d, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Not enough competition: oil and gas
      # q27e: 1=Is 2=Is not 9=DK/NA
      env_econ_031 = recode_values(q27e, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Not enough competition: banks
      # q27a: 1=Is 2=Is not 9=DK/NA
      env_econ_032 = recode_values(q27a, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Not enough competition: trust cos
      # q27c: 1=Is 2=Is not 9=DK/NA
      env_econ_037 = recode_values(q27c, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Should be free trade with US
      # q74: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=don't know/no answer
      env_econ_026 = recode_values(q74, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q2: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Privatize: Petro-Canada
      # q14d: 1=Remain a crown corporation 2=Be sold 9=DK/NA
      bri_econ_006 = recode_values(q14d, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Keep profitable crown corps public
      # q22: 1=be changed into a private company controlled by Canadian sha 2=should it be kept as a crown corporation 9=don't know/no answer
      env_econ_014 = recode_values(q22, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Privatize: Canada Post
      # q14a: 1=Remain a crown corporation 2=Be sold 9=DK/NA
      env_econ_028 = recode_values(q14a, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Privatize: CN Rail
      # q14c: 1=Remain a crown corporation 2=Be sold 9=DK/NA
      env_econ_029 = recode_values(q14c, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Privatize: Air Canada
      # q14b: 1=Remain a crown corporation 2=Be sold 9=DK/NA
      env_econ_038 = recode_values(q14b, 1 ~ 0, 2 ~ 1, 9 ~ 9999),

      # Favour new nuclear stations
      # q123: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 9=don't know/no answer
      env_ener_006 = recode_values(q123, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Confid: governments (4-pt)
      # q12d: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence at all 9=DK/NA
      env_dpin_003 = recode_values(q12d, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Confid: private enterprise
      # q12a: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence at all 9=DK/NA
      env_econ_025 = recode_values(q12a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1986-E-1986-4_F1.dta -- Environics, 20 questions
survey(
  survey_id = "cora-efc1986-E-1986-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1986-E-1986-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q35a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=DK/NA
      env_econ_027 = recode_values(q35a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Business has too much power
      # q35e: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=DK/NA
      env_econ_034 = recode_values(q35e, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Worried about Cdn economy
      # q1: 1=very worried 2=worried 3=not too worried 4=not at all worried 9=don't know/no answer
      env_econ_016 = recode_values(q1, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Personal finances next 6 months
      # q4: 1=better 2=worse 3=same 9=don't know/no answer
      env_econ_002 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Should be free trade with US
      # q77h: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=DK/NA
      env_econ_026 = recode_values(q77h, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Unions too much power
      # q35c: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=DK/NA
      env_econ_039 = recode_values(q35c, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr fed govt: health care
      # q113d: 1=approve 2=disapprove 9=DK/NA
      env_hwps_005 = recode_values(q113d, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: defence policy
      # q113f: 1=approve 2=disapprove 9=DK/NA
      env_intd_016 = recode_values(q113f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: foreign policy
      # q113e: 1=approve 2=disapprove 9=DK/NA
      env_intd_018 = recode_values(q113e, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: promoting world peace
      # q113h: 1=approve 2=disapprove 9=DK/NA
      env_intd_017 = recode_values(q113h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Opinion of US favourable
      # q59: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable nor unfavourable 9=don't know/no
      env_intd_003 = recode_values(q59, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Foreign corps contribute more to econ
      # q77b: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=DK/NA
      env_econ_008 = recode_values(q77b, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Foreign cos less likely protect jobs
      # q77a: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 9=DK/NA
      env_econ_041 = recode_values(q77a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Important: good relations w US
      # q58: 1=very important 2=somewhat important 3=not very important 4=not important at all 9=don't know/no answer
      env_intd_004 = recode_values(q58, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # More/less US investment in Cda
      # q70: 1=need more 2=need less 3=enough now 9=don't know/no answer
      env_intd_019 = recode_values(q70, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # US investment in Cda beneficial
      # q69: 1=very beneficial 2=somewhat beneficial 3=somewhat harmful 4=very harmful 9=don't know/no answer
      env_econ_015 = recode_values(q69, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr PM handling job
      # q126: 1=approve 2=disapprove 9=don't know/no answer
      env_dpin_002 = recode_values(q126, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fed govt handling economy properly
      # q113a: 1=approve 2=disapprove 9=DK/NA
      bri_econ_002 = recode_values(q113a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr fed govt: fed-prov relns
      # q113b: 1=approve 2=disapprove 9=DK/NA
      env_idim_025 = recode_values(q113b, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Govt do more: racial minority fair
      # q35b: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 9=DK/NA
      env_idim_027 = recode_values(q35b, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc1987-E-1987-1_F1.dta -- Environics, 11 questions
survey(
  survey_id = "cora-efc1987-E-1987-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1987-E-1987-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Should be free trade with US
      # q52: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_026 = recode_values(q52, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Inflation up/down next 6 months
      # q5: 1=will increase 2=will decrease 3=will remain the same 4=dk/na
      env_econ_001 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Unemployment next 6 mos up/down
      # q4: 1=will increase 2=will decrease 3=will remain the same 4=dk/na
      env_econ_003 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr PM handling job
      # q151: 1=approve 2=disapprove 3=dk/na
      env_dpin_002 = recode_values(q151, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # French will gain/lose ground QC
      # q89: 1=gain ground 2=lose ground 3=stay the same/no change 4=dk/na
      env_idim_008 = recode_values(q89, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # French use in QC more widespread
      # q88: 1=more wide-spread 2=less wide-spread 3=as wide-spread 4=dk/na
      env_idim_009 = recode_values(q88, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Illegal drug use serious problem
      # q120: 1=very serious problem 2=somewhat serious problem 3=not very serious problem 4=not at all serious problem 5=dk/na
      env_soim_016 = recode_values(q120, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require Cdn content on TV/radio
      # q58: 1=for 2=against 3=dk/na
      env_intd_012 = recode_values(q58, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt spends too little on arts
      # q48a: 1=too much 2=just enough 3=not enough 4=dk/na
      env_intd_015 = recode_values(q48a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Willing undergo drug testing, indiff opt
      # q122: 1=yes 2=no 3=indifferent
      env_soim_017 = recode_values(q122, 1 ~ 1, 2 ~ -1, 3 ~ 0)
    )
  }
)

# cora-efc1987-E-1987-2_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc1987-E-1987-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1987-E-1987-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q53: 1=fair 2=unfair 3=dk/na
      bri_econ_008 = recode_values(q53, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Favourable to US cruise missile tests
      # q107: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=dk/na
      env_intd_009 = recode_values(q107, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: privatization
      # q116b: 1=approve 2=disapprove 3=dk/na
      env_econ_046 = recode_values(q116b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q45: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=dk/na
      env_econ_021 = recode_values(q45, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q94: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_026 = recode_values(q94, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Tax emphasis: purchases vs income
      # q58: 1=personal income 2=consumer purchases 3=depends/other/neither 4=dk/na
      env_econ_048 = recode_values(q58, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: health care
      # q2d: 1=approve 2=disapprove 3=dk/na
      env_hwps_005 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Guaranteed minimum income program
      # q52: 1=should 2=should not 3=depends 4=dk/na
      env_hwps_006 = recode_values(q52, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Allow political refugees immigrate
      # q105b: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=dk/na
      env_idim_029 = recode_values(q105b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=approve 2=disapprove 3=dk/na
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: foreign policy
      # q2e: 1=approve 2=disapprove 3=dk/na
      env_intd_018 = recode_values(q2e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q2h: 1=approve 2=disapprove 3=dk/na
      env_intd_017 = recode_values(q2h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Too much immigration to Canada
      # q105a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=dk/na
      bri_idim_007 = recode_values(q105a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q105c: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=dk/na
      env_idim_028 = recode_values(q105c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr PM handling job
      # q137: 1=approve 2=disapprove 3=dk/na
      env_dpin_002 = recode_values(q137, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt handling economy properly
      # q2a: 1=approve 2=disapprove 3=dk/na
      bri_econ_002 = recode_values(q2a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of homosexuality
      # q112: 1=approve strongly 2=approve somewhat 3=disapprove somewhat 4=disapprove strongly 5=neither approve nor disapprove 6=dk/na
      env_soim_014 = recode_values(q112, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 6 ~ 9999),

      # Bill 101 restricts English not enough
      # q115: 1=too much 2=just enough 3=not enough 4=dk/na
      env_idim_007 = recode_values(q115, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Constitution ban anti-gay discr
      # q111: 1=yes, it should 2=no, it should not 3=it depends 4=dk/na
      env_soim_015 = recode_values(q111, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Discrimination serious problem
      # q109: 1=very serious 2=somewhat serious 3=not very serious 4=not at all serious 5=dk/na
      env_idim_015 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied QC French improvement
      # q114: 1=very satisfied 2=somewhat satisfied 3=not very satisfied 4=not at all satisfied 5=dk/na
      env_idim_018 = recode_values(q114, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour capital punishment
      # q102: 1=In favour of capital punishment for certain crimes 2=against capital punishment 3=dk/na
      bri_soim_002 = recode_values(q102, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1987-E-1987-3_F1.dta -- Environics, 30 questions
survey(
  survey_id = "cora-efc1987-E-1987-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1987-E-1987-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Worry about nuclear war
      # q73: 1=very 2=somewhat 3=not very 4=not at all worried 5=dk/na
      bri_intd_003 = recode_values(q73, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Large cos too big and powerful
      # q16a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_009 = recode_values(q16a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Corps responsible for creating jobs
      # q16b: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_011 = recode_values(q16b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fin dereg: more/fewer choices
      # q24a: 1=more/higher 2=fewer/lower 3=stay same/no difference 4=dk/na
      env_econ_047 = recode_values(q24a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Favour deregulating fin services
      # q22: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose deregulation of financial institutions 5=dk/na
      env_econ_035 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Not enough competition: insurance
      # q15b: 1=is 2=is not 3=dk/na
      env_econ_030 = recode_values(q15b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: auto industry
      # q15d: 1=is 2=is not 3=dk/na
      env_econ_036 = recode_values(q15d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: oil and gas
      # q15e: 1=is 2=is not 3=dk/na
      env_econ_031 = recode_values(q15e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: banks
      # q15a: 1=is 2=is not 3=dk/na
      env_econ_032 = recode_values(q15a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: trust cos
      # q15c: 1=is 2=is not 3=dk/na
      env_econ_037 = recode_values(q15c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Too little regulation of business
      # q19: 1=too much 2=too little 3=about right 4=dk/na
      env_econ_042 = recode_values(q19, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Inflation up/down next 6 months
      # q3: 1=will increase 2=will decrease 3=will remain the same 4=dk/na
      env_econ_001 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q7: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Privatize: Petro-Canada
      # q17d: 1=remain a crown corporation 2=be sold 3=dk/na
      bri_econ_006 = recode_values(q17d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q17f: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_043 = recode_values(q17f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q17g: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_044 = recode_values(q17g, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Keep profitable crown corps public
      # q18: 1=be changed into a private company 2=should it be kept as a crown corporation 3=dk/na
      env_econ_014 = recode_values(q18, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q17a: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_028 = recode_values(q17a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q17c: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_029 = recode_values(q17c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Air Canada
      # q17b: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_038 = recode_values(q17b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q17e: 1=remain a crown corporation 2=be sold 3=dk/na
      env_econ_045 = recode_values(q17e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Should be free trade with US
      # q36: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_026 = recode_values(q36, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q2: 1=will increase 2=will decrease 3=will remain the same 4=dk/na
      env_econ_003 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Nuclear war probable in 10 yrs
      # q74: 1=very 2=somewhat 3=not very 4=not at all probable 5=dk/na
      env_intd_014 = recode_values(q74, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr PM handling job
      # q113: 1=approve 2=disapprove 3=dk/na
      env_dpin_002 = recode_values(q113, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confid: governments (4-pt)
      # q54d: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence at all 5=dk/na
      env_dpin_003 = recode_values(q54d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: private enterprise
      # q54a: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence at all 5=dk/na
      env_econ_025 = recode_values(q54a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Senate reform a priority
      # q131: 1=yes, should be priority 2=no, should not be a priority 3=dk/na
      env_dpin_005 = recode_values(q131, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Senate: elected vs appointed
      # q133: 1=appointed 2=elected directly by the people 3=dk/na
      env_dpin_006 = recode_values(q133, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Senate: pop-based or equal
      # q134: 1=that there be an equal number of Senators from each province 2=that the number of Senators from each province would vary de 3=dk/na
      env_dpin_004 = recode_values(q134, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cora-efc1987-E-1987-4_F1.dta -- Environics, 21 questions
survey(
  survey_id = "cora-efc1987-E-1987-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1987-E-1987-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Personal finances next 6 months
      # q5: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q96: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=dk/na
      env_econ_026 = recode_values(q96, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Problem important: unemployment
      # q1a: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=dk/na
      env_econ_040 = recode_values(q1a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Problem important: acid rain
      # q1d: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=dk/na
      env_ener_019 = recode_values(q1d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Energy crisis serious problem
      # q37: 1=serious 2=slight 3=none at all 4=dk/na
      env_ener_017 = recode_values(q37, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Env damage: Arctic oil explore
      # q59c: 1=a great deal 2=some 3=not very much 4=no damage at all 5=dk/na
      env_ener_028 = recode_values(q59c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Env damage: offshore oil devt
      # q59a: 1=a great deal 2=some 3=not very much 4=no damage at all 5=dk/na
      env_ener_026 = recode_values(q59a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour new nuclear stations
      # q45: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=it depends 6=dk/na
      env_ener_006 = recode_values(q45, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 6 ~ 9999),

      # Fed govt effort on acid rain: not enough
      # q27a: 1=too much 2=just enough 3=not enough 4=dk/na
      env_ener_018 = recode_values(q27a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Only zero pollution acceptable
      # q34: 1=some pollution is reasonable and practical 2=only zero levels are acceptable 3=dk/na
      env_ener_027 = recode_values(q34, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn pollution increased/decreased
      # q20: 1=increased 2=decreased 3=remained the same 4=dk/na
      env_ener_025 = recode_values(q20, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less coal abroad
      # q55e: 1=more 2=less 3=neither more nor less 4=dk/na
      env_ener_021 = recode_values(q55e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q55c: 1=more 2=less 3=neither more nor less 4=dk/na
      env_ener_022 = recode_values(q55c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q55a: 1=more 2=less 3=neither more nor less 4=dk/na
      env_ener_016 = recode_values(q55a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q55d: 1=more 2=less 3=neither more nor less 4=dk/na
      env_ener_023 = recode_values(q55d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q55b: 1=more 2=less 3=neither more nor less 4=dk/na
      env_ener_024 = recode_values(q55b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Tap water quality trend
      # q24: 1=improved 2=stayed about the same 3=gotten worse 4=dk/na
      env_ener_029 = recode_values(q24, 1 ~ 1, 2 ~ 0, 3 ~ -1, 4 ~ 9999),

      # Tap water unfit for drinking
      # q23: 1=yes 2=no 3=don't drink tap water 4=dk
      env_ener_009 = recode_values(q23, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Foreign ownership: oil and gas
      # q48: 1=too much 2=about right 3=not enough 4=dk/na
      env_econ_024 = recode_values(q48, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr PM handling job
      # q119: 1=approve 2=disapprove 3=dk/na
      env_dpin_002 = recode_values(q119, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Economy vs environment priority
      # q22: 1=economic development should have priority 2=environmental concerns should have priority 3=neither/both 4=dk/na
      bri_ener_005 = recode_values(q22, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1988-E-1988-1_F1.dta -- Environics, 16 questions
survey(
  survey_id = "cora-efc1988-E-1988-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1988-E-1988-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q118: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q118, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Inflation up/down next 6 months
      # q5: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q117: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q117, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q4: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_003 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: health care
      # q1d: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_005 = recode_values(q1d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q1f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q1f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: foreign policy
      # q1e: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_018 = recode_values(q1e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q1h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q1h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Opinion of US favourable
      # q82: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=Neither favourable nor unfavourable 6=DK/NA
      env_intd_003 = recode_values(q82, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 6 ~ 9999),

      # Important: good relations w US
      # q81: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_004 = recode_values(q81, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed govt handling economy properly
      # q1a: 1=Approve 2=Disapprove 3=DK/NA
      bri_econ_002 = recode_values(q1a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more: cultural identity fr US
      # q94: 1=More 2=Less 3=Same 4=DK/NA
      env_intd_020 = recode_values(q94, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Employers may require drug tests
      # q71: 1=Should 2=Should not 3=Indifferent 4=Depends 5=DK/NA
      env_soim_019 = recode_values(q71, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 5 ~ 9999),

      # Constit recognize native nations
      # q77: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_idim_019 = recode_values(q77, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Willing undergo drug testing, indiff opt
      # q72: 1=Yes 2=No 3=Indifferent
      env_soim_017 = recode_values(q72, 1 ~ 1, 2 ~ -1, 3 ~ 0)
    )
  }
)

# cora-efc1988-E-1988-2_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc1988-E-1988-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1988-E-1988-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q68: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q68, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q46a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q46a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: privatization
      # q80b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_046 = recode_values(q80b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Econ dev: prov vs fed responsible
      # q41: 1=the federal government 2=the provincial government 3=the private sector 4=Combination/all 5=DK/NA
      env_econ_050 = recode_values(q41, 1 ~ 0, 2 ~ 1, c(3, 4, 5) ~ 9999),

      # Fed aid to failing industries
      # q43: 1=Should 2=Should not 3=Depends 4=DK/NA
      env_econ_033 = recode_values(q43, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q6: 1=better 2=worse 3=same 4=dk/na
      env_econ_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q67: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q67, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Interest in US presidential race
      # q96: 1=very interested 2=somewhat interested 3=not very interested 4=not at all interested in the American presidential race 5=DK/NA
      env_intd_021 = recode_values(q96, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Abortion: any woman who wants one
      # q81a: 1=Agree 2=Disagree 3=Depends 4=DK/NA
      env_soim_010 = recode_values(q81a, 1 ~ 1, c(2, 3) ~ 0, 4 ~ 9999),

      # Appr fed govt: immigration
      # q45e: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_031 = recode_values(q45e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Bill 101 restricts English not enough
      # q77: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      env_idim_007 = recode_values(q77, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Fed-prov relations good/bad
      # q48: 1=very good 2=somewhat good 3=not very good 4=not at all good 5=DK/NA
      env_idim_032 = recode_values(q48, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied QC French improvement
      # q76: 1=Very satisfied 2=Somewhat satisfied 3=Not very satisfied 4=Not at all satisfied 5=DK/NA
      env_idim_018 = recode_values(q76, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Senate reform a priority
      # q62: 1=Should 2=Should not 3=DK/NA
      env_dpin_005 = recode_values(q62, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1988-E-1988-3_F1.dta -- Environics, 37 questions
survey(
  survey_id = "cora-efc1988-E-1988-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1988-E-1988-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q77: 1=Fair 2=Unfair 3=DK/NA
      bri_econ_008 = recode_values(q77, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Favour/oppose Cda-US free trade deal
      # q87: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q87, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Govt guarantee post-sec education
      # q64f: 1=Should 2=Should Not 3=DK/NA
      bri_hwps_007 = recode_values(q64f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q73: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_021 = recode_values(q73, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt do more/less: farmers
      # q66g: 1=More 2=Less 3=Same 4=DK/NA
      env_econ_051 = recode_values(q66g, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Inflation up/down next 6 months
      # q6: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=Better 2=Worse 3=Same 4=Don't know/no answer
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Keep profitable crown corps public
      # q18: 1=be changed into a private company 2=should it be kept as a Crown corporation 3=DK/NA
      env_econ_014 = recode_values(q18, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Should be free trade with US
      # q86: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q86, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Tax emphasis: purchases vs income
      # q81: 1=Personal income 2=Consumer purchases 3=Depends/other/neither 4=DK/NA
      env_econ_048 = recode_values(q81, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Unemployment next 6 mos up/down
      # q5: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_003 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: health care
      # q2d: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_005 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more/less for unemployed
      # q66a: 1=More 2=Less 3=Same 4=DK/NA
      env_econ_052 = recode_values(q66a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more/less for young Cdns
      # q66i: 1=More 2=Less 3=Same 4=DK/NA
      env_hwps_009 = recode_values(q66i, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Guaranteed minimum income program
      # q71: 1=Should 2=Should not 3=Depends 4=DK/NA
      env_hwps_006 = recode_values(q71, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt guarantee: adequate housing
      # q64d: 1=Should 2=Should Not 3=DK/NA
      env_hwps_010 = recode_values(q64d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Adequate income a guaranteed right
      # q64e: 1=Should 2=Should Not 3=DK/NA
      bri_hwps_006 = recode_values(q64e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Right: medical care
      # q64a: 1=Should 2=Should Not 3=DK/NA
      env_hwps_001 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt guarantee retirement income
      # q64b: 1=Should 2=Should Not 3=DK/NA
      env_hwps_007 = recode_values(q64b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Allow political refugees immigrate
      # q92b: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      env_idim_029 = recode_values(q92b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: foreign policy
      # q2e: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_018 = recode_values(q2e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q2h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q2h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more for recent immigrants
      # q66e: 1=More 2=Less 3=Same 4=DK/NA
      env_idim_033 = recode_values(q66e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Too much immigration to Canada
      # q92a: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      bri_idim_007 = recode_values(q92a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q92c: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      env_idim_028 = recode_values(q92c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favourable opinion of US Pres Reagan
      # q108: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=Neither favourable or unfavourable 6=DK/NA
      env_intd_008 = recode_values(q108, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 6 ~ 9999),

      # US should lead in world affairs
      # q110: 1=Very desirable 2=Somewhat desirable 3=Not very desirable 4=Not at all desirable 5=DK/NA
      env_intd_005 = recode_values(q110, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed govt handling economy properly
      # q2a: 1=Approve 2=Disapprove 3=DK/NA
      bri_econ_002 = recode_values(q2a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confid: governments (4-pt)
      # q94d: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_dpin_003 = recode_values(q94d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: country's police forces
      # q94f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_soim_018 = recode_values(q94f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: private enterprise
      # q94a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_econ_025 = recode_values(q94a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: public opinion polls
      # q94i: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_soim_021 = recode_values(q94i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt do more: women
      # q66c: 1=More 2=Less 3=Same 4=DK/NA
      env_soim_020 = recode_values(q66c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more: Native peoples
      # q66f: 1=More 2=Less 3=Same 4=DK/NA
      env_idim_034 = recode_values(q66f, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt should guarantee legal services
      # q64c: 1=Should 2=Should Not 3=DK/NA
      env_hwps_004 = recode_values(q64c, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cdn cinemas show too few Cdn films
      # q101a: 1=Too many 2=Enough 3=Not enough 4=DK/NA
      env_intd_010 = recode_values(q101a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999)
    )
  }
)

# cora-efc1988-E-1988-4_F1.dta -- Environics, 20 questions
survey(
  survey_id = "cora-efc1988-E-1988-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1988-E-1988-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q79: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q79, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Oil price: market vs regulated
      # q70: 1=Regulated 2=Determined by the market place 3=Don't know/no answer
      bri_ener_004 = recode_values(q70, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Canada has distinct culture
      # q80: 1=yes, it does 2=no, it does not 3=DK/NA
      bri_intd_006 = recode_values(q80, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q135a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q135a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Not enough competition: telephones
      # q57a: 1=Is 2=Is not 3=DK/NA
      env_econ_053 = recode_values(q57a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Personal finances next 6 months
      # q5: 1=Better 2=Worse 3=Same 4=Don't know/no answer
      env_econ_002 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q78: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q78, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Concern: nuclear energy cost
      # q77a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=DK/NA
      env_ener_030 = recode_values(q77a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Energy crisis serious problem
      # q64: 1=Serious 2=Slight 3=None at all 4=DK/NA
      env_ener_017 = recode_values(q64, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Env damage: Arctic oil explore
      # q67c: 1=A great deal 2=Some 3=Not very much 4=No damage at all 5=DK/NA
      env_ener_028 = recode_values(q67c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Env damage: offshore oil devt
      # q67a: 1=A great deal 2=Some 3=Not very much 4=No damage at all 5=DK/NA
      env_ener_026 = recode_values(q67a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Sell more/less coal abroad
      # q69e: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_021 = recode_values(q69e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q69c: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_022 = recode_values(q69c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q69a: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_016 = recode_values(q69a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q69d: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_023 = recode_values(q69d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q69b: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_024 = recode_values(q69b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social services
      # q135f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q135f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Foreign ownership: oil and gas
      # q68: 1=Too much 2=About right 3=Not enough 4=DK/NA
      env_econ_024 = recode_values(q68, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr prov govt: econ development
      # q135b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q135b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Require Cdn content on TV/radio
      # q60: 1=For 2=Against 3=DK/NA
      env_intd_012 = recode_values(q60, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1989-E-1989-1_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1989-E-1989-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1989-E-1989-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q121a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q121a, 1 ~ 1, 2 ~ 0, 3 ~ 9999, c(4, 5, 6, 7, 8) ~ NA_real_),

      # Inflation up/down next 6 months
      # q6: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Unemployment next 6 mos up/down
      # q5: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_003 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social services
      # q121f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q121f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q121b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q121b, 1 ~ 1, 2 ~ 0, 3 ~ 9999, c(5, 6, 7) ~ NA_real_),

      # Confidence in: Supreme Court
      # q53a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      bri_soim_008 = recode_values(q53a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Justice system favours Aboriginal
      # q52a: 1=biased in favour 2=biased against 3=treats fairly 4=DK/NA
      env_idim_042 = recode_values(q52a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, c(5, 6, 7, 8) ~ NA_real_),

      # Respect for law incr/decr
      # q54a: 1=increasing 2=decreasing 3=staying the same 4=DK/NA
      env_soim_024 = recode_values(q54a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, 5 ~ NA_real_)
    )
  }
)

# cora-efc1989-E-1989-2_F1.dta -- Environics, 30 questions
survey(
  survey_id = "cora-efc1989-E-1989-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1989-E-1989-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q83: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q83, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Immigrants take jobs from Cdns
      # q98k: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      bri_idim_011 = recode_values(q98k, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q132a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q132a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q81a: 1=do support 2=do not support 3=DK/NA
      env_econ_055 = recode_values(q81a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q81h: 1=do support 2=do not support 3=DK/NA
      env_hwps_011 = recode_values(q81h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Personal finances next 6 months
      # q7: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q82: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q82, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: social services
      # q132f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q132f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q81k: 1=do support 2=do not support 3=DK/NA
      env_hwps_012 = recode_values(q81k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Allow political refugees immigrate
      # q98g: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_029 = recode_values(q98g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Ban non-white immigration
      # q98f: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q98f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q98a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q98a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Allow immigration of investors
      # q98i: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_041 = recode_values(q98i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q98h: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q98h, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda needs more immigration for pop
      # q98e: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_036 = recode_values(q98e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q81b: 1=do support 2=do not support 3=DK/NA
      bri_intd_007 = recode_values(q81b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion: any woman who wants one
      # q87a: 1=agree 2=disagree 3=DK/NA
      env_soim_010 = recode_values(q87a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q132b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q132b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed multiculturalism policy
      # q63: 1=strongly approve 2=somewhat approve 3=somewhat disapprove 4=strongly disapprove 5=DK/NA
      env_idim_037 = recode_values(q63, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Aware fed multicultural policy
      # q62: 1=yes it does 2=no, it does not 3=DK/NA
      env_idim_038 = recode_values(q62, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more: stop discrim women
      # q66a: 1=more 2=less 3=same 4=DK/NA
      env_soim_025 = recode_values(q66a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Legalize marijuana favour/oppose
      # q86a: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA/refusal
      env_soim_011 = recode_values(q86a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Ethnic groups should blend in
      # q65a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_043 = recode_values(q65a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Ethnic groups keep way of life
      # q65b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_044 = recode_values(q65b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Harder for non-whites to succeed
      # q65c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_012 = recode_values(q65c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Multiculturalism -> understanding
      # q64a: 1=will 2=will not 3=DK/NA
      env_idim_045 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Satisfied QC French improvement
      # q88: 1=very satisfied 2=somewhat satisfied 3=not very satisfied 4=not at all satisfied 5=DK/NA
      env_idim_018 = recode_values(q88, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Senate reform a priority
      # q92: 1=yes, should be a priority 2=no, should not be a priority 3=DK/NA
      env_dpin_005 = recode_values(q92, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Senate: elected vs appointed
      # q94: 1=Appointed 2=elected directly by the people 3=DK/NA
      env_dpin_006 = recode_values(q94, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Senate: pop-based or equal
      # q95: 1=that there be an equal number of Senators from each province 2=that the number of Senators from each province would vary 3=DK/NA
      env_dpin_004 = recode_values(q95, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cora-efc1989-E-1989-3_F1.dta -- Environics, 33 questions
survey(
  survey_id = "cora-efc1989-E-1989-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1989-E-1989-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q100: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q100, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Worry about nuclear war
      # q89: 1=very 2=somewhat 3=not very 4=not at all worried 5=DK/NA
      bri_intd_003 = recode_values(q89, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q3l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q3l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q3k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q3k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q130a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q130a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q7: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q10: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q99: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q99, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q6: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed govt effort on acid rain: not enough
      # q62a: 1=too much 2=just enough 3=not enough 4=DK/NA
      env_ener_018 = recode_values(q62a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Only zero pollution acceptable
      # q57: 1=some pollution is reasonable and practical 2=only zero levels are acceptable 3=DK/NA
      env_ener_027 = recode_values(q57, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn pollution increased/decreased
      # q54: 1=increased 2=decreased 3=remained the same 4=DK/NA
      env_ener_025 = recode_values(q54, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Tap water quality trend
      # q61: 1=improved 2=stayed about the same 3=gotten worse 4=DK/NA
      env_ener_029 = recode_values(q61, 1 ~ 1, 2 ~ 0, 3 ~ -1, 4 ~ 9999),

      # Tap water unfit for drinking
      # q60: 1=yes 2=no 3=don't drink tap water 4=DK
      env_ener_009 = recode_values(q60, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Appr fed govt: health care
      # q3d: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_005 = recode_values(q3d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q130f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q130f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q3f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q3f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: foreign policy
      # q3e: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_018 = recode_values(q3e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q3h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q3h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Aid to devt countries prevents wars
      # q97a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_intd_007 = recode_values(q97a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Important: Cda promote world peace
      # q85a: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_intd_023 = recode_values(q85a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Opinion of US favourable
      # q76: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=DK/NA
      env_intd_003 = recode_values(q76, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Important: good relations w US
      # q71a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK
      env_intd_004 = recode_values(q71a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # More/less US investment in Cda
      # q83: 1=need more 2=need less 3=enough now 4=DK/NA
      env_intd_019 = recode_values(q83, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Nuclear war probable in 10 yrs
      # q90: 1=very 2=somewhat 3=not very 4=not at all probable 5=DK/NA
      env_intd_014 = recode_values(q90, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda spending on poor countries
      # q96: 1=too much 2=the right amount 3=not enough 4=DK/NA
      env_intd_022 = recode_values(q96, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # US should lead in world affairs
      # q75: 1=very desirable 2=somewhat desirable 3=not very desirable 4=not at all desirable 5=DK/NA
      env_intd_005 = recode_values(q75, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed govt handling economy properly
      # q3a: 1=Approve 2=Disapprove 3=DK/NA
      bri_econ_002 = recode_values(q3a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: corruption
      # q130i: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_007 = recode_values(q130i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q130b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q130b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more: cultural identity fr US
      # q82: 1=more 2=less 3=same 4=DK/NA
      env_intd_020 = recode_values(q82, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Favour Meech Lake Accord
      # q104: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_idim_040 = recode_values(q104, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Economy vs environment priority
      # q56: 1=economic development should have priority 2=environmental concerns should have priority 3=Neither/both 4=DK/NA
      bri_ener_005 = recode_values(q56, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1989-E-1989-4_F1.dta -- Environics, 26 questions
survey(
  survey_id = "cora-efc1989-E-1989-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1989-E-1989-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q54: 1=Fair 2=Unfair 3=DK/NA
      bri_econ_008 = recode_values(q54, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2d: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q138a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q138a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: privatization
      # q138h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_046 = recode_values(q138h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q59: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q59, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q47a: 1=support 2=do not support 3=DK/NA
      env_econ_055 = recode_values(q47a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q50: 1=Very important 2=Somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_021 = recode_values(q50, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Personal finances next 6 months
      # q9: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Privatize: Petro-Canada
      # q42e: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      bri_econ_006 = recode_values(q42e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q42g: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_043 = recode_values(q42g, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q42h: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_044 = recode_values(q42h, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Via Rail
      # q42c: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_059 = recode_values(q42c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Keep profitable crown corps public
      # q44: 1=be changed into a private company 2=should it be kept as a crown corporation 3=DK/NA
      env_econ_014 = recode_values(q44, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q42a: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_028 = recode_values(q42a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q42d: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_029 = recode_values(q42d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Air Canada
      # q42b: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_038 = recode_values(q42b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q42f: 1=Remain a crown Corp 2=Be sold 3=DK/NA
      env_econ_045 = recode_values(q42f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Tax emphasis: purchases vs income
      # q58: 1=Personal income 2=Consumer purchases 3=Depends/neither/other 4=DK/NA
      env_econ_048 = recode_values(q58, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q138g: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q138g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q138f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q138f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support reducing aid to Third World
      # q47b: 1=support 2=do not support 3=DK/NA
      bri_intd_007 = recode_values(q47b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion: any woman who wants one
      # q106a: 1=Agree 2=Disagree 3=DK/NA
      env_soim_010 = recode_values(q106a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: corruption
      # q138j: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_007 = recode_values(q138j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q138b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q138b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Important to speak French
      # q4a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_idim_026 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Meech Lake Accord
      # q103: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_040 = recode_values(q103, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1990-E-1990-1_F1.dta -- Environics, 33 questions
survey(
  survey_id = "cora-efc1990-E-1990-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1990-E-1990-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q126: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q126, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q5l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q5l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q5k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q5k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q123a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q123a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: privatization
      # q123h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_046 = recode_values(q123h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q127: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q127, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Econ dev: prov vs fed responsible
      # q46: 1=The federal government 2=the provincial government 3=the private sector 4=combination/all 5=DK/NA
      env_econ_050 = recode_values(q46, 1 ~ 0, 2 ~ 1, c(3, 4, 5) ~ 9999),

      # Fed aid to failing industries
      # q47: 1=Should 2=Should not 3=Depends 4=DK/NA
      env_econ_033 = recode_values(q47, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Inflation up/down next 6 months
      # q9: 1=increase 2=decrease 3=remain the same 4=DK/NA
      env_econ_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q12: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q12, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q125: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q125, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q8: 1=increase 2=decrease 3=remain the same 4=DK/NA
      env_econ_003 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q123g: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q123g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Likely we can clean up environment
      # q4a: 1=Very 2=Somewhat 3=Not very 4=Not at all 5=DK/NA
      env_ener_033 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: social services
      # q123f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q123f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Likely Canada will reduce poverty
      # q4e: 1=Very 2=Somewhat 3=Not very 4=Not at all 5=DK/NA
      env_hwps_015 = recode_values(q4e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q5f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q5f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q5h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q5h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: corruption
      # q123j: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_007 = recode_values(q123j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q123b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q123b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Employers may require drug tests
      # q85: 1=should 2=should not 3=indifferent 4=Depends 5=DK/NA
      env_soim_019 = recode_values(q85, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed importance: land claims not enough
      # q66: 1=too much importance 2=just enough importance 3=not enough importance 4=DK/NA
      env_idim_014 = recode_values(q66, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Fed-prov relations good/bad
      # q49: 1=very good 2=somewhat good 3=not very good 4=not at all good 5=DK/NA
      env_idim_032 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Illegal drug use serious problem
      # q84: 1=very serious problem 2=somewhat serious problem 3=not very serious problem 4=not at all serious problem 5=DK/NA
      env_soim_016 = recode_values(q84, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cdn identity: the flag
      # q3a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_013 = recode_values(q3a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely: achieve gender equality
      # q4l: 1=Very 2=Somewhat 3=Not very 4=Not at all 5=DK/NA
      env_soim_029 = recode_values(q4l, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely: keep Canada united
      # q4d: 1=Very 2=Somewhat 3=Not very 4=Not at all 5=DK/NA
      env_idim_052 = recode_values(q4d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely: reduce crime
      # q4c: 1=Very 2=Somewhat 3=Not very 4=Not at all 5=DK/NA
      env_soim_030 = recode_values(q4c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Quebec should be part of Canada
      # q57: 1=Should 2=Should not 3=DK/NA
      env_idim_048 = recode_values(q57, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec independence w/ econ assoc
      # q58: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_idim_001 = recode_values(q58, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Constit recognize native nations
      # q64: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_idim_019 = recode_values(q64, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Meech Lake Accord
      # q73: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_040 = recode_values(q73, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Willing undergo drug testing, indiff opt
      # q86: 1=yes 2=no 3=indifferent
      env_soim_017 = recode_values(q86, 1 ~ 1, 2 ~ -1, 3 ~ 0)
    )
  }
)

# cora-efc1990-E-1990-2_F1.dta -- Environics, 36 questions
survey(
  survey_id = "cora-efc1990-E-1990-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1990-E-1990-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour/oppose Cda-US free trade deal
      # q126: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_econ_009 = recode_values(q126, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q116j: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q116j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q116a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q116a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: privatization
      # q116i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_046 = recode_values(q116i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q122: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_058 = recode_values(q122, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q123: 1=Support 2=Not support 3=DK/NA
      env_econ_055 = recode_values(q123, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fin dereg: more/fewer choices
      # q77a: 1=More/higher etc. 2=Fewer/lower etc. 3=Same/ no diff. 4=DK/NA
      env_econ_047 = recode_values(q77a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Favour deregulating fin services
      # q74: 1=Strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose deregulation of financial institutions 5=DK/NA
      env_econ_035 = recode_values(q74, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Not enough competition: insurance
      # q72b: 1=is 2=is not 3=DK/NA
      env_econ_030 = recode_values(q72b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: auto industry
      # q72d: 1=is 2=is not 3=DK/NA
      env_econ_036 = recode_values(q72d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: oil and gas
      # q72e: 1=is 2=is not 3=DK/NA
      env_econ_031 = recode_values(q72e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: banks
      # q72a: 1=is 2=is not 3=DK/NA
      env_econ_032 = recode_values(q72a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: trust cos
      # q72c: 1=is 2=is not 3=DK/NA
      env_econ_037 = recode_values(q72c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Too little regulation of business
      # q73: 1=too much 2=too little 3=about right 4=DK/NA
      env_econ_042 = recode_values(q73, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q125: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q125, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q116h: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q116h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q116g: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q116g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Allow political refugees immigrate
      # q16d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_029 = recode_values(q16d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q2h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q2h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q16g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q16g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q16a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q16a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Allow immigration of investors
      # q16f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_041 = recode_values(q16f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q16e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q16e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda needs more immigration for pop
      # q16b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_036 = recode_values(q16b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too many racial minority immigrants
      # q16c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_049 = recode_values(q16c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Abortion: any woman who wants one
      # q96: 1=Agree 2=Disagree 3=DK/NA
      env_soim_010 = recode_values(q96, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q116b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q116b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q116f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_047 = recode_values(q116f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban all guns incl hunting rifles
      # q95: 1=Yes, should 2=No, should not 3=DK/NA
      env_soim_026 = recode_values(q95, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Crime a problem in community
      # q90: 1=Very important 2=Somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_soim_022 = recode_values(q90, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Afraid to walk at night
      # q92: 1=Yes 2=No 3=DK/NA
      env_soim_002 = recode_values(q92, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec independence w/ econ assoc
      # q14: 1=Very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=DK/NA
      env_idim_001 = recode_values(q14, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Meech Lake Accord
      # q6: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_040 = recode_values(q6, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1990-E-1990-3_F1.dta -- Environics, 37 questions
survey(
  survey_id = "cora-efc1990-E-1990-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1990-E-1990-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr fed govt: deficit reduction
      # q3l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q3l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q3k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q3k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q112i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q112i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q112a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q112a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q122: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q122, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power: fed vs prov govts
      # q13: 1=More powers for federal government 2=More powers for provincial governments 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q13, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Goal next decade: Cdn firms competitive
      # q14b: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_063 = recode_values(q14b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal next decade: prosperity all regions
      # q14g: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_064 = recode_values(q14g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Importance of cutting fed deficit
      # q14f: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_021 = recode_values(q14f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Inflation up/down next 6 months
      # q7: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Personal finances next 6 months
      # q10: 1=Better 2=Worse 3=Same 4=DK/NA
      env_econ_002 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q120: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q120, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q6: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q112h: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q112h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Goal: clean up environment
      # q14a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_ener_032 = recode_values(q14a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reducing poverty
      # q14e: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_hwps_013 = recode_values(q14e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Oil cos making excess profits
      # q78a: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      env_ener_020 = recode_values(q78a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Sell more/less coal abroad
      # q73e: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_021 = recode_values(q73e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q73c: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_022 = recode_values(q73c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q73a: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_016 = recode_values(q73a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q73d: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_023 = recode_values(q73d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q73b: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_024 = recode_values(q73b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social services
      # q112g: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q112g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Goal: maintain natl health care sys
      # q14h: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_hwps_014 = recode_values(q14h, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Schools stress moral devt
      # q63a: 1=Very important 2=Somewhat important 3=Not important 4=DK/NA
      env_hwps_016 = recode_values(q63a, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q3f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q3f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q3h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q3h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q112b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q112b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q112f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_047 = recode_values(q112f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of homosexuality
      # q86: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_soim_014 = recode_values(q86, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Constitution ban anti-gay discr
      # q85: 1=Yes, should 2=No, should not 3=It depends 4=DK/NA
      env_soim_015 = recode_values(q85, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Goal: keep Cda independent of US
      # q14c: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_024 = recode_values(q14c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: equality men and women
      # q14i: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_027 = recode_values(q14i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: keep Canada together
      # q14d: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_idim_050 = recode_values(q14d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reduce crime rate
      # q14j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_028 = recode_values(q14j, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Meech Lake Accord
      # q113: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_040 = recode_values(q113, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour capital punishment
      # q124: 1=In favour for certain crimes 2=Opposed under any circumstance 3=DK/NA
      bri_soim_002 = recode_values(q124, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1990-E-1990-4_F1.dta -- Environics, 35 questions
survey(
  survey_id = "cora-efc1990-E-1990-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1990-E-1990-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q14: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_027 = recode_values(q14, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Income tax system unfair
      # q27: 1=fair 2=unfair 3=DK/NA
      bri_econ_008 = recode_values(q27, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Agree free trade Can-US-Mexico
      # q118: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q118, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q109i: 1=Approve 2=Disapprove 3=DK/Na
      env_econ_060 = recode_values(q109i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q109a: 1=Approve 2=Disapprove 3=DK/Na
      env_idim_030 = recode_values(q109a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q31: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q31, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Financially better off than parents
      # q9: 1=Better off 2=Worse off 3=About the same 4=DK/NA
      env_econ_062 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cut Via Rail subsidies
      # q18a: 1=do support 2=do not support 3=DK/NA
      env_econ_055 = recode_values(q18a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q20: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_021 = recode_values(q20, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt do more/less: farmers
      # q15f: 1=more 2=less 3=same 4=DK/NA
      env_econ_051 = recode_values(q15f, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q116: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q116, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q109h: 1=Approve 2=Disapprove 3=DK/Na
      env_ener_031 = recode_values(q109h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q109g: 1=Approve 2=Disapprove 3=DK/Na
      env_hwps_008 = recode_values(q109g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more/less for young Cdns
      # q15a: 1=more 2=less 3=same 4=DK/NA
      env_hwps_009 = recode_values(q15a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q2h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q2h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more for recent immigrants
      # q15c: 1=more 2=less 3=same 4=DK/NA
      env_idim_033 = recode_values(q15c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Support reducing aid to Third World
      # q18b: 1=do support 2=do not support 3=DK/NA
      bri_intd_007 = recode_values(q18b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt handling economy properly
      # q2a: 1=Approve 2=Disapprove 3=DK/NA
      bri_econ_002 = recode_values(q2a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q109j: 1=Approve 2=Disapprove 3=DK/Na
      env_idim_046 = recode_values(q109j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q109b: 1=Approve 2=Disapprove 3=DK/Na
      env_econ_049 = recode_values(q109b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q109f: 1=Approve 2=Disapprove 3=DK/Na
      env_idim_047 = recode_values(q109f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confid: governments (4-pt)
      # q91d: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=None 5=DK/NA
      env_dpin_003 = recode_values(q91d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: country's police forces
      # q91f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=None 5=DK/NA
      env_soim_018 = recode_values(q91f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: public opinion polls
      # q91i: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=None 5=DK/NA
      env_soim_021 = recode_values(q91i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed importance: land claims not enough
      # q74: 1=too much importance 2=just enough importance 3=not enough importance 4=DK/NA
      env_idim_014 = recode_values(q74, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Govt do more: women
      # q15b: 1=more 2=less 3=same 4=DK/NA
      env_soim_020 = recode_values(q15b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more: Native peoples
      # q15e: 1=more 2=less 3=same 4=DK/NA
      env_idim_034 = recode_values(q15e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Native peoples self-government
      # q85: 1=yes, should 2=no, should not 3=DK/NA
      env_idim_051 = recode_values(q85, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Aboriginal: govt policy vs own fault
      # q81: 1=natives caused own problems 2=problems caused by attitudes/policies 3=neither/other 4=DK/NA
      env_idim_053 = recode_values(q81, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Native own justice system good/bad
      # q84: 1=a good development 2=a bad development 3=DK/NA
      env_idim_039 = recode_values(q84, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec independence w/ econ assoc
      # q115: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_idim_001 = recode_values(q115, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Constit recognize native nations
      # q72: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=DK/NA
      env_idim_019 = recode_values(q72, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1991-E-1991-1_F1.dta -- Environics, 22 questions
survey(
  survey_id = "cora-efc1991-E-1991-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1991-E-1991-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q82: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q82, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Canada has distinct culture
      # q38: 1=yes, it does 2=no, it does not 3=DK/NA
      bri_intd_006 = recode_values(q38, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q72i: 1=approve 2=disapprove 3=DK/NA
      env_econ_060 = recode_values(q72i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q72a: 1=approve 2=disapprove 3=DK/NA
      env_idim_030 = recode_values(q72a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q84: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q84, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q6: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q80: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q80, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q5: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_003 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q72h: 1=approve 2=disapprove 3=DK/NA
      env_ener_031 = recode_values(q72h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q72g: 1=approve 2=disapprove 3=DK/NA
      env_hwps_008 = recode_values(q72g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: promoting world peace
      # q2h: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_017 = recode_values(q2h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Opinion of US favourable
      # q54: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=neither favourable nor unfavourable 6=DK/NA
      env_intd_003 = recode_values(q54, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 6 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q72j: 1=approve 2=disapprove 3=DK/NA
      env_idim_046 = recode_values(q72j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q72b: 1=approve 2=disapprove 3=DK/NA
      env_econ_049 = recode_values(q72b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q72f: 1=approve 2=disapprove 3=DK/NA
      env_idim_047 = recode_values(q72f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more: cultural identity fr US
      # q39: 1=More 2=Less 3=Same 4=DK/NA
      env_intd_020 = recode_values(q39, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Quebec independence w/ econ assoc
      # q79: 1=very favourable 2=somewhat favourable 3=somewhat unfavourable 4=very unfavourable 5=DK/NA
      env_idim_001 = recode_values(q79, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require Cdn content on TV/radio
      # q53: 1=For 2=Against 3=DK/NA
      env_intd_012 = recode_values(q53, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1991-E-1991-2_F1.dta -- Environics, 28 questions
survey(
  survey_id = "cora-efc1991-E-1991-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1991-E-1991-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q109: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q97i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q97i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q97a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q97a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power: fed vs prov govts
      # q100: 1=More powers for federal government 2=More powers for provincial governments 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q100, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q107: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q107, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q97h: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q97h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q97g: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q97g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Concern: maintain health care quality
      # q45a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=DK/NA
      env_hwps_018 = recode_values(q45a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: limit patients per doctor
      # q71a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_017 = recode_values(q71a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: raise employer contrib
      # q70a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_020 = recode_values(q70a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: shift to lower-cost facilities
      # q72a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_019 = recode_values(q72a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require less fat/salt in food
      # q73a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_022 = recode_values(q73a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: health care
      # q67: 1=More 2=Less 3=Same as now 4=DK/NA
      bri_hwps_009 = recode_values(q67, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q40g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q40g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q40a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q40a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Allow immigration of investors
      # q40f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_041 = recode_values(q40f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q40e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q40e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda needs more immigration for pop
      # q40b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_036 = recode_values(q40b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too many racial minority immigrants
      # q40c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_049 = recode_values(q40c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q97j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q97j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q97b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q97b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q97f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_047 = recode_values(q97f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban all guns incl hunting rifles
      # q38: 1=Yes, should be banned 2=No, should not be banned 3=DK/NA
      env_soim_026 = recode_values(q38, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec should be part of Canada
      # q99: 1=Should be part Canada 2=Should not be part of Canada 3=DK/NA
      env_idim_048 = recode_values(q99, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1991-E-1991-3_F1.dta -- Environics, 34 questions
survey(
  survey_id = "cora-efc1991-E-1991-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1991-E-1991-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q140: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q140, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Willing: restrict urban car use
      # q111a: 1=Very willing 2=Somewhat willing 3=Not very willing 4=Not at all willing 5=DK/NA
      bri_ener_007 = recode_values(q111a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Quebec separation
      # q143: 1=Strongly favour 2=somewhat favour 3=Somewhat oppose 4=strongly oppose
      bri_idim_002 = recode_values(q143, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q9k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q9k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q9j: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q9j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q136i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q136i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q136a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q136a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q13: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q13, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Rich provs give too little
      # q81: 1=too much 2=too little 3=About right 4=Depends 5=DK/NA
      env_hwps_021 = recode_values(q81, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Should be free trade with US
      # q138: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q138, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unemployment next 6 mos up/down
      # q12: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_003 = recode_values(q12, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q136h: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q136h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Env damage: Arctic oil explore
      # q65c: 1=A great deal 2=Some 3=Not very much 4=No damage at all 5=DK/NA
      env_ener_028 = recode_values(q65c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Env damage: offshore oil devt
      # q65a: 1=A great deal 2=Some 3=Not very much 4=No damage at all 5=DK/NA
      env_ener_026 = recode_values(q65a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Only zero pollution acceptable
      # q106: 1=some pollution is reasonable and practical 2=only zero levels are acceptable 3=DK/NA
      env_ener_027 = recode_values(q106, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn pollution increased/decreased
      # q103: 1=increased 2=decreased 3=Remained the same 4=DK/NA
      env_ener_025 = recode_values(q103, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less coal abroad
      # q57e: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_021 = recode_values(q57e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q57c: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_022 = recode_values(q57c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q57a: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_016 = recode_values(q57a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q57d: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_023 = recode_values(q57d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q57b: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_024 = recode_values(q57b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social services
      # q136g: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q136g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q9f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q9f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Foreign ownership: oil and gas
      # q61: 1=Too much 2=About right 3=not enough 4=DK/NA
      env_econ_024 = recode_values(q61, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q9l: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q9l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q136j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q136j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q136b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q136b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: language policy
      # q136f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_047 = recode_values(q136f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Bill 101 restricts English not enough
      # q151: 1=too much 2=Just enough 3=Not enough 4=DK/NA
      env_idim_007 = recode_values(q151, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Cdn identity: the flag
      # q7a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_013 = recode_values(q7a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr Preston Manning as Reform ldr
      # q125: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_010 = recode_values(q125, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec independence w/ econ assoc
      # q144: 1=Strongly favour 2=somewhat favour 3=Somewhat oppose 4=strongly oppose
      env_idim_001 = recode_values(q144, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied QC French improvement
      # q150: 1=Very satisfied 2=Somewhat satisfied 3=Somewhat dissatisfied 4=Very dissatisfied 5=DK/NA
      env_idim_018 = recode_values(q150, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Economy vs environment priority
      # q105: 1=Economic development should have priority 2=Environmental concerns should have priority 3=Neither/both 4=DK/NA
      bri_ener_005 = recode_values(q105, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1991-E-1991-4_F1.dta -- Environics, 43 questions
survey(
  survey_id = "cora-efc1991-E-1991-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1991-E-1991-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q69a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_027 = recode_values(q69a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Income tax system unfair
      # q43a: 1=Fair 2=Unfair 3=Don't know/no answer
      bri_econ_008 = recode_values(q43a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Agree free trade Can-US-Mexico
      # q123: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Don't know/no answer
      env_econ_061 = recode_values(q123, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt guarantee post-sec education
      # q32f: 1=Should 2=Should Not 3=DK/NA
      bri_hwps_007 = recode_values(q32f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favour Quebec separation
      # q126: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q126, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: taxation
      # q2j: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_057 = recode_values(q2j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q111i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q111i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q111a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q111a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q45: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_058 = recode_values(q45, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Business has too much power
      # q69e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_034 = recode_values(q69e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cut Via Rail subsidies
      # q35a: 1=do support 2=do not support 3=DK/NA
      env_econ_055 = recode_values(q35a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q37: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=don't know/no answer
      env_econ_021 = recode_values(q37, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt waste important in spending
      # q42: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q42, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cut services to hold taxes vs maintain
      # q41: 1=maintaining the current level of government services, which 2=or cutting government services to keep taxes at their curren 3=DK/NA
      env_econ_066 = recode_values(q41, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q30e: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_043 = recode_values(q30e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q30f: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_044 = recode_values(q30f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Via Rail
      # q30b: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_059 = recode_values(q30b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q30a: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_028 = recode_values(q30a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q30c: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_029 = recode_values(q30c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q30d: 1=Remain a Crown Corp. 2=Be Sold 3=DK/NA
      env_econ_045 = recode_values(q30d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Should be free trade with US
      # q121: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Don't know/no answer
      env_econ_026 = recode_values(q121, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unions too much power
      # q69c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_039 = recode_values(q69c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Wages keeping pace w cost of living
      # q129: 1=yes, have 2=no, have not 3=DK/NA
      env_econ_067 = recode_values(q129, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: forests
      # q111h: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q111h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social services
      # q111g: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_008 = recode_values(q111g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt guarantee: adequate housing
      # q32d: 1=Should 2=Should Not 3=DK/NA
      env_hwps_010 = recode_values(q32d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Adequate income a guaranteed right
      # q32e: 1=Should 2=Should Not 3=DK/NA
      bri_hwps_006 = recode_values(q32e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Right: medical care
      # q32a: 1=Should 2=Should Not 3=DK/NA
      env_hwps_001 = recode_values(q32a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt guarantee retirement income
      # q32b: 1=Should 2=Should Not 3=DK/NA
      env_hwps_007 = recode_values(q32b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support reducing aid to Third World
      # q35b: 1=do support 2=do not support 3=DK/NA
      bri_intd_007 = recode_values(q35b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion: any woman who wants one
      # q77: 1=agree 2=disagree 3=Don't know/no answer
      env_soim_010 = recode_values(q77, 1 ~ 1, c(2, 3) ~ 0),

      # Appr fed govt: Indigenous issues
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q111j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q111j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q111k: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q111k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q111b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q111b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed multiculturalism policy
      # q6: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_idim_037 = recode_values(q6, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Aware fed multicultural policy
      # q5: 1=Yes, it does 2=No, it does not 3=Don't know/no answer
      env_idim_038 = recode_values(q5, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more: racial minority fair
      # q69b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_027 = recode_values(q69b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Quebec independence w/ econ assoc
      # q127: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_001 = recode_values(q127, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt should guarantee legal services
      # q32c: 1=Should 2=Should Not 3=DK/NA
      env_hwps_004 = recode_values(q32c, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1992-E-1992-1_F1.dta -- Environics, 30 questions
survey(
  survey_id = "cora-efc1992-E-1992-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1992-E-1992-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q98: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q98, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Quebec separation
      # q100: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q100, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Parties: half of candidates women
      # q127n: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      bri_soim_009 = recode_values(q127n, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: deficit reduction
      # q2k: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_056 = recode_values(q2k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q95a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q95a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Canada-US common currency
      # q68: 1=very good 2=somewhat good 3=not very good 4=not at all good 5=DK/NA
      env_intd_025 = recode_values(q68, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Inflation up/down next 6 months
      # q7: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q96: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q96, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q95f: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q95f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Both parents work good/bad for family
      # q128: 1=beneficial 2=harmful 3=neither 4=DK/NA
      env_soim_031 = recode_values(q128, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q95g: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q95g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q95h: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q95h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q95b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q95b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of euthanasia
      # q136: 1=yes 2=no 3=depends 4=DK/NA
      env_soim_032 = recode_values(q136, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Consider self feminist
      # q126: 1=yes 2=no 3=DK/NA
      env_soim_033 = recode_values(q126, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed importance: land claims not enough
      # q63: 1=too much importance 2=just enough importance 3=not enough importance 4=DK/NA
      env_idim_014 = recode_values(q63, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Women's problem: income inequality
      # q124a: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_hwps_027 = recode_values(q124a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Native peoples self-government
      # q64a: 1=yes, should 2=no, should not 3=DK/NA
      env_idim_051 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Justice system favours Aboriginal
      # q11a: 1=biased in favour 2=biased against 3=treats fairly 4=DK/NA
      env_idim_042 = recode_values(q11a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Afraid to walk at night
      # q66: 1=yes 2=no 3=DK/NA
      env_soim_002 = recode_values(q66, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Quebec independence w/ econ assoc
      # q101: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_idim_001 = recode_values(q101, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Do more to promote women's equality
      # q127a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_soim_012 = recode_values(q127a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require promote women to higher jobs
      # q134a: 1=strongly approve 2=somewhat approve 3=somewhat disapprove 4=strongly disapprove 5=DK/NA
      env_soim_035 = recode_values(q134a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # How much women earn vs men
      # q135b: 1=less than half of what men earn 2=about half of what men earn 3=about two-thirds of what men earn 4=slightly less than what men earn 
      env_hwps_028 = recode_values(q135b, 1 ~ -1, c(2, 3) ~ 9999, 4 ~ -1, 5 ~ 1, c(6, 7) ~ 9999),

      # Women's movement reflects women's views
      # q125: 1=yes, does 2=no, does not 3=DK/NA
      env_soim_034 = recode_values(q125, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Women paid more than men at workplace
      # q140: 1=more 2=less 3=the same 4=DK/NA
      env_hwps_029 = recode_values(q140, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Women more promotion oppty at workplace
      # q139: 1=more 2=fewer 3=the same 4=DK/NA
      env_hwps_030 = recode_values(q139, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1992-E-1992-2_F1.dta -- Environics, 39 questions
survey(
  survey_id = "cora-efc1992-E-1992-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1992-E-1992-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q124: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q124, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Quebec separation
      # q126: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q126, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q121i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q121i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q121a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q121a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Corps should invest in poorer areas
      # q77a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_econ_012 = recode_values(q77a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Econ dev: prov vs fed responsible
      # q84: 1=the federal government 2=the provincial government 3=the private sector 4=combination/all 5=DK/NA
      env_econ_050 = recode_values(q84, 1 ~ 0, 2 ~ 1, c(3, 4, 5) ~ 9999),

      # Goal next decade: Cdn firms competitive
      # q68b: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_063 = recode_values(q68b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal next decade: prosperity all regions
      # q68g: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_064 = recode_values(q68g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Importance of cutting fed deficit
      # q68f: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_021 = recode_values(q68f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt aid: firms in trouble, save jobs
      # q76c: 1=support 2=oppose 3=neither 4=DK/NA
      env_econ_023 = recode_values(q76c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt aid: small business
      # q76a: 1=support 2=oppose 3=neither 4=DK/NA
      env_econ_022 = recode_values(q76a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed aid to failing industries
      # q85: 1=should 2=should not 3=depends 4=DK/NA
      env_econ_033 = recode_values(q85, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q122: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q122, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Business system basically sound
      # q70: 1=basically sound 2=basically sound but needs some improvements 3=not too sound, needs many improvements 4=basically unsound, needs funda
      env_econ_004 = recode_values(q70, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q121f: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q121f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Goal: clean up environment
      # q68a: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_ener_032 = recode_values(q68a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reducing poverty
      # q68e: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_hwps_013 = recode_values(q68e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: maintain natl health care sys
      # q68h: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_hwps_014 = recode_values(q68h, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Allow political refugees immigrate
      # q99d: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_029 = recode_values(q99d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q99g: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q99g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Foreign corps contribute more to econ
      # q77e: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_econ_008 = recode_values(q77e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Foreign cos less likely protect jobs
      # q77c: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_econ_041 = recode_values(q77c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: keep Cda independent of US
      # q68c: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_intd_024 = recode_values(q68c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q99a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q99a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Allow immigration of investors
      # q99f: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_041 = recode_values(q99f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q99e: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q99e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda needs more immigration for pop
      # q99b: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_036 = recode_values(q99b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too many racial minority immigrants
      # q99c: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_idim_049 = recode_values(q99c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q121g: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q121g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q121h: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q121h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q121b: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_049 = recode_values(q121b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Goal: equality men and women
      # q68i: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_soim_027 = recode_values(q68i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: keep Canada together
      # q68d: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_idim_050 = recode_values(q68d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reduce crime rate
      # q68j: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_soim_028 = recode_values(q68j, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Senate: elected vs appointed
      # q132: 1=appointed 2=elected directly by the people 3=DK/NA
      env_dpin_006 = recode_values(q132, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Senate: pop-based or equal
      # q133: 1=that there be an equal number of Senators from each province 2=that the number of Senators from each province would vary de 3=DK/NA
      env_dpin_004 = recode_values(q133, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cora-efc1992-E-1992-3_F1.dta -- Environics, 32 questions
survey(
  survey_id = "cora-efc1992-E-1992-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1992-E-1992-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Agree free trade Can-US-Mexico
      # q97: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q97, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Quebec separation
      # q99: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q99, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q93i: 1=approve 2=disapprove 3=DK/NA
      env_econ_060 = recode_values(q93i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q93a: 1=approve 2=disapprove 3=DK/NA
      env_idim_030 = recode_values(q93a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q8: 1=will increase 2=will decrease 3=will remain the same 4=DK/NA
      env_econ_001 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Should be free trade with US
      # q95: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q95, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q93f: 1=approve 2=disapprove 3=DK/NA
      env_ener_031 = recode_values(q93f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Likely we can clean up environment
      # q2a: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_ener_033 = recode_values(q2a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Concern: maintain health care quality
      # q37a: 1=very concerned 2=somewhat concerned 3=not very concerned 4=not at all concerned 5=DK/NA
      env_hwps_018 = recode_values(q37a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt ban cigarettes in public places
      # q115a: 1=agree strongly 2=agree somewhat 3=disagree somewhat 4=disagree strongly 5=DK/NA
      env_soim_013 = recode_values(q115a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govts more resp for individual health
      # q13a: 1=more 2=less 3=same 4=DK/NA
      env_hwps_026 = recode_values(q13a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Health costs: limit patients per doctor
      # q61a: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_017 = recode_values(q61a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: raise employer contrib
      # q60a: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_020 = recode_values(q60a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: rationalize hospitals
      # q63d: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_023 = recode_values(q63d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: tax on excess service use
      # q61c: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_024 = recode_values(q61c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely Canada will reduce poverty
      # q2e: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_hwps_015 = recode_values(q2e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: shift to lower-cost facilities
      # q63a: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_019 = recode_values(q63a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require less fat/salt in food
      # q64a: 1=strongly support 2=somewhat support 3=somewhat oppose 4=strongly oppose 5=DK/NA
      env_hwps_022 = recode_values(q64a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied w prov health care quality
      # q38: 1=very satisfied 2=somewhat satisfied 3=not very satisfied 4=not at all satisfied 5=DK/NA
      env_hwps_025 = recode_values(q38, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: health care
      # q53: 1=more 2=less 3=same as now 4=DK/NA
      bri_hwps_009 = recode_values(q53, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q3f: 1=approve 2=disapprove 3=DK/NA
      env_intd_016 = recode_values(q3f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr Cdn troops in Bosnia
      # q104: 1=approve 2=disapprove 3=DK/NA
      env_intd_026 = recode_values(q104, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q3l: 1=approve 2=disapprove 3=DK/NA
      env_idim_054 = recode_values(q3l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q3m: 1=approve 2=disapprove 3=DK/NA
      env_dpin_009 = recode_values(q3m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q93g: 1=approve 2=disapprove 3=DK/NA
      env_idim_046 = recode_values(q93g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q93h: 1=approve 2=disapprove 3=DK/NA
      env_dpin_008 = recode_values(q93h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q93b: 1=approve 2=disapprove 3=DK/NA
      env_econ_049 = recode_values(q93b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Likely: achieve gender equality
      # q2i: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_soim_029 = recode_values(q2i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely: keep Canada united
      # q2d: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_idim_052 = recode_values(q2d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Likely: reduce crime
      # q2c: 1=very 2=somewhat 3=not very 4=not at all 5=DK/NA
      env_soim_030 = recode_values(q2c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Pornography serious problem
      # q71: 1=very serious 2=quite serious 3=not very serious 4=not at all serious 5=DK/NA
      env_soim_008 = recode_values(q71, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unmarried couple counts as family
      # q70a: 1=definitely is a family 2=definitely is not a family 3=DK/NA
      env_soim_036 = recode_values(q70a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1992-E-1992-4_F1.dta -- Environics, 36 questions
survey(
  survey_id = "cora-efc1992-E-1992-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1992-E-1992-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q70: 1=fair 2=unfair 3=DK/NA
      bri_econ_008 = recode_values(q70, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Agree free trade Can-US-Mexico
      # q109: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_061 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour Quebec separation
      # q111: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q111, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q106i: 1=approve 2=disapprove 3=DK/NA
      env_econ_060 = recode_values(q106i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q106a: 1=approve 2=disapprove 3=DK/NA
      env_idim_030 = recode_values(q106a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q73: 1=approve 2=disapprove 3=DK/NA
      env_econ_058 = recode_values(q73, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q63a: 1=do support 2=do not support 3=DK/NA
      env_econ_055 = recode_values(q63a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q65: 1=very important 2=somewhat important 3=not very important 4=not at all important 5=DK/NA
      env_econ_021 = recode_values(q65, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt waste important in spending
      # q68: 1=very important 2=somewhat important 3=not very important 4=DK/NA
      env_econ_065 = recode_values(q68, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cut services to hold taxes vs maintain
      # q61: 1=maintaining the current level of government services and pro 2=cutting government services and programs to keep taxes at th 3=DK/NA
      env_econ_066 = recode_values(q61, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q57e: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_043 = recode_values(q57e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q57f: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_044 = recode_values(q57f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Via Rail
      # q57b: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_059 = recode_values(q57b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q57a: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_028 = recode_values(q57a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q57c: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_029 = recode_values(q57c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q57d: 1=remain a crown corp. 2=be sold 3=DK/NA
      env_econ_045 = recode_values(q57d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Should be free trade with US
      # q107: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_econ_026 = recode_values(q107, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: forests
      # q106f: 1=approve 2=disapprove 3=DK/NA
      env_ener_031 = recode_values(q106f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Sell more/less coal abroad
      # q77e: 1=more 2=less 3=neither more nor less 4=DK/NA
      env_ener_021 = recode_values(q77e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q77c: 1=more 2=less 3=neither more nor less 4=DK/NA
      env_ener_022 = recode_values(q77c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q77a: 1=more 2=less 3=neither more nor less 4=DK/NA
      env_ener_016 = recode_values(q77a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q77d: 1=more 2=less 3=neither more nor less 4=DK/NA
      env_ener_023 = recode_values(q77d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q77b: 1=more 2=less 3=neither more nor less 4=DK/NA
      env_ener_024 = recode_values(q77b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Guaranteed minimum income program
      # q62: 1=should 2=should not 3=depends 4=DK/NA
      env_hwps_006 = recode_values(q62, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=approve 2=disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support reducing aid to Third World
      # q63b: 1=do support 2=do not support 3=DK/NA
      bri_intd_007 = recode_values(q63b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2l: 1=approve 2=disapprove 3=DK/NA
      env_idim_054 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=approve 2=disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q106g: 1=approve 2=disapprove 3=DK/NA
      env_idim_046 = recode_values(q106g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q106h: 1=approve 2=disapprove 3=DK/NA
      env_dpin_008 = recode_values(q106h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: econ development
      # q106b: 1=approve 2=disapprove 3=DK/NA
      env_econ_049 = recode_values(q106b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confid: governments (4-pt)
      # q76d: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence 5=DK/NA
      env_dpin_003 = recode_values(q76d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: country's police forces
      # q76f: 1=a lot of confidence 2=some confidence 3=little confidence 4=no confidence 5=DK/NA
      env_soim_018 = recode_values(q76f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Employers may require drug tests
      # q53: 1=should 2=should not 3=indifferent 4=depends 5=DK/NA
      env_soim_019 = recode_values(q53, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 5 ~ 9999),

      # Illegal drug use serious problem
      # q52: 1=very serious problem 2=somewhat serious problem 3=not very serious problem 4=not at all serious problem 5=DK/NA
      env_soim_016 = recode_values(q52, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Willing to undergo drug testing
      # q54: 1=yes 2=no 3=DK/NA
      env_soim_037 = recode_values(q54, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1993-E-1993-1_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc1993-E-1993-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1993-E-1993-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q109: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: listening people
      # q106i: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q106i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q7: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Trade: allies vs diversify
      # q64: 1=Diversify trade relations 2=Concentrate on allies 3=DK/NA
      env_intd_028 = recode_values(q64, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Unemployment next 6 mos up/down
      # q6: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: education
      # q106f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_036 = recode_values(q106f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Aid: long-term devt vs emergency
      # q44: 1=Aid for emergencies 2=Aid for long term development 3=Neither/other 4=DK/NA
      env_intd_030 = recode_values(q44, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr Cdn troops in Bosnia
      # q37: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_026 = recode_values(q37, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Trade not aid helps poor countries
      # q41a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 5=DK/NA
      env_intd_031 = recode_values(q41a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cdn troops in UN force operations
      # q36: 1=Yes, should 2=No, should not 3=DK/NA
      env_intd_029 = recode_values(q36, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # World more/less peaceful than 5 yrs
      # q32: 1=More peaceful 2=Less peaceful 3=About the same 4=DK/NA
      env_intd_027 = recode_values(q32, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: Indigenous issues
      # q2l: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_054 = recode_values(q2l, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q105a: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q105a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: forests
      # q106g: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q106g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q106h: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q106h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Bill 101 restricts English not enough
      # q112: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      env_idim_007 = recode_values(q112, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Satisfied QC French improvement
      # q111: 1=very satisfied 2=somewhat satisfied 3=somewhat dissatisfied 4=very dissatisfied 5=DK/NA
      env_idim_018 = recode_values(q111, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1993-E-1993-2_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1993-E-1993-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1993-E-1993-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q92: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q92, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q84i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q84i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q84a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q84a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: forests
      # q84f: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q84f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q83: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q83, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q84g: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q84g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q84h: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q84h, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1993-E-1993-3_F1.dta -- Environics, 27 questions
survey(
  survey_id = "cora-efc1993-E-1993-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1993-E-1993-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Teachers paid too little
      # q48: 1=Too much 2=The right amount 3=Too little 4=DK/NA
      bri_hwps_001 = recode_values(q48, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Favour Quebec separation
      # q109: 1=Stongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      bri_idim_002 = recode_values(q109, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q92i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q92i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q92a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q92a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q7: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: forests
      # q92f: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q92f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Only zero pollution acceptable
      # q96: 1=Some pollution is reasonable and practical 2=Only zero levels are acceptable 3=DK/NA
      env_ener_027 = recode_values(q96, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn pollution increased/decreased
      # q94: 1=Increased 2=Decrease 3=Remained the same 4=DK/NA
      env_ener_025 = recode_values(q94, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cdn students score lower on tests
      # q61a: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_031 = recode_values(q61a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Educ policy: global competitiveness
      # q33: 1=the primary factor determining policy and curriculum changes 2=an important factor, but just one of many factors determinin 3=a not ver
      env_hwps_032 = recode_values(q33, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Fed set national curriculum
      # q51a: 1=Agree 2=Disagree 3=DK/NA
      env_idim_057 = recode_values(q51a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed spending: education
      # q44a: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      bri_hwps_011 = recode_values(q44a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # University: access vs quality
      # q63: 1=High quality for fewer students 2=Acceptable quality for more students 3=DK/NA
      env_hwps_033 = recode_values(q63, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Parents pay school user fees
      # q47: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_034 = recode_values(q47, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Schools stress moral devt
      # q31a: 1=Very important 2=Somewhat important 3=Not important 4=DK/NA
      env_hwps_016 = recode_values(q31a, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Univ research aids prov development
      # q62b: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_035 = recode_values(q62b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q91: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q91, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q92g: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q92g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q92h: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q92h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of homosexuality
      # q69: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_soim_014 = recode_values(q69, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Constitution ban anti-gay discr
      # q68: 1=Yes should 2=No, should not 3=It depends 4=DK/NA
      env_soim_015 = recode_values(q68, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed importance: land claims not enough
      # q104: 1=Too much importance 2=Just enough importance 3=Not enough importance 4=DK/NA
      env_idim_014 = recode_values(q104, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Important: settle native land claims
      # q100a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_idim_056 = recode_values(q100a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Favour capital punishment
      # q111: 1=In favour for certain crimes 2=Opposed under any circumstances 3=DK/NA
      bri_soim_002 = recode_values(q111, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Economy vs environment priority
      # q95: 1=Economic development should have priority 2=Environmental concerns should have priority 3=Neither/both 4=DK/NA
      bri_ener_005 = recode_values(q95, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1993-E-1993-4_F1.dta -- Environics, 27 questions
survey(
  survey_id = "cora-efc1993-E-1993-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1993-E-1993-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q37: 1=Fair 2=Unfair 3=DK/NA
      bri_econ_008 = recode_values(q37, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Immigrants not adopting Cdn values
      # q98o: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_013 = recode_values(q98o, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Immigrants take jobs from Cdns
      # q98q: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_011 = recode_values(q98q, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q63i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q63i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q63a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q63a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve GST
      # q40: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_058 = recode_values(q40, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q31a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q31a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q33: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_021 = recode_values(q33, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt waste important in spending
      # q35: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q35, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cut services to hold taxes vs maintain
      # q30: 1=maintaining the current level of government services and pro 2=cutting government services and programs to keep taxes at th 3=DK/NA
      env_econ_066 = recode_values(q30, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr prov govt: forests
      # q63f: 1=Approve 2=Disapprove 3=DK/NA
      env_ener_031 = recode_values(q63f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Allow political refugees immigrate
      # q98d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_029 = recode_values(q98d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q98f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q98f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q98a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q98a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Immigration good for Cdn economy
      # q98l: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_055 = recode_values(q98l, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q98e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q98e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda needs more immigration for pop
      # q98b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_036 = recode_values(q98b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q31b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q31b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Too many racial minority immigrants
      # q98c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_049 = recode_values(q98c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Abortion: any woman who wants one
      # q97: 1=Agree 2=Disagree 3=DK/NA
      env_soim_010 = recode_values(q97, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: listening people
      # q2m: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_009 = recode_values(q2m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q62: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q62, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q63g: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q63g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q63h: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q63h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed multiculturalism policy
      # q5: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_idim_037 = recode_values(q5, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Aware fed multicultural policy
      # q4: 1=Yes, it does 2=No, it does not 3=DK/NA
      env_idim_038 = recode_values(q4, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1994-E-1994-1_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc1994-E-1994-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1994-E-1994-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favourable to US cruise missile tests
      # q112: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_intd_009 = recode_values(q112, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q135h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q135h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q135a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q135a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q9: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Reduce prov deficit important
      # q133: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q133, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Concern: maintain health care quality
      # q94a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=DK/NA
      env_hwps_018 = recode_values(q94a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: limit patients per doctor
      # q105a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_017 = recode_values(q105a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: raise employer contrib
      # q104a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_020 = recode_values(q104a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: rationalize hospitals
      # q106d: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_023 = recode_values(q106d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: tax on excess service use
      # q105c: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_024 = recode_values(q105c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: shift to lower-cost facilities
      # q106a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_019 = recode_values(q106a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require less fat/salt in food
      # q107a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_022 = recode_values(q107a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied w prov health care quality
      # q95: 1=Very satisfied 2=Somewhat satisfied 3=Not very satisfied 4=Not at all satisfied 5=DK/NA
      env_hwps_025 = recode_values(q95, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: health care
      # q101: 1=More 2=Less 3=Same as now 4=DK/NA
      bri_hwps_009 = recode_values(q101, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q4f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q4f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr Cdn troops in Bosnia
      # q113: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_026 = recode_values(q113, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q131: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q131, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q135f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q135f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q135g: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q135g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of euthanasia
      # q152: 1=Approve 2=Disapprove 3=Depends 4=DK/NA
      env_soim_032 = recode_values(q152, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Charge crime: assisted suicide
      # q153: 1=Should 2=Should not 3=Depends 4=DK/NA
      env_soim_040 = recode_values(q153, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Justice system favours Aboriginal
      # q111a: 1=Biased in favour 2=Biased against 3=Treats fairly 4=DK/NA
      env_idim_042 = recode_values(q111a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cdn judicial system sound/unsound
      # q110: 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound, needs fund
      env_soim_001 = recode_values(q110, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1994-E-1994-2_F1.dta -- Environics, 13 questions
survey(
  survey_id = "cora-efc1994-E-1994-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1994-E-1994-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q122h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q122h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q122a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q122a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power: fed vs prov govts
      # q87: 1=More powers for federal government 2=More powers for provincial governments 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q87, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q121: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q121, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q122f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q122f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q122g: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q122g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q135: 1=Too much attention 2=Not enough attention 3=About right 4=DK/NA
      env_idim_058 = recode_values(q135, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Fed-prov relations good/bad
      # q89: 1=very good 2=somewhat good 3=not very good 4=not at all good 5=DK/NA
      env_idim_032 = recode_values(q89, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cdn identity: the flag
      # q7a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_013 = recode_values(q7a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Quebec borders: parts may break away
      # q133: 1=Border as they are now 2=Parts break away from Quebec and stay part of Canada 3=DK/NA
      env_idim_059 = recode_values(q133, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec: independence vs current status
      # q129: 1=Current status in Canada 2=Complete independence from Canada 3=DK/NA
      env_idim_060 = recode_values(q129, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec should be part of Canada
      # q125: 1=Should 2=Should not 3=DK/NA
      env_idim_048 = recode_values(q125, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1994-E-1994-3_F1.dta -- Environics, 30 questions
survey(
  survey_id = "cora-efc1994-E-1994-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1994-E-1994-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q110h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q110h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q110a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q110a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Goal next decade: Cdn firms competitive
      # q3b: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_063 = recode_values(q3b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal next decade: prosperity all regions
      # q3g: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_064 = recode_values(q3g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Importance of cutting fed deficit
      # q3f: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_021 = recode_values(q3f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Inflation up/down next 6 months
      # q9: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Goal: clean up environment
      # q3a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_ener_032 = recode_values(q3a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reducing poverty
      # q3e: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_hwps_013 = recode_values(q3e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: maintain natl health care sys
      # q3h: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_hwps_014 = recode_values(q3h, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q4f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q4f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q109: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q109, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q110f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q110f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q110g: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q110g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban all guns incl hunting rifles
      # q56: 1=Yes 2=No 3=DK/NA
      env_soim_026 = recode_values(q56, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confidence in: Supreme Court
      # q37a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      bri_soim_008 = recode_values(q37a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: parole boards
      # q37f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_soim_038 = recode_values(q37f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime cause: lack school disc
      # q49a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_041 = recode_values(q49a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime a problem in community
      # q42: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_022 = recode_values(q42, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime really rising vs media hype
      # q45: 1=Crime rates are not really increasing 2=Crime is getting worse than before 3=DK/NA
      env_soim_042 = recode_values(q45, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Crime: prevention vs enforcement
      # q50: 1=Law enforcement: which involves detecting crime and punishin 2=Crime prevention: which involves education and programs to p 3=DK/NA
      env_soim_043 = recode_values(q50, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prevent crime: police vs public
      # q54: 1=Average person should do more 2=Law enforcement agencies should do more 3=Other (specify) 4=DK/NA
      env_soim_023 = recode_values(q54, 1 ~ 0, 2 ~ 1, c(3, 4) ~ 9999),

      # Enforce: all crimes vs violent only
      # q53: 1=Focus on violent crimes 2=Deal with all crimes 3=DK/NA
      env_soim_044 = recode_values(q53, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Goal: keep Cda independent of US
      # q3c: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_024 = recode_values(q3c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: equality men and women
      # q3i: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_027 = recode_values(q3i, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: keep Canada together
      # q3d: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_idim_050 = recode_values(q3d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Goal: reduce crime rate
      # q3j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_028 = recode_values(q3j, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Respect for law incr/decr
      # q40a: 1=Increasing 2=Decreasing 3=Staying the same 4=DK/NA
      env_soim_024 = recode_values(q40a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Native own justice system good/bad
      # q58: 1=Good development 2=Bad development 3=DK/NA
      env_idim_039 = recode_values(q58, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Afraid to walk at night
      # q47: 1=Yes 2=No 3=DK/NA
      env_soim_002 = recode_values(q47, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Serious crime in neighbourhood
      # q43: 1=Yes 2=No 3=DK/NA
      env_soim_039 = recode_values(q43, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1994-E-1994-4_F1.dta -- Environics, 35 questions
survey(
  survey_id = "cora-efc1994-E-1994-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1994-E-1994-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q9a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_027 = recode_values(q9a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Income tax system unfair
      # q27: 1=Fair 2=Unfair 3=DK/NA
      bri_econ_008 = recode_values(q27, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Immigrants not adopting Cdn values
      # q40f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_013 = recode_values(q40f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Immigrants take jobs from Cdns
      # q40e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_011 = recode_values(q40e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q64h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q64h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q64a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Business has too much power
      # q9e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_034 = recode_values(q9e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cut Via Rail subsidies
      # q17a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q17a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Importance of cutting fed deficit
      # q22: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_021 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt do more/less: farmers
      # q20g: 1=More 2=Less 3=Same 4=DK/NA
      env_econ_051 = recode_values(q20g, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt waste important in spending
      # q24: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q24, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cut services to hold taxes vs maintain
      # q19: 1=maintaining the current level of government services and pro 2=cutting government services and programs to keep taxes at th 3=DK/NA
      env_econ_066 = recode_values(q19, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q14e: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_043 = recode_values(q14e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q14f: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_044 = recode_values(q14f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Via Rail
      # q14b: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_059 = recode_values(q14b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q14a: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_028 = recode_values(q14a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q14c: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_029 = recode_values(q14c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q14d: 1=Remain a Crown Corporation 2=Be Sold 3=DK/NA
      env_econ_045 = recode_values(q14d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prov govt struck wrong balance
      # q33: 1=Right balance 2=Wrong balance 3=DK/NA
      env_econ_069 = recode_values(q33, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Reduce prov deficit important
      # q31: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q31, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Unions too much power
      # q9c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_039 = recode_values(q9c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt do more/less for unemployed
      # q20a: 1=More 2=Less 3=Same 4=DK/NA
      env_econ_052 = recode_values(q20a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more/less for young Cdns
      # q20i: 1=More 2=Less 3=Same 4=DK/NA
      env_hwps_009 = recode_values(q20i, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q40c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q40c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda keeps criminals out well
      # q40d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_intd_032 = recode_values(q40d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q40a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q40a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q40b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q40b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q17b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q17b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q63: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q63, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q64f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q64f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q64g: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q64g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more: women
      # q20c: 1=More 2=Less 3=Same 4=DK/NA
      env_soim_020 = recode_values(q20c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more for recent immigrants
      # q20e: 1=More 2=Less 3=Same 4=DK/NA
      env_idim_033 = recode_values(q20e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt do more: racial minority fair
      # q9b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_027 = recode_values(q9b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1995-E-1995-1_F1.dta -- Environics, 13 questions
survey(
  survey_id = "cora-efc1995-E-1995-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1995-E-1995-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q74h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q74h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q74a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q74a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Not enough competition: insurance
      # q46b: 1=Is 2=Is not 3=DK/NA
      env_econ_030 = recode_values(q46b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: telephones
      # q46e: 1=Is 2=Is not 3=DK/NA
      env_econ_053 = recode_values(q46e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: banks
      # q46a: 1=Is 2=Is not 3=DK/NA
      env_econ_032 = recode_values(q46a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Not enough competition: oil and gas
      # q46c: 1=Is 2=Is not 3=DK/NA
      env_econ_031 = recode_values(q46c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q9: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=approve 2=disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q73: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q73, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q74f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q74f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: listening people
      # q74g: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_008 = recode_values(q74g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed multiculturalism policy
      # q4: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_idim_037 = recode_values(q4, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Aware fed multicultural policy
      # q3: 1=Yes, it does 2=No, it does not 3=DK/NA
      env_idim_038 = recode_values(q3, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1995-E-1995-2_F1.dta -- Environics, 15 questions
survey(
  survey_id = "cora-efc1995-E-1995-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1995-E-1995-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Teachers paid too little
      # q58: 1=Too much 2=The right amount 3=Too little 4=DK/NA
      bri_hwps_001 = recode_values(q58, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q85a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q85a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cdn students score lower on tests
      # q64a: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_031 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Educ policy: global competitiveness
      # q50: 1=the primary factor determining policy and curriculum changes 2=an important factor, but just one of many factors determinin 3=a not ver
      env_hwps_032 = recode_values(q50, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Fed set national curriculum
      # q59a: 1=Agree 2=Disagree 3=DK/NA
      env_idim_057 = recode_values(q59a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed spending: education
      # q55a: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      bri_hwps_011 = recode_values(q55a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # University: access vs quality
      # q66: 1=Higher quality for fewer students 2=Acceptable quality for more students 3=DK/NA
      env_hwps_033 = recode_values(q66, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Parents pay school user fees
      # q57: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_034 = recode_values(q57, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Schools stress moral devt
      # q48a: 1=Very important 2=Somewhat important 3=Not important 4=DK/NA
      env_hwps_016 = recode_values(q48a, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Univ research aids prov development
      # q65b: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_035 = recode_values(q65b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=approve 2=disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr Cdn troops in Bosnia
      # q90: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_026 = recode_values(q90, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q84: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q84, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q85f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q85f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q96: 1=Too much attention 2=Not enough attention 3=About right 4=DK/NA
      env_idim_058 = recode_values(q96, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1995-E-1995-3_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc1995-E-1995-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1995-E-1995-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q109g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q109g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q109a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q109a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Inflation up/down next 6 months
      # q13: 1=Will increase 2=Will decrease 3=Will remain the same 4=DK/NA
      env_econ_001 = recode_values(q13, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # NAFTA helped/hurt Cdn economy
      # q82: 1=Helped 2=Hurt 3=DK/NA
      env_econ_070 = recode_values(q82, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Trade: allies vs diversify
      # q80: 1=Diversify trade relations 2=Concentrate on allies 3=DK/NA
      env_intd_028 = recode_values(q80, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # World econ: threat or opportunity
      # q81: 1=Opportunity 2=Threat 3=DK/NA
      env_econ_072 = recode_values(q81, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Aid: long-term devt vs emergency
      # q61: 1=Aid for emergencies 2=Aid for long term development 3=Neither/other 4=DK/NA
      env_intd_030 = recode_values(q61, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Trade not aid helps poor countries
      # q60a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_intd_031 = recode_values(q60a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Opinion of US favourable
      # q73: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_intd_003 = recode_values(q73, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Important: good relations w US
      # q50a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_004 = recode_values(q50a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # More/less US investment in Cda
      # q78: 1=Need more 2=Need less 3=Enough now 4=DK/NA
      env_intd_019 = recode_values(q78, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cda spending on poor countries
      # q59: 1=Too much 2=The right amount 3=Not enough 4=DK/NA
      env_intd_022 = recode_values(q59, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Boycott vs trade to promote rights
      # q55: 1=Increase trade links with these countries to try to open the 2=Cut back on trade with these countries to try to pressure th 3=DK/NA
      env_intd_033 = recode_values(q55, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn troops in UN force operations
      # q56: 1=Yes, should 2=No, should not 3=DK/NA
      env_intd_029 = recode_values(q56, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # World more/less peaceful than 5 yrs
      # q47: 1=More peaceful 2=Less peaceful 3=About the same 4=DK/NA
      env_intd_027 = recode_values(q47, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr premier handling job
      # q108: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q108, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q109f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q109f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more: cultural identity fr US
      # q86: 1=More 2=Less 3=Same 4=DK/NA
      env_intd_020 = recode_values(q86, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Legalize marijuana favour/oppose
      # q89: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_soim_011 = recode_values(q89, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1995-E-1995-4_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc1995-E-1995-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1995-E-1995-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Income tax system unfair
      # q61: 1=Fair GO TO Q63 2=Unfair GO TO Q62 3=DK/NA GO TO Q63
      bri_econ_008 = recode_values(q61, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr prov govt: agriculture
      # q86g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q86g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q86a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q86a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q53g: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_011 = recode_values(q53g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt waste important in spending
      # q57: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q57, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Deficit cut vs job creation spending
      # q60: 1=Increasing spending on job creation 2=Reduce its deficit 3=DK/NA
      env_econ_071 = recode_values(q60, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Atomic Energy of Cda
      # q50e: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_043 = recode_values(q50e, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CMHC
      # q50f: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_044 = recode_values(q50f, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Via Rail
      # q50b: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_059 = recode_values(q50b, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: Canada Post
      # q50a: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_028 = recode_values(q50a, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Privatize: CN Rail
      # q50c: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_029 = recode_values(q50c, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Sell vs keep as crown corp: CBC
      # q50d: 1=Remain a Crown Corp. 2=Be sold 3=DK/NA
      env_econ_045 = recode_values(q50d, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prov govt struck wrong balance
      # q65: 1=Right balance 2=Wrong balance 3=DK/NA
      env_econ_069 = recode_values(q65, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Reduce prov deficit important
      # q63: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q63, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Wages keeping pace w cost of living
      # q93: 1=Yes, have 2=No, have not 3=DK/NA
      env_econ_067 = recode_values(q93, 1 ~ 1, 2 ~ 0, 3 ~ 9999, 5 ~ NA_real_),

      # Willing to strike for pay/benefits
      # q94: 1=Yes 2=No 3=DK/NA
      env_hwps_037 = recode_values(q94, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q53h: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_012 = recode_values(q53h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support reducing aid to Third World
      # q53b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q53b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q85: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q85, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q86f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q86f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confid: business leaders
      # q68c: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence 5=DK/NA
      env_econ_010 = recode_values(q68c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: country's police forces
      # q68f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence 5=DK/NA
      env_soim_018 = recode_values(q68f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1996-E-1996-1_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc1996-E-1996-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1996-E-1996-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q157g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q157g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q157a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q157a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Financially better off than parents
      # q8: 1=Better off 2=Worse off 3=Same 4=DK/NA
      env_econ_062 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # More power: fed vs prov govts
      # q95: 1=More powers for federal government 2=More powers for provincial governments 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q95, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q156: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q156, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q157f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q157f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of homosexuality
      # q126: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_soim_014 = recode_values(q126, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Constitution ban anti-gay discr
      # q123: 1=Yes, should 2=No, should not 3=It depends (DO NOT READ) 4=DK/NA
      env_soim_015 = recode_values(q123, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q110: 1=too much attention 2=not enough attention 3=about right 4=DK/NA
      env_idim_058 = recode_values(q110, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cdn identity: the flag
      # q13a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_013 = recode_values(q13a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Quebec borders: parts may break away
      # q116: 1=Borders as they are now 2=Parts break away from Quebec and stay part of Canada 3=DK/NA
      env_idim_059 = recode_values(q116, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec: independence vs current status
      # q106: 1=Current status in Canada 2=Complete independence from Canada 3=DK/NA
      env_idim_060 = recode_values(q106, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec should be part of Canada
      # q102: 1=Should 2=Should not 3=DK/NA
      env_idim_048 = recode_values(q102, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1996-E-1996-2_F1.dta -- Environics, 13 questions
survey(
  survey_id = "cora-efc1996-E-1996-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1996-E-1996-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q85g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q85g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q85a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q85a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Corps should invest in poorer areas
      # q31a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_012 = recode_values(q31a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cdn corps should invest in Canada
      # q31c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_econ_005 = recode_values(q31c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Econ dev: prov vs fed responsible
      # q20: 1=the federal government 2=the provincial government 3=the private sector 4=combination/all 5=DK/NA
      env_econ_050 = recode_values(q20, 1 ~ 0, 2 ~ 1, c(3, 4, 5) ~ 9999),

      # Too little regulation of business
      # q26: 1=Too much 2=Too little 3=About right 4=DK/NA
      env_econ_042 = recode_values(q26, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Food industry profits not enough
      # q30a: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      env_econ_019 = recode_values(q30a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Business system basically sound
      # q25: 1=Basically sound 2=Basically sound but needs some improvements 3=Not too sound, needs many improvements 4=Basically unsound, needs funda
      env_econ_004 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: defence policy
      # q5f: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q5f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Interest in US presidential race
      # q61: 1=Very interested 2=Somewhat interested 3=Not very interested 4=Not at all interested in the American presidential race 5=DK/NA
      env_intd_021 = recode_values(q61, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr premier handling job
      # q84: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q84, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q85f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q85f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Keep monarch as head of state
      # q52: 1=Queen remain 2=Constitution 3=DK/NA
      bri_intd_008 = recode_values(q52, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cora-efc1996-E-1996-3_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc1996-E-1996-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1996-E-1996-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q104g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q104g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q104a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q104a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Concern: maintain health care quality
      # q17a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=DK/NA
      env_hwps_018 = recode_values(q17a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govts more resp for individual health
      # q21a: 1=More responsibility 2=Less responsibility 3=Same responsibility 4=DK/NA
      env_hwps_026 = recode_values(q21a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Health costs: limit patients per doctor
      # q35a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_017 = recode_values(q35a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: raise employer contrib
      # q34a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_020 = recode_values(q34a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: rationalize hospitals
      # q36d: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_023 = recode_values(q36d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: tax on excess service use
      # q35c: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_024 = recode_values(q35c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: shift to lower-cost facilities
      # q36a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_019 = recode_values(q36a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied w prov health care quality
      # q22: 1=Very satisfied 2=Somewhat satisfied 3=Not very satisfied 4=Not at all satisfied 5=DK/NA
      env_hwps_025 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: health care
      # q27: 1=More 2=Less 3=Same as now 4=DK/NA
      bri_hwps_009 = recode_values(q27, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2d: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q76: 1=Very favourable 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable 5=DK/NA
      env_intd_011 = recode_values(q76, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr premier handling job
      # q103: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q103, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q104f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q104f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q104i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q104i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Employers may require drug tests
      # q74: 1=Should 2=Should not 3=Indifferent 4=Depends 5=DK/NA
      env_soim_019 = recode_values(q74, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 5 ~ 9999),

      # Willing to undergo drug testing
      # q75: 1=Yes 2=No 3=DK/NA
      env_soim_037 = recode_values(q75, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1996-E-1996-4_F1.dta -- Environics, 25 questions
survey(
  survey_id = "cora-efc1996-E-1996-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1996-E-1996-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants not adopting Cdn values
      # q64f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_013 = recode_values(q64f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Immigrants take jobs from Cdns
      # q64e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_011 = recode_values(q64e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: agriculture
      # q113g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q113g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q113a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q113a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q10a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q10a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q10g: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_011 = recode_values(q10g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Deficit cut vs job creation spending
      # q20: 1=Increasing spending on job creation 2=Reduce its deficit 3=DK/NA
      env_econ_071 = recode_values(q20, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prov govt struck wrong balance
      # q27: 1=Right balance 2=Wrong balance 3=DK/NA
      env_econ_069 = recode_values(q27, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Reduce prov deficit important
      # q25: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr cutting federal taxes
      # q22: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_econ_074 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q10h: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_012 = recode_values(q10h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more/less for unemployed
      # q11a: 1=More 2=Less 3=Same 4=DK/NA
      env_econ_052 = recode_values(q11a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: defence policy
      # q2d: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Ban non-white immigration
      # q64c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q64c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda keeps criminals out well
      # q64d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_intd_032 = recode_values(q64d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q64a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q64a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q64b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q64b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q10b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q10b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q2i: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q2i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q112: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q112, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q113f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q113f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: deficit reduction
      # q113i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_075 = recode_values(q113i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Important: settle native land claims
      # q80a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_idim_056 = recode_values(q80a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Native peoples self-government
      # q83: 1=Yes, should 2=No, should not 3=DK/NA
      env_idim_051 = recode_values(q83, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Aboriginal: govt policy vs own fault
      # q85: 1=Natives caused their problems 2=Problems caused by attitudes/policies 3=Neither/other 4=DK/NA
      env_idim_053 = recode_values(q85, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1997-E-1997-1_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1997-E-1997-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1997-E-1997-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: agriculture
      # q134g: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_060 = recode_values(q134g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q134a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q134a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q2d: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q133: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q133, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q134f: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q134f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q134i: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q134i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more: cultural identity fr US
      # q93: 1=More 2=Less 3=Same 4=DK/NA
      env_intd_020 = recode_values(q93, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, 5 ~ NA_real_)
    )
  }
)

# cora-efc1997-E-1997-2_F1.dta -- Environics, 21 questions
survey(
  survey_id = "cora-efc1997-E-1997-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1997-E-1997-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Teachers paid too little
      # q25: 1=Too much 2=The right amount 3=Too little 4=DK/NA
      bri_hwps_001 = recode_values(q25, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q129a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q129a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cdn enviro record vs other nations
      # q84: 1=Much better 2=A little better 3=About the same 4=A little worse 5=Much worse 6=DK/NA
      env_ener_034 = recode_values(q84, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 6 ~ 9999),

      # Appr prov govt: social programs
      # q129f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q129f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cdn students score lower on tests
      # q47a: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_031 = recode_values(q47a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Educ policy: global competitiveness
      # q13: 1=The primary factor determining policy and curriculum changes 2=An important factor, but just one of many factors determinin 3=A not ver
      env_hwps_032 = recode_values(q13, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Fed set national curriculum
      # q33a: 1=Agree 2=Disagree 3=DK/NA
      env_idim_057 = recode_values(q33a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed spending: education
      # q15a: 1=Too much 2=Just enough 3=Not enough 4=DK/NA
      bri_hwps_011 = recode_values(q15a, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # University: access vs quality
      # q42: 1=High quality for fewer students 2=Acceptable quality for more students 3=DK/NA
      env_hwps_033 = recode_values(q42, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Parents pay school user fees
      # q24: 1=Agree 2=Disagree 3=DK/NA
      env_hwps_034 = recode_values(q24, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q100d: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q100d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q128: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q128, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q129h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q129h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed multiculturalism policy
      # q90: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_idim_037 = recode_values(q90, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Aware fed multicultural policy
      # q88: 1=Yes, it does 2=No, it does not 3=DK/NA
      env_idim_038 = recode_values(q88, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt do more: stop discrim women
      # q93a: 1=More 2=Less 3=Same 4=DK/NA
      env_soim_025 = recode_values(q93a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Ethnic groups should blend in
      # q92a: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      env_idim_043 = recode_values(q92a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Ethnic groups keep way of life
      # q92b: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      env_idim_044 = recode_values(q92b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Harder for non-whites to succeed
      # q92c: 1=Agree strongly 2=Agree somewhat 3=Disagree somewhat 4=Disagree strongly 5=DK/NA
      bri_idim_012 = recode_values(q92c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_),

      # Multiculturalism -> understanding
      # q91a: 1=Will 2=Will not 3=DK/NA
      env_idim_045 = recode_values(q91a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support proportional representation
      # q114: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_dpin_013 = recode_values(q114, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1997-E-1997-3_F1.dta -- Environics, 20 questions
survey(
  survey_id = "cora-efc1997-E-1997-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1997-E-1997-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q134a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q134a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power: fed vs prov govts
      # q31: 1=More powers for federal government 2=More powers for provincial government 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q31, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social programs
      # q134f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q134f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Health stds: prov vs fed set
      # q33: 1=Federal set national standards 2=Provincial set their own standards 3=OTHER/BOTH 4=DK/NA
      env_idim_064 = recode_values(q33, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Health stds: fed alone vs fed+prov
      # q35: 1=Federal and provincial governments together set health care 2=Federal government alone should set standards 3=DK/NA
      env_idim_065 = recode_values(q35, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q117e: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q117e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion: any woman who wants one
      # q15: 1=Agree 2=Disagree 3=DK/NA
      env_soim_010 = recode_values(q15, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q117j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q117j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q133: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q133, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q134h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q134h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Charge crime: assisted suicide
      # q21: 1=Should 2=Should not 3=DEPENDS 4=DK/NA
      env_soim_040 = recode_values(q21, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Constit priority: Senate reform
      # q84a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_dpin_012 = recode_values(q84a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q39: 1=Too much attention 2=Not enough attention 3=About right 4=DK/NA
      env_idim_058 = recode_values(q39, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Cdn identity: the flag
      # q28a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_intd_013 = recode_values(q28a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Keep monarch as head of state
      # q29: 1=British monarch remain 2=Canadian head of state 3=DK/NA
      bri_intd_008 = recode_values(q29, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Own province independence
      # q62: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_idim_062 = recode_values(q62, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Quebec borders: parts may break away
      # q90: 1=Borders as they are now 2=Parts break away from Quebec and stay part of Canada 3=DK/NA
      env_idim_059 = recode_values(q90, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec: independence vs current status
      # q60: 1=Current status in Canada 2=Complete independence from Canada 3=DK/NA
      env_idim_060 = recode_values(q60, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Quebec should be part of Canada
      # q56: 1=Should 2=Should not 3=DK/NA
      env_idim_048 = recode_values(q56, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favour capital punishment
      # q26: 1=In favour for certain crimes 2=Opposed under any circumstances 3=DK/NA
      bri_soim_002 = recode_values(q26, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1997-E-1997-4_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc1997-E-1997-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1997-E-1997-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour legal marijuana, medical uses
      # q56: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_soim_045 = recode_values(q56, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q116a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q116a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q17a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q17a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q17g: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_011 = recode_values(q17g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt waste important in spending
      # q31: 1=Very important 2=Somewhat imprtant 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q31, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Deficit cut vs job creation spending
      # q23: 1=Increasing spending on job creation 2=Reduce its deficit 3=DK/NA
      env_econ_071 = recode_values(q23, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prov govt struck wrong balance
      # q40: 1=Right balance 2=Wrong balance 3=DK/NA
      env_econ_069 = recode_values(q40, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Reduce prov deficit important
      # q38: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q38, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr cutting federal taxes
      # q28: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_econ_074 = recode_values(q28, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: social programs
      # q116f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q116f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q17h: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_012 = recode_values(q17h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed keep some health/educ $ vs transfer
      # q42: 1=Transfer all to provincial government for health care and ed 2=Spend some health and education money on individuals and ins 3=DK/NA
      env_idim_063 = recode_values(q42, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr fed govt: defence policy
      # q99e: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_016 = recode_values(q99e, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Support reducing aid to Third World
      # q17b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q17b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Boycott vs trade to promote rights
      # q59: 1=Increase trade links with these countries to try to open the 2=Cut back on trade with these countries to try to pressure th 3=DK/NA
      env_intd_033 = recode_values(q59, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Appr premier handling job
      # q115: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q115, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q116h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q116h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Legalize marijuana favour/oppose
      # q55: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_soim_011 = recode_values(q55, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1998-E-1998-1_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc1998-E-1998-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1998-E-1998-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q152a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q152a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social programs
      # q152f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q152f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q46: 1=Very favourble 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable 5=DK/NA
      env_intd_011 = recode_values(q46, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr fed govt: national unity
      # q135j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q135j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q151: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q151, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q152h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q152h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Confidence in: Supreme Court
      # q53a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      bri_soim_008 = recode_values(q53a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: parole boards
      # q53f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_soim_038 = recode_values(q53f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Confid: RCMP
      # q53d: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=DK/NA
      env_soim_047 = recode_values(q53d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime cause: lack school disc
      # q63a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_041 = recode_values(q63a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime cause: low moral stds
      # q63j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_046 = recode_values(q63j, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime a problem in community
      # q60: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_soim_022 = recode_values(q60, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Crime really rising vs media hype
      # q58: 1=Crime rates are not really increasing 2=Crime is getting worse than before 3=DK/NA
      env_soim_042 = recode_values(q58, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Crime: prevention vs enforcement
      # q64: 1=Law enforcement: which includes detecting crime and punishin 2=Crime prevention; which includes education and programs to p 3=DK/NA
      env_soim_043 = recode_values(q64, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Prevent crime: police vs public
      # q59: 1=Average person should do more 2=Law enforcement agencies should do more 3=Other (SPECIFY) 4=DK/NA
      env_soim_023 = recode_values(q59, 1 ~ 0, 2 ~ 1, c(3, 4) ~ 9999),

      # Enforce: all crimes vs violent only
      # q67: 1=Focus on violent crimes 2=Deal with all crimes 3=DK/NA
      env_soim_044 = recode_values(q67, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Respect for law incr/decr
      # q56a: 1=Increasing 2=Decreasing 3=Staying the same 4=DK/NA
      env_soim_024 = recode_values(q56a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Native own justice system good/bad
      # q75: 1=Good development 2=Bad development 3=DK/NA
      env_idim_039 = recode_values(q75, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Serious crime in neighbourhood
      # q61: 1=Yes 2=No 3=DK/NA
      env_soim_039 = recode_values(q61, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1998-E-1998-2_F1.dta -- Environics, 22 questions
survey(
  survey_id = "cora-efc1998-E-1998-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1998-E-1998-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q129a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q129a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Sell more/less coal abroad
      # q14e: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_021 = recode_values(q14e, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less hydro abroad
      # q14c: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_022 = recode_values(q14c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more oil abroad
      # q14a: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_016 = recode_values(q14a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less nuclear tech abroad
      # q14d: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_023 = recode_values(q14d, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Sell more/less natural gas abroad
      # q14b: 1=More 2=Less 3=Neither more nor less 4=DK/NA
      env_ener_024 = recode_values(q14b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr prov govt: social programs
      # q129f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q129f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Both parents work good/bad for family
      # q67: 1=Beneficial 2=Harmful 3=Neither 4=DK/NA
      env_soim_031 = recode_values(q67, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Heard recently about DND/Cdn Forces
      # q11: 1=Yes 2=No 3=DK/NA
      env_intd_034 = recode_values(q11, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q110j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q110j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q128: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q128, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q129h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q129h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Wide range vs Cdn content TV
      # q93: 1=Ensuring that all broadcasting services have Canadian conten 2=Ensuring that people have a wide range of broadcasting servi 3=DK/NA
      env_intd_035 = recode_values(q93, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Consider self feminist
      # q65: 1=Yes 2=No 3=DK/NA
      env_soim_033 = recode_values(q65, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Women's problem: income inequality
      # q63a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_hwps_027 = recode_values(q63a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require Cdn content on TV/radio
      # q94: 1=For 2=Against 3=DK/NA
      env_intd_012 = recode_values(q94, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Do more to promote women's equality
      # q66a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_soim_012 = recode_values(q66a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Require promote women to higher jobs
      # q73a: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_soim_035 = recode_values(q73a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # How much women earn vs men
      # q76: 1=Less than half of what men earn 2=About half of what men earn 3=About two-thirds of what men earn 4=Slightly less than what men earn 5=
      env_hwps_028 = recode_values(q76, 1 ~ -1, c(2, 3) ~ 9999, 4 ~ -1, 5 ~ 1, c(6, 7) ~ 9999),

      # Women's movement reflects women's views
      # q64: 1=Yes, does 2=No, does not 3=DK/NA
      env_soim_034 = recode_values(q64, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Women paid more than men at workplace
      # q131: 1=More 2=Less 3=The same 4=DK/NA
      env_hwps_029 = recode_values(q131, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Women more promotion oppty at workplace
      # q130: 1=More 2=Fewer 3=The same 4=DK/NA
      env_hwps_030 = recode_values(q130, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cora-efc1998-E-1998-3_F1.dta -- Environics, 24 questions
survey(
  survey_id = "cora-efc1998-E-1998-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1998-E-1998-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants not adopting Cdn values
      # q95f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_013 = recode_values(q95f, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Immigrants take jobs from Cdns
      # q95e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_011 = recode_values(q95e, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q139a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q139a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q41a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q41a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q41g: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_011 = recode_values(q41g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power: fed vs prov govts
      # q34: 1=More powers for federal government 2=More powers for provincial governments 3=Powers stay the same 4=DK/NA
      bri_idim_006 = recode_values(q34, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Govt waste important in spending
      # q53: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q53, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Reduce fed debt important
      # q45: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_076 = recode_values(q45, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Prov govt struck wrong balance
      # q58: 1=Right balance 2=Wrong balance 3=DK/NA
      env_econ_069 = recode_values(q58, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Reduce prov deficit important
      # q56: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_068 = recode_values(q56, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr cutting federal taxes
      # q46: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_econ_074 = recode_values(q46, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: social programs
      # q139f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q139f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q41h: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_012 = recode_values(q41h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed keep some health/educ $ vs transfer
      # q60: 1=Transfer all to provincial government for health care and ed 2=Spend some health and education money on individuals and ins 3=DK/NA
      env_idim_063 = recode_values(q60, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Allow political refugees immigrate
      # q95g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_029 = recode_values(q95g, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Ban non-white immigration
      # q95c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_035 = recode_values(q95c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Cda keeps criminals out well
      # q95d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_intd_032 = recode_values(q95d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Too much immigration to Canada
      # q95a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      bri_idim_007 = recode_values(q95a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Many refugees not real refugees
      # q95b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_idim_028 = recode_values(q95b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q41b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q41b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q120j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q120j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q138: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q138, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q139h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q139h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed-prov relations good/bad
      # q35: 1=very good 2=somewhat good 3=not very good 4=not at all good 5=DK/NA
      env_idim_032 = recode_values(q35, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999)
    )
  }
)

# cora-efc1998-E-1998-4_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1998-E-1998-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1998-E-1998-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q7: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=DK/NA
      env_econ_027 = recode_values(q7, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q147a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q147a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # NAFTA helped/hurt Cdn economy
      # q9: 1=Helped 2=Hurt 3=DK/NA
      env_econ_070 = recode_values(q9, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social programs
      # q147f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q147f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q125j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q125j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q146: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q146, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q147h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q147h, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1999-E-1999-1_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc1999-E-1999-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1999-E-1999-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q95a: 1=approve 2=disapprove 3=dk/na
      env_idim_030 = recode_values(q95a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social programs
      # q95f: 1=approve 2=disapprove 3=dk/na
      env_hwps_038 = recode_values(q95f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q70j: 1=approve 2=disapprove 3=dk/na
      env_idim_061 = recode_values(q70j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q94: 1=approve 2=disapprove 3=dk/na
      env_dpin_011 = recode_values(q94, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q95i: 1=approve 2=disapprove 3=dk/na
      env_idim_046 = recode_values(q95i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q95h: 1=approve 2=disapprove 3=dk/na
      env_econ_073 = recode_values(q95h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Approve of homosexuality
      # q22: 1=strongly approve 2=somewhat approve 3=somewhat disapprove 4=strongly disapprove 6=dk/na
      env_soim_014 = recode_values(q22, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 6 ~ 9999),

      # Murder: death penalty vs life
      # q24: 1=life imprisonment with no possibility of parole, or 2=the death penalty 3=other (specify) 4=dk/na
      env_soim_048 = recode_values(q24, 1 ~ 0, 2 ~ 1, c(3, 4) ~ 9999),

      # Favour capital punishment
      # q23: 1=in favour of certain crimes 2=opposed under any circumstances 3=dk/na
      bri_soim_002 = recode_values(q23, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1999-E-1999-2_F1.dta -- Environics, 17 questions
survey(
  survey_id = "cora-efc1999-E-1999-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1999-E-1999-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q121a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q121a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Canada adopt US dollar
      # q12: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good 5=DK/NA
      env_intd_036 = recode_values(q12, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Canada-US common currency
      # q11: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good 5=DK/NA
      env_intd_025 = recode_values(q11, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr prov govt: social programs
      # q121f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q121f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Concern: maintain health care quality
      # q23a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=DK/NA
      env_hwps_018 = recode_values(q23a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govts more resp for individual health
      # q24a: 1=More responsibility 2=Less responsibility 3=Same responsibility 4=DK/NA
      env_hwps_026 = recode_values(q24a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Health costs: limit patients per doctor
      # q31a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_017 = recode_values(q31a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health costs: rationalize hospitals
      # q32d: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_023 = recode_values(q32d, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: shift to lower-cost facilities
      # q32a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_019 = recode_values(q32a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Health: tax on excess service use
      # q31c: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=DK/NA
      env_hwps_024 = recode_values(q31c, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Satisfied w prov health care quality
      # q25: 1=Very satisfied 2=Somewhat satisfied 3=Not very satisfied 4=Not at all satisfied 5=DK/NA
      env_hwps_025 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Fed spending: health care
      # q29: 1=More 2=Less 3=Same as now 4=DK/NA
      bri_hwps_009 = recode_values(q29, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Appr fed govt: national unity
      # q102j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q102j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr premier handling job
      # q120: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_011 = recode_values(q120, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q121i: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q121i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q121h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q121h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Unmarried couple counts as family
      # q20a: 1=Definitely is a family 2=Definitely is not a family 3=DK/NA
      env_soim_036 = recode_values(q20a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1999-E-1999-3_F1.dta -- Environics, 22 questions
survey(
  survey_id = "cora-efc1999-E-1999-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1999-E-1999-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdns pay too little tax
      # q38: 1=Too much 2=About the right amount 3=Too little 4=DK/NA
      env_econ_077 = recode_values(q38, 1 ~ -1, 2 ~ 0, 3 ~ 1, 4 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q94a: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_030 = recode_values(q94a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut Via Rail subsidies
      # q18a: 1=Do support 2=Do not support 3=DK/NA
      env_econ_055 = recode_values(q18a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut back unemployment insurance
      # q18g: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_011 = recode_values(q18g, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Govt waste important in spending
      # q28: 1=Very important 2=Somewhat important 3=Not very important 4=DK/NA
      env_econ_065 = recode_values(q28, c(1, 2) ~ 1, 3 ~ 0, 4 ~ 9999),

      # Reduce fed debt important
      # q22: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 5=DK/NA
      env_econ_076 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Appr cutting federal taxes
      # q23: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=DK/NA
      env_econ_074 = recode_values(q23, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # More concerned: services vs taxes
      # q40a: 1=Strongly disagree 7=Strongly agree 8=DK/NA
      env_econ_078 = recode_values(q40a, c(1, 2, 3) ~ -1, 4 ~ 0, c(5, 6, 7) ~ 1, 8 ~ 9999),

      # Tax cuts stimulate growth/revenue
      # q40b: 1=Strongly disagree 7=Strongly agree 8=DK/NA
      env_econ_079 = recode_values(q40b, c(1, 2, 3) ~ -1, 4 ~ 0, c(5, 6, 7) ~ 1, 8 ~ 9999),

      # Wages keeping pace w cost of living
      # q122: 1=Yes, have 2=No, have not 3=DK/NA
      env_econ_067 = recode_values(q122, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Willing to strike for pay/benefits
      # q123: 1=Yes 2=No 3=DK/NA
      env_hwps_037 = recode_values(q123, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: roads/highways
      # q94k: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_039 = recode_values(q94k, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: social programs
      # q94f: 1=Approve 2=Disapprove 3=DK/NA
      env_hwps_038 = recode_values(q94f, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Cut fed funding: post-secondary educ
      # q18h: 1=Do support 2=Do not support 3=DK/NA
      env_hwps_012 = recode_values(q18h, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Fed keep some health/educ $ vs transfer
      # q36: 1=The federal government should transfer all these federal dol 2=The federal government should spend some of this health and 3=DK/NA
      env_idim_063 = recode_values(q36, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Opinion of US favourable
      # q41: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=DK/NA
      env_intd_003 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Support reducing aid to Third World
      # q18b: 1=Do support 2=Do not support 3=DK/NA
      bri_intd_007 = recode_values(q18b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: immigration
      # q74m: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_031 = recode_values(q74m, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # q74j: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(q74j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q94i: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_046 = recode_values(q94i, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: ethical govt
      # q94j: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_014 = recode_values(q94j, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: taxation
      # q94h: 1=Approve 2=Disapprove 3=DK/NA
      env_econ_073 = recode_values(q94h, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc1999-E-1999-4_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc1999-E-1999-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc1999-E-1999-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # Q107A: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(Q107A, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # Q107F: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(Q107F, 1 ~ 1, 2 ~ 0),

      # Appr Preston Manning as Reform ldr
      # Q89: 1=Approve 2=Disapprove 3=DK/NA
      env_dpin_010 = recode_values(Q89, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr fed govt: national unity
      # Q85J: 1=Approve 2=Disapprove 3=DK/NA
      env_idim_061 = recode_values(Q85J, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Appr prov govt: ethical govt
      # Q107J: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(Q107J, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # Q107H: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(Q107H, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: foreign policy
      # Q85A: 1=Approve 2=Disapprove 3=DK/NA
      env_intd_018 = recode_values(Q85A, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cora-efc2000-E-2000-1_F1.dta -- Environics, 27 questions
survey(
  survey_id = "cora-efc2000-E-2000-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2000-E-2000-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdn values similar to my own
      # q35a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_intd_039 = recode_values(q35a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr prov govt: fed-prov relations
      # q98a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q98a, 1 ~ 1, 2 ~ 0),

      # More power: fed vs prov govts
      # q48: 1=Federal Government should have more powers 2=Provincial governments should have more powers 3=The division of powers should remain the 
      bri_idim_006 = recode_values(q48, 1 ~ 1, 2 ~ -1, 3 ~ 0),

      # Appr exporting bulk fresh water
      # q9: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove
      env_ener_035 = recode_values(q9, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Likely we can clean up environment
      # q4a: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_ener_033 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr prov govt: roads/highways
      # q98k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q98k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q98f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q98f, 1 ~ 1, 2 ~ 0),

      # Health stds: prov vs fed set
      # q50: 1=Federal government should continue setting standards 2=Provincial governments should set their own standards
      env_idim_064 = recode_values(q50, 1 ~ -1, 2 ~ 1),

      # Health stds: fed alone vs fed+prov
      # q52: 1=Federal and provincial governments should set standards toge 2=Federal government alone should set standards
      env_idim_065 = recode_values(q52, 1 ~ 0, 2 ~ 1),

      # Likely Canada will reduce poverty
      # q4e: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_hwps_015 = recode_values(q4e, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Prov opt out of new natl programs
      # q53: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_idim_066 = recode_values(q53, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Natl health stds: fed vs provs (2000s)
      # q51: 1=It is possible for the provinces to work together to set sta 2=Only the federal government is able to set standards
      env_idim_069 = recode_values(q51, 1 ~ 0, 2 ~ 1),

      # Appr fed govt: immigration
      # q72m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q72m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q72j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q72j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q98i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q98i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q98j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q98j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q98h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q98h, 1 ~ 1, 2 ~ 0),

      # Constit priority: Senate reform
      # q63a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important
      env_dpin_012 = recode_values(q63a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed govt attention to Quebec: not enough
      # q60: 1=Gives too much attention to Quebec 2=Not enough attention to Quebec 3=Approach to Quebec is about right
      env_idim_058 = recode_values(q60, 1 ~ -1, 2 ~ 1, 3 ~ 0),

      # French in QC secure
      # q46: 1=Very secure 2=Somewhat secure 3=Not very secure 4=Not at all secure
      env_idim_067 = recode_values(q46, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # French outside QC secure
      # q47: 1=Very secure 2=Somewhat secure 3=Not very secure 4=Not at all secure
      env_idim_068 = recode_values(q47, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Cdn identity: the flag
      # q42a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important
      env_intd_013 = recode_values(q42a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Likely: achieve gender equality
      # q4h: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_soim_029 = recode_values(q4h, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Likely: keep Canada united
      # q4d: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_idim_052 = recode_values(q4d, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Likely: reduce crime
      # q4c: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_soim_030 = recode_values(q4c, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Own province independence
      # q68: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose
      env_idim_062 = recode_values(q68, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Quebec borders: parts may break away
      # q69: 1=Borders should remain as they are now 2=Those parts of Quebec that voted to remain should be allowed
      env_idim_059 = recode_values(q69, 1 ~ 0, 2 ~ 1)
    )
  }
)

# cora-efc2000-E-2000-2_F1.dta -- Environics, 22 questions
survey(
  survey_id = "cora-efc2000-E-2000-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2000-E-2000-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q88a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q88a, 1 ~ 1, 2 ~ 0),

      # NAFTA helped/hurt Cdn economy
      # q21: 1=Helped Canadian economy 2=Hurt Canadian economy 3=Neither
      env_econ_070 = recode_values(q21, 1 ~ 1, c(2, 3) ~ 0),

      # Trade: allies vs diversify
      # q26: 1=Canada should diversify 2=Concentrate it trade relations with traditional allies
      env_intd_028 = recode_values(q26, 1 ~ 0, 2 ~ 1),

      # World econ: threat or opportunity
      # q25: 1=Create opportunities 2=Pose a threat
      env_econ_072 = recode_values(q25, 1 ~ 0, 2 ~ 1),

      # Cdn enviro record vs other nations
      # q40: 1=Much better 2=A little better 3=About the same 4=A little worse 5=Much worse
      env_ener_034 = recode_values(q40, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1),

      # Appr prov govt: roads/highways
      # q88k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q88k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q88f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q88f, 1 ~ 1, 2 ~ 0),

      # Cda join US missile defence
      # q54: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose
      env_intd_037 = recode_values(q54, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Important: Cda promote world peace
      # q19a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important
      env_intd_023 = recode_values(q19a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Favourable opinion of Cdn Forces
      # q49: 1=Very favourable 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable
      env_intd_011 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Heard recently about DND/Cdn Forces
      # q51: 1=Yes 2=No
      env_intd_034 = recode_values(q51, 1 ~ 1, 2 ~ 0),

      # Cda should aid poor countries
      # q19b: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important
      env_intd_038 = recode_values(q19b, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Cda spending on poor countries
      # q32: 1=Too much 2=Right Amount 3=Not Enough
      env_intd_022 = recode_values(q32, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Boycott vs trade to promote rights
      # q31: 1=Increase trade links 2=Cut back on trade 3=OTHER (SPECIFY)
      env_intd_033 = recode_values(q31, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Cdn troops in UN force operations
      # q37: 1=Yes, should 2=No, should not
      env_intd_029 = recode_values(q37, 1 ~ 1, 2 ~ 0),

      # Abortion: any woman who wants one
      # q10: 1=Agree 2=Disagree 3=Depends
      env_soim_010 = recode_values(q10, 1 ~ 1, c(2, 3) ~ 0),

      # Appr fed govt: immigration
      # q70m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q70m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q70j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q70j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q88i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q88i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q88j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q88j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q88h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q88h, 1 ~ 1, 2 ~ 0),

      # Charge crime: assisted suicide
      # q12: 1=Should 2=Should not 3=Depends
      env_soim_040 = recode_values(q12, 1 ~ 1, 2 ~ -1, 3 ~ 0)
    )
  }
)

# cora-efc2000-E-2000-3_F1.dta -- Environics, 10 questions
survey(
  survey_id = "cora-efc2000-E-2000-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2000-E-2000-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdns pay too little tax
      # q15: 1=Too much 2=About the right amount 3=Too little
      env_econ_077 = recode_values(q15, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Appr prov govt: fed-prov relations
      # q68a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q68a, 1 ~ 1, 2 ~ 0),

      # Appr cutting federal taxes
      # q8: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove
      env_econ_074 = recode_values(q8, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr prov govt: roads/highways
      # q68k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q68k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q68f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q68f, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: immigration
      # q40m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q40m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q40j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q40j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q68i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q68i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q68j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q68j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q68h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q68h, 1 ~ 1, 2 ~ 0)
    )
  }
)

# cora-efc2000-E-2000-4_F1.dta -- Environics, 10 questions
survey(
  survey_id = "cora-efc2000-E-2000-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2000-E-2000-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr fed govt: transportation
      # q36n: 1=Approve 2=Disapprove
      env_hwps_040 = recode_values(q36n, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: fed-prov relations
      # q56a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q56a, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: roads/highways
      # q56k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q56k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q56f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q56f, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: immigration
      # q36m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q36m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q36j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q36j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q56i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q56i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q56j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q56j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q56h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q56h, 1 ~ 1, 2 ~ 0),

      # Support proportional representation
      # q45: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose
      env_dpin_013 = recode_values(q45, c(1, 2) ~ 1, c(3, 4) ~ 0)
    )
  }
)

# cora-efc2001-E-2001-1_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc2001-E-2001-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2001-E-2001-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Support gay/lesbian couples marrying
      # q53: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      bri_soim_014 = recode_values(q53, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: transportation
      # q66n: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_040 = recode_values(q66n, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q82a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q82a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: roads/highways
      # q82k: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_039 = recode_values(q82k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q82f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q82f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Cda join US missile defence
      # q58: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_intd_037 = recode_values(q58, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: immigration
      # q66m: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_031 = recode_values(q66m, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr fed govt: national unity
      # q66j: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_061 = recode_values(q66j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q82i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q82i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q82j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q82j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q82h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q82h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Approve of homosexuality
      # q54: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=Neither approve nor disapprove 99=DK/NA
      env_soim_014 = recode_values(q54, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Confidence in: Supreme Court
      # q22a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      bri_soim_008 = recode_values(q22a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Confid: parole boards
      # q22f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_038 = recode_values(q22f, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Confid: RCMP
      # q22d: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_047 = recode_values(q22d, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Crime cause: lack school disc
      # q32a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_soim_041 = recode_values(q32a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Crime cause: low moral stds
      # q32j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_soim_046 = recode_values(q32j, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Native own justice system good/bad
      # q43: 1=Good thing 2=Bad thing 99=DK/NA
      env_idim_039 = recode_values(q43, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Favour capital punishment
      # q45: 1=In favour for certain crimes 2=Opposed under any circumstances 99=DK/NA
      bri_soim_002 = recode_values(q45, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2001-E-2001-2_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc2001-E-2001-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2001-E-2001-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Favour legal marijuana, medical uses
      # q58: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose
      env_soim_045 = recode_values(q58, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr fed govt: transportation
      # q70n: 1=Approve 2=Disapprove
      env_hwps_040 = recode_values(q70n, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: fed-prov relations
      # q88a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q88a, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: roads/highways
      # q88k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q88k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q88f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q88f, 1 ~ 1, 2 ~ 0),

      # Both parents work good/bad for family
      # q30: 1=Beneficial 2=Harmful 3=Neither
      env_soim_031 = recode_values(q30, 1 ~ 1, 2 ~ -1, 3 ~ 0),

      # Appr fed govt: immigration
      # q70m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q70m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q70j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q70j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q88i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q88i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q88j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q88j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q88h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q88h, 1 ~ 1, 2 ~ 0),

      # Consider self feminist
      # q27: 1=Yes, consider self a feminist 2=No, do not consider self feminist
      env_soim_033 = recode_values(q27, 1 ~ 1, 2 ~ 0),

      # Women's problem: income inequality
      # q26a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important
      env_hwps_027 = recode_values(q26a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Legalize marijuana favour/oppose
      # q57: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose
      env_soim_011 = recode_values(q57, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Do more to promote women's equality
      # q29a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_soim_012 = recode_values(q29a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Require promote women to higher jobs
      # q41a: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove
      env_soim_035 = recode_values(q41a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # How much women earn vs men
      # q44: 1=Less than half 2=About half 3=About two-thirds 4=Slightly less 5=Slightly more 98=Other
      env_hwps_028 = recode_values(q44, 1 ~ -1, c(2, 3) ~ 9999, 4 ~ -1, 5 ~ 1, 98 ~ 9999),

      # Women's movement reflects women's views
      # q24: 1=Yes, does 2=No, does not
      env_soim_034 = recode_values(q24, 1 ~ 1, 2 ~ 0)
    )
  }
)

# cora-efc2001-E-2001-3_F1.dta -- Environics, 20 questions
survey(
  survey_id = "cora-efc2001-E-2001-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2001-E-2001-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr fed govt: transportation
      # q69n: 1=Approve 2=Disapprove
      env_hwps_040 = recode_values(q69n, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: fed-prov relations
      # q94a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q94a, 1 ~ 1, 2 ~ 0),

      # Appr exporting bulk fresh water
      # q31: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove
      env_ener_035 = recode_values(q31, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Fed spending: employment insurance
      # q7s: 1=Too much 2=Right amount 3=Too little
      env_hwps_041 = recode_values(q7s, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Appr cutting federal taxes
      # q11: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove
      env_econ_074 = recode_values(q11, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Tap water quality trend
      # q33: 1=Improved 2=Stayed about the same 3=Become worse
      env_ener_029 = recode_values(q33, 1 ~ 1, 2 ~ 0, 3 ~ -1),

      # Appr prov govt: roads/highways
      # q94k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q94k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q94f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q94f, 1 ~ 1, 2 ~ 0),

      # Fed spending: enviro protection
      # q7b: 1=Too much 2=Right amount 3=Too little
      env_ener_015 = recode_values(q7b, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Fed spending: education
      # q7n: 1=Too much 2=Right amount 3=Too little
      bri_hwps_011 = recode_values(q7n, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Fed spending: reducing child poverty
      # q7u: 1=Too much 2=Right amount 3=Too little
      env_hwps_042 = recode_values(q7u, 1 ~ -1, 2 ~ 0, 3 ~ 1),

      # Opinion of US favourable
      # q34: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable
      env_intd_003 = recode_values(q34, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Terrorist attack in Cda in 2 yrs
      # q40: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_intd_041 = recode_values(q40, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr fed govt: immigration
      # q69m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q69m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q69j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q69j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q94i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q94i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q94j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q94j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q94h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q94h, 1 ~ 1, 2 ~ 0),

      # Wide range vs Cdn content TV
      # q29: 1=Ensuring Canadian content and programming, even if people's 2=Ensuring wide range of broadcasting services, even if Canadi
      env_intd_035 = recode_values(q29, 1 ~ 0, 2 ~ 1),

      # Fed spending: arts and culture
      # q7r: 1=Too much 2=Right amount 3=Too little
      env_intd_040 = recode_values(q7r, 1 ~ -1, 2 ~ 0, 3 ~ 1)
    )
  }
)

# cora-efc2001-E-2001-4_F1.dta -- Environics, 24 questions
survey(
  survey_id = "cora-efc2001-E-2001-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2001-E-2001-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants not adopting Cdn values
      # q62f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      bri_idim_013 = recode_values(q62f, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Immigrants take jobs from Cdns
      # q62e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      bri_idim_011 = recode_values(q62e, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr fed govt: transportation
      # q120n: 1=Approve 2=Disapprove
      env_hwps_040 = recode_values(q120n, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: fed-prov relations
      # q135a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q135a, 1 ~ 1, 2 ~ 0),

      # Canada adopt US dollar
      # q34: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good
      env_intd_036 = recode_values(q34, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Canada-US common currency
      # q33: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good
      env_intd_025 = recode_values(q33, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Govt reg increases consumer protection
      # q35: 1=Increases 2=Decreases 3=Makes no difference
      env_econ_080 = recode_values(q35, 1 ~ 1, 2 ~ -1, 3 ~ 0),

      # World econ: threat or opportunity
      # q29: 1=Create opportunities 2=Pose a threat
      env_econ_072 = recode_values(q29, 1 ~ 0, 2 ~ 1),

      # Appr prov govt: roads/highways
      # q135k: 1=Approve 2=Disapprove
      env_hwps_039 = recode_values(q135k, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q135f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q135f, 1 ~ 1, 2 ~ 0),

      # Cda-US common border policy
      # q78a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_intd_042 = recode_values(q78a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Ban non-white immigration
      # q62c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_idim_035 = recode_values(q62c, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Cda keeps criminals out well
      # q62d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_intd_032 = recode_values(q62d, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Too much immigration to Canada
      # q62a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      bri_idim_007 = recode_values(q62a, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Immigration good for Cdn economy
      # q62g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_idim_055 = recode_values(q62g, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Many refugees not real refugees
      # q62b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      env_idim_028 = recode_values(q62b, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Terrorist attack in Cda in 2 yrs
      # q80: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely
      env_intd_041 = recode_values(q80, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Canada should improve border security
      # q78e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree
      bri_intd_010 = recode_values(q78e, c(1, 2) ~ 1, c(3, 4) ~ 0),

      # Appr fed govt: immigration
      # q120m: 1=Approve 2=Disapprove
      env_idim_031 = recode_values(q120m, 1 ~ 1, 2 ~ 0),

      # Appr fed govt: national unity
      # q120j: 1=Approve 2=Disapprove
      env_idim_061 = recode_values(q120j, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: dom security
      # q135l: 1=Approve 2=Disapprove
      env_intd_043 = recode_values(q135l, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: Indigenous affairs
      # q135i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q135i, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: ethical govt
      # q135j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q135j, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: taxation
      # q135h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q135h, 1 ~ 1, 2 ~ 0)
    )
  }
)

# cora-efc2003-E-2003-1_F1.dta -- Environics, 22 questions
survey(
  survey_id = "cora-efc2003-E-2003-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2003-E-2003-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdn values similar to my own
      # q20a: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 99=DK/NA
      env_intd_039 = recode_values(q20a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q85a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q85a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # More power: fed vs prov govts
      # q27: 1=Federal Government should have more powers 2=Provincial governments should have more powers 3=The division of powers should remain the 
      bri_idim_006 = recode_values(q27, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: roads/highways
      # q85k: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_039 = recode_values(q85k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q85f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q85f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Health stds: prov vs fed set
      # q29: 1=Federal government should continue setting 2=Provincial governments should set their own 99=DK/NA
      env_idim_064 = recode_values(q29, 1 ~ -1, 2 ~ 1, 99 ~ 9999),

      # Health stds: fed alone vs fed+prov
      # q31: 1=Federal and provincial governments should set 2=Federal government alone should set standards 99=DK/NA
      env_idim_065 = recode_values(q31, 1 ~ 0, 2 ~ 1, 99 ~ 9999),

      # Prov opt out of new natl programs
      # q32: 1=strongly agree 2=somewhat agree 3=somewhat disagree 4=strongly disagree 99=DK/NA
      env_idim_066 = recode_values(q32, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Natl health stds: fed vs provs (2000s)
      # q30: 1=It is possible for the provinces to work together 2=Only the federal government is able to set 99=DK/NA
      env_idim_069 = recode_values(q30, 1 ~ 0, 2 ~ 1, 99 ~ 9999),

      # Opinion of US favourable
      # q43: 1=Very favourable 2=somewhat favourable 3=somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_003 = recode_values(q43, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: dom security
      # q85l: 1=Approve 2=Disapprove 99=DK/NA
      env_intd_043 = recode_values(q85l, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q85i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q85i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q85j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q85j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q85h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q85h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Constit priority: Senate reform
      # q38a: 1=Very important 2=somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_dpin_012 = recode_values(q38a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Familiar w Aboriginal issues
      # q9: 1=Very familiar 2=somewhat familiar 3=Not very familiar 4=Not at all familiar 99=DK/NA
      env_idim_071 = recode_values(q9, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q36: 1=Gives too much attention to Quebec 2=Not enough attention to Quebec 3=Approach to Quebec is about right 99=DK/NA
      env_idim_058 = recode_values(q36, 1 ~ -1, 2 ~ 1, 3 ~ 0, 99 ~ 9999),

      # French in QC secure
      # q25: 1=Very secure 2=somewhat secure 3=not very secure 4=Not at all secure 99=DK/NA
      env_idim_067 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # French outside QC secure
      # q26: 1=Very secure 2=somewhat secure 3=Not very secure 4=Not at all secure 99=DK/NA
      env_idim_068 = recode_values(q26, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cdn identity: the flag
      # q21a: 1=Very important 2=somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_013 = recode_values(q21a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Important: settle native land claims
      # q13a: 1=very important 2=somewhat important 3=not very important 4=not at all important 99=DK/NA
      env_idim_056 = recode_values(q13a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Own province independence
      # q42: 1=strongly favour 2=somewhat favour 3=somewhat oppose 4=strongly oppose 99=DK/NA
      env_idim_062 = recode_values(q42, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2003-E-2003-2_F1.dta -- Environics, 11 questions
survey(
  survey_id = "cora-efc2003-E-2003-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2003-E-2003-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Support gay/lesbian couples marrying
      # q9: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      bri_soim_014 = recode_values(q9, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Canada adopt US dollar
      # q29: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good 99=DK/NA
      env_intd_036 = recode_values(q29, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Canada-US common currency
      # q28: 1=Very good 2=Somewhat good 3=Not very good 4=Not at all good 99=DK/NA
      env_intd_025 = recode_values(q28, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Access to family physician trend
      # q34a: 1=Better 2=Worse 3=The same 99=DK/NA
      env_hwps_045 = recode_values(q34a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed transfers: catastrophic drug costs
      # q49: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_hwps_046 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Health costs: limit patients per doctor
      # q47a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_hwps_017 = recode_values(q47a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda join US missile defence
      # q27: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_intd_037 = recode_values(q27, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda-US econ relations closer/less
      # q25: 1=Closer economic relations 2=Less close economic relations 3=About the same as now 99=DK/NA
      env_intd_006 = recode_values(q25, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Opinion of US favourable
      # q19: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_003 = recode_values(q19, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Favourable opinion of US Pres Bush
      # q24: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_046 = recode_values(q24, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Approve of homosexuality
      # q10: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=Neither approve nor disapprove 99=DK/NA
      env_soim_014 = recode_values(q10, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2003-E-2003-3_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc2003-E-2003-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2003-E-2003-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Support gay/lesbian couples marrying
      # q41: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      bri_soim_014 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q93a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q93a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q10k: 1=More 2=Less 3=Same 99=DK/NA
      env_idim_070 = recode_values(q10k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q10q: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q10q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr cutting federal taxes
      # q18: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_econ_074 = recode_values(q18, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: roads/highways
      # q93k: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_039 = recode_values(q93k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q93f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q93f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: enviro protection
      # q10b: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_015 = recode_values(q10b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: amateur athletes
      # q10v: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_045 = recode_values(q10v, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q10u: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q10u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q10s: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q10s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: homelessness
      # q10t: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_044 = recode_values(q10t, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q10n: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_044 = recode_values(q10n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: dom security
      # q93l: 1=Approve 2=Disapprove 99=DK/NA
      env_intd_043 = recode_values(q93l, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q93i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q93i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q93j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q93j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q93h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q93h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: arts and culture
      # q10p: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_040 = recode_values(q10p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2003-E-2003-4_F1.dta -- Environics, 10 questions
survey(
  survey_id = "cora-efc2003-E-2003-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2003-E-2003-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants not adopting Cdn values
      # q30f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_013 = recode_values(q30f, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Immigrants take jobs from Cdns
      # q30e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_011 = recode_values(q30e, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Canada has distinct culture
      # q12: 1=Yes 2=No 99=DK/NA
      bri_intd_006 = recode_values(q12, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Concern: nuclear energy cost
      # q34a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 99=DK/NA
      env_ener_030 = recode_values(q34a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Support/oppose Kyoto Accord
      # q36: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_ener_036 = recode_values(q36, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Ban non-white immigration
      # q30c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_035 = recode_values(q30c, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Cda keeps criminals out well
      # q30d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_intd_032 = recode_values(q30d, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Immigration good for Cdn economy
      # q30g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_055 = recode_values(q30g, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Many refugees not real refugees
      # q30b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_028 = recode_values(q30b, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Do more: cultural identity fr US
      # q14: 1=Do more 2=Do less 3=Do about the same 99=DK/NA
      env_intd_020 = recode_values(q14, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2004-E-2004-1_F1.dta -- Environics, 8 questions
survey(
  survey_id = "cora-efc2004-E-2004-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2004-E-2004-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q95a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q95a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Too little regulation of business
      # q12: 1=Too much 2=Too little, or 3=About right 4=Depends 99=DK/NA
      env_econ_042 = recode_values(q12, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fin dereg: more/fewer choices
      # q16a: 1=More/ Higher/ Greater/Stronger 2=Fewer/ Lower/Less/Weaker 3=Depends 99=DK/NA
      env_econ_047 = recode_values(q16a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Govt intervention vs free market
      # q10: 1=The market should be free and unrestricted 2=Governments should intervene in the market 99=DK/NA
      env_econ_081 = recode_values(q10, 1 ~ 0, 2 ~ 1, 99 ~ NA_real_),

      # Appr prov govt: social programs
      # q95f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q95f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q95i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q95i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q95j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q95j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q95h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q95h, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2004-E-2004-2_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc2004-E-2004-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2004-E-2004-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Willing to restrict cars in cities
      # q102a: 1=Very willing 2=Somewhat willing 3=Not very willing 4=Not at all willing 5=Depends 99=DK/NA
      env_ener_038 = recode_values(q102a, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q119f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q119f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q46: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(q46, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda more/less like US last 10 yrs
      # q53: 1=More like the U.S 2=Less like the U.S 3=No change 99=DK/NA
      env_intd_049 = recode_values(q53, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Cda join US missile defence
      # q54: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_intd_037 = recode_values(q54, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Important: Cda promote world peace
      # q34a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_023 = recode_values(q34a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Opinion of US favourable
      # q51: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_003 = recode_values(q51, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q42: 1=Very favourable 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable 99=DK/NA
      env_intd_011 = recode_values(q42, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda should aid poor countries
      # q34b: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_038 = recode_values(q34b, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda prepared for terrorist attack
      # q31: 1=Very well prepared 2=Somewhat well prepared 3=Not very well prepared 4=Not at all well prepared 99=DK/NA
      env_intd_048 = recode_values(q31, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda spending on poor countries
      # q40: 1=Too much 2=Right Amount 3=Not Enough 99=DK/NA
      env_intd_022 = recode_values(q40, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Terrorist attack in Cda in 2 yrs
      # q30: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 99=DK/NA
      env_intd_041 = recode_values(q30, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Boycott vs trade to promote rights
      # q38: 1=Increase trade links with these countries to try and open 2=Cut back on trade with these countries to try and pressure 98=Other (SPECIF
      env_intd_033 = recode_values(q38, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q119i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q119i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q119j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q119j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q119h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q119h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q119a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q119a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Support prop representation, depends opt
      # q21: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Depends (on type of Proportional Representation) 99=DK/NA
      env_dpin_015 = recode_values(q21, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2004-E-2004-3_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc2004-E-2004-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2004-E-2004-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdns pay too little tax
      # q41: 1=Too much 2=About the right amount 3=Too little 99=DK/NA
      env_econ_077 = recode_values(q41, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Support gay/lesbian couples marrying
      # q48: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      bri_soim_014 = recode_values(q48, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Favour legal marijuana, medical uses
      # q47: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_soim_045 = recode_values(q47, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q98a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q98a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Govt waste important in spending
      # q29: 1=Very important 2=Somewhat important 3=Not very important 99=DK/NA
      env_econ_065 = recode_values(q29, c(1, 2) ~ 1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q21k: 1=More 2=Less 3=Same 99=DK/NA
      env_idim_070 = recode_values(q21k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q21q: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q21q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr cutting federal taxes
      # q28: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_econ_074 = recode_values(q28, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q89r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q89r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q98f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q98f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: enviro protection
      # q21b: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_015 = recode_values(q21b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: energy development
      # q21c: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_037 = recode_values(q21c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: amateur athletes
      # q21v: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_045 = recode_values(q21v, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q21u: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q21u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q21s: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q21s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: homelessness
      # q21t: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_044 = recode_values(q21t, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q21n: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_044 = recode_values(q21n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q98i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q98i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q98j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q98j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q98h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q98h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Approve of homosexuality
      # q49: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 5=Neither approve nor disapprove 99=DK/NA
      env_soim_014 = recode_values(q49, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Govt ban cigarettes in public places
      # q73: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_soim_013 = recode_values(q73, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed spending: arts and culture
      # q21p: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_040 = recode_values(q21p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2004-E-2004-4_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc2004-E-2004-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2004-E-2004-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt reg increases consumer protection
      # q57: 1=Increases 2=Decreases 3=Makes no difference 99=DK/NA
      env_econ_080 = recode_values(q57, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr fed govt: foreign policy
      # q27_1: 1=Approve 2=Disapprove 99=DK/NA
      env_intd_018 = recode_values(q27_1, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Cda join US missile defence
      # q49: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_intd_037 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Opinion of US favourable
      # q43: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_003 = recode_values(q43, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Approve of euthanasia
      # q39: 1=Approve 2=Disapprove 3=Depends 99=DK/NA
      env_soim_032 = recode_values(q39, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Charge crime: assisted suicide
      # q40: 1=Should 2=Should not 3=Depends 99=DK/NA
      env_soim_040 = recode_values(q40, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2005-E-2005-1_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc2005-E-2005-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2005-E-2005-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Concern: water quality
      # q61a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 99=DK/NA
      bri_ener_006 = recode_values(q61a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q97a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q97a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Rich provs give too little
      # q31: 1=Give too much 2=Give too little 3=Give about the right amount 4=Depends 99=DK/NA
      env_hwps_021 = recode_values(q31, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Enviro problems affect own health
      # q60: 1=A great deal 2=A fair amount 3=Not very much, or 4=Not at all 99=DK/NA
      env_ener_040 = recode_values(q60, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Familiar with Kyoto commitments
      # q75: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 99=DK/NA
      env_ener_039 = recode_values(q75, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Neighbourhood pollution trend
      # q59a: 1=Increased 2=Decreased 3=Remained about the same 4=Depends 99=DK/NA
      env_ener_007 = recode_values(q59a, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 99 ~ 9999),

      # Support/oppose Kyoto Accord
      # q76: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_ener_036 = recode_values(q76, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q23p: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q23p, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: deficit reduction
      # q97f: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_075 = recode_values(q97f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q97i: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q97i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: education
      # q97j: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_036 = recode_values(q97j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q97h: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q97h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed govt attention to Quebec: not enough
      # q35: 1=Gives too much attention to Quebec 2=Not enough attention to Quebec 3=Approach to Quebec is about right 99=DK/NA
      env_idim_058 = recode_values(q35, 1 ~ -1, 2 ~ 1, 3 ~ 0, 99 ~ 9999),

      # Economy vs environment priority
      # q66: 1=Economy should take priority over environment 2=Environment should take priority over economic growth 3=Both equally important 99=DK/NA
      bri_ener_005 = recode_values(q66, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2005-E-2005-2_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc2005-E-2005-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2005-E-2005-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q97a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q97a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Access to family physician trend
      # q50a: 1=Better 2=Worse 3=The same 99=DK/NA
      env_hwps_045 = recode_values(q50a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q97f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q97f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Private delivery, tax-funded as now
      # q59: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Neither support/oppose 99=DK/NA
      env_hwps_048 = recode_values(q59, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q97i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q97i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q97j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q97j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Important: speak both off langs
      # q25: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all 99=DK/NA
      env_idim_017 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2005-E-2005-3_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc2005-E-2005-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2005-E-2005-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdns pay too little tax
      # q28: 1=Too much 2=About the right amount 3=Too little 99=DK/NA
      env_econ_077 = recode_values(q28, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q100a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q100a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q17k: 1=More 2=Less 3=Same 99=DK/NA
      env_idim_070 = recode_values(q17k, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q17q: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q17q, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr cutting federal taxes
      # q23: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_econ_074 = recode_values(q23, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Taxes mostly positive or negative
      # q29: 1=Taxes are mostly a positive thing 2=Taxes are mostly a negative thing 3=Both equally true 4=Depends 98=Other [SPECIFY] 99=DK/NA
      env_econ_082 = recode_values(q29, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, c(98, 99) ~ 9999),

      # Appr fed govt: cities issues
      # q81r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q81r, 0 ~ NA_real_, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q100f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q100f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: enviro protection
      # q17b: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_015 = recode_values(q17b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: energy development
      # q17c: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_037 = recode_values(q17c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q17u: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q17u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q17s: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q17s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: homelessness
      # q17t: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_044 = recode_values(q17t, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Cda-US econ relations closer/less
      # q94: 1=Closer economic relations 2=Less close economic relations 3=About the same as now 99=DK/NA
      env_intd_006 = recode_values(q94, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Opinion of US favourable
      # q90: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 5=Neither favour/unfavourable 99=DK/NA
      env_intd_003 = recode_values(q90, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Favourable opinion of US Pres Bush
      # q93: 1=Very favourable 2=Somewhat favourable 3=Somewhat unfavourable 4=Very unfavourable 99=DK/NA
      env_intd_046 = recode_values(q93, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed spending: domestic security
      # q17a: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_050 = recode_values(q17a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q17n: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_044 = recode_values(q17n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q100i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q100i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q100j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q100j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q100h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q100h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Own province independence
      # q34: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_idim_062 = recode_values(q34, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed spending: arts and culture
      # q17p: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_040 = recode_values(q17p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2005-E-2005-4_F1.dta -- Environics, 24 questions
survey(
  survey_id = "cora-efc2005-E-2005-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2005-E-2005-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants not adopting Cdn values
      # q16f: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      bri_idim_013 = recode_values(q16f, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Immigrants take jobs from Cdns
      # q16e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      bri_idim_011 = recode_values(q16e, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Support fed firearms ownership laws
      # q51: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Neither support/oppose 9=DK/NA
      env_soim_050 = recode_values(q51, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q78a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q78a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: social programs
      # q78f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q78f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Ban non-white immigration
      # q16c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_035 = recode_values(q16c, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Cda keeps criminals out well
      # q16d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_intd_032 = recode_values(q16d, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Immigration good for Cdn economy
      # q16g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_055 = recode_values(q16g, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Many refugees not real refugees
      # q16b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_028 = recode_values(q16b, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Appr prov govt: crime/justice
      # q78k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q78k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q78i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q78i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q78j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q78j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q78h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q78h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Confid: lawyers
      # q32e: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 9=DK/NA
      env_soim_051 = recode_values(q32e, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Confid: parole boards
      # q32f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 9=DK/NA
      env_soim_038 = recode_values(q32f, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Confid: RCMP
      # q32d: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 9=DK/NA
      env_soim_047 = recode_values(q32d, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Crime cause: low moral stds
      # q43j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 9=DK/NA
      env_soim_046 = recode_values(q43j, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Crime a problem in community
      # q39: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 9=DK/NA
      env_soim_022 = recode_values(q39, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Familiar w Aboriginal issues
      # q17: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 9=DK/NA
      env_idim_071 = recode_values(q17, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Govts not gone far enough: Aboriginal
      # q23: 1=Gone too far 2=Not gone far enough 3=Expending the right amount of effort 9=DK/NA
      env_idim_072 = recode_values(q23, 1 ~ -1, 2 ~ 1, 3 ~ 0, 9 ~ 9999),

      # Important: settle native land claims
      # q18a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 9=DK/NA
      env_idim_056 = recode_values(q18a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Murder: death penalty vs life
      # q49: 1=Life imprisonment 2=The death penalty 98=Other SPECIFY 99=DK/NA
      env_soim_048 = recode_values(q49, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Serious crime in neighbourhood
      # q40: 1=Yes 2=No 9=DK/NA
      env_soim_039 = recode_values(q40, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Favour capital punishment
      # q48: 1=In favour for certain crimes 2=Opposed under any circumstances 99=DK/NA
      bri_soim_002 = recode_values(q48, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2006-E-2006-1_F1.dta -- Environics, 16 questions
survey(
  survey_id = "cora-efc2006-E-2006-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2006-E-2006-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q81a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q81a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # More power: fed vs prov govts
      # q16: 1=Federal Government should have more powers 2=Provincial governments should have more powers 3=The division of powers should remain 9=DK
      bri_idim_006 = recode_values(q16, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Familiar with Kyoto commitments
      # q46: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 9=DK/NA
      env_ener_039 = recode_values(q46, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Support/oppose Kyoto Accord
      # q47: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 9=DK/NA
      env_ener_036 = recode_values(q47, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr fed govt: cities issues
      # q9r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q9r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q81f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q81f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Private delivery, tax-funded as now
      # q33: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Neither support/oppose 99=DK/NA
      env_hwps_048 = recode_values(q33, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Prov opt out of new natl programs
      # q18: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9=DK/NA
      env_idim_066 = recode_values(q18, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q30: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 9=DK/NA
      env_intd_047 = recode_values(q30, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cda join US missile defence
      # q29: 1=Strongly favour 2=Somewhat favour 3=Somewhat oppose 4=Strongly oppose 9=DK/NA
      env_intd_037 = recode_values(q29, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr prov govt: crime/justice
      # q81k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q81k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q81i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q81i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q81j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q81j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q81h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q81h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Senate: pop-based or equal
      # q78: 1=That there be an equal number of 2=That the number of Senators from each 98=Other (Specify) 99=DK/NA
      env_dpin_004 = recode_values(q78, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Support prop representation, depends opt
      # q70: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Depends (on type of Proportional) 9=DK/NA
      env_dpin_015 = recode_values(q70, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2006-E-2006-2_F1.dta -- Environics, 24 questions
survey(
  survey_id = "cora-efc2006-E-2006-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2006-E-2006-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Willing to restrict cars in cities
      # q75a: 1=Very willing 2=Somewhat willing 3=Not very willing 4=Not at all willing 5=Depends 99=DK/NA
      env_ener_038 = recode_values(q75a, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q97a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q97a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # NAFTA helped/hurt Cdn economy
      # q50: 1=Helped canadian 2=Hurt Canadian economiy 3=Helped and hurt equally 99=DK/NA
      env_econ_070 = recode_values(q50, 1 ~ 1, c(2, 3) ~ 0, 99 ~ 9999),

      # Familiar with Kyoto commitments
      # q68: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 99=DK/NA
      env_ener_039 = recode_values(q68, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Support/oppose Kyoto Accord
      # q69: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 99=DK/NA
      env_ener_036 = recode_values(q69, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q9r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q9r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q97f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q97f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Cda-US common border policy
      # q38a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_intd_042 = recode_values(q38a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Afghan mission likely successful
      # q64: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 5=Depends 99=DK/NA
      env_intd_051 = recode_values(q64, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q61: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(q61, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda more/less like US last 10 yrs
      # q67: 1=More like the U.S. 2=Less like the U.S. 3=No change 99=DK/NA
      env_intd_049 = recode_values(q67, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Important: Cda promote world peace
      # q44a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_023 = recode_values(q44a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q58: 1=Very favourable 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable 99=DK/NA
      env_intd_011 = recode_values(q58, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda should aid poor countries
      # q44b: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_038 = recode_values(q44b, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda prepared for terrorist attack
      # q37: 1=Very well prepared 2=Somewhat well prepared 3=Not very well prepared 4=Not at all well prepared 99=DK/NA
      env_intd_048 = recode_values(q37, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda spending on poor countries
      # q54: 1=Too much 2=Right Amount 3=Not Enough 99=DK/NA
      env_intd_022 = recode_values(q54, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Terrorist attack in Cda in 2 yrs
      # q36: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 99=DK/NA
      env_intd_041 = recode_values(q36, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Canada should improve border security
      # q38d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      bri_intd_010 = recode_values(q38d, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # US security co-op erodes sovrgnty
      # q38e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_intd_052 = recode_values(q38e, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # World more/less peaceful than 5 yrs
      # q34: 1=More peaceful 2=Less peaceful 3=About the same 99=DK/NA
      env_intd_027 = recode_values(q34, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q97k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q97k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q97i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q97i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q97j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q97j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q97h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q97h, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2006-E-2006-3_F1.dta -- Environics, 23 questions
survey(
  survey_id = "cora-efc2006-E-2006-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2006-E-2006-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q11: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9=DK/NA
      env_econ_027 = recode_values(q11, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cdns pay too little tax
      # q45: 1=Too much 2=Right amount 3=Too little 9=DK/NA
      env_econ_077 = recode_values(q45, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q101a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q101a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fiscal imbalance exists or not
      # q39: 1=There IS an imbalance 2=There is NO imbalance 3=Depends/other 9=DK/NA
      env_idim_073 = recode_values(q39, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q31k: 1=More 2=Less 3=Same 9=DK/NA
      env_idim_070 = recode_values(q31k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: employment insurance
      # q31q: 1=More 2=Less 3=Same 9=DK/NA
      env_hwps_041 = recode_values(q31q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Appr cutting federal taxes
      # q40: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 9=DK/NA
      env_econ_074 = recode_values(q40, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Taxes mostly positive or negative
      # q46: 1=Positive 2=Negative 3=Both equally 4=Depends 98=Other 99=DK/NA
      env_econ_082 = recode_values(q46, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, c(98, 99) ~ 9999),

      # Appr fed govt: cities issues
      # q57r: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_047 = recode_values(q57r, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: social programs
      # q101f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q101f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fed spending: enviro protection
      # q31b: 1=More 2=Less 3=Same 9=DK/NA
      env_ener_015 = recode_values(q31b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: energy development
      # q31c: 1=More 2=Less 3=Same 9=DK/NA
      env_ener_037 = recode_values(q31c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: assistance to cities
      # q31u: 1=More 2=Less 3=Same 9=DK/NA
      env_hwps_043 = recode_values(q31u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: reducing child poverty
      # q31s: 1=More 2=Less 3=Same 9=DK/NA
      env_hwps_042 = recode_values(q31s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: homelessness
      # q31t: 1=More 2=Less 3=Same 9=DK/NA
      env_hwps_044 = recode_values(q31t, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q25: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 9=DK/NA
      env_intd_047 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Fed spending: domestic security
      # q31a: 1=More 2=Less 3=Same 9=DK/NA
      env_intd_050 = recode_values(q31a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed spending: foreign aid
      # q31n: 1=More 2=Less 3=Same 9=DK/NA
      env_intd_044 = recode_values(q31n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Appr prov govt: crime/justice
      # q101k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q101k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q101i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q101i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q101j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q101j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q101h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q101h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Fed spending: arts and culture
      # q31p: 1=More 2=Less 3=Same 9=DK/NA
      env_intd_040 = recode_values(q31p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2006-E-2006-4_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc2006-E-2006-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2006-E-2006-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants take jobs from Cdns
      # q19e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      bri_idim_011 = recode_values(q19e, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q82a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q82a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Too little regulation of business
      # q11: 1=Too much 2=Too little 3=About right 4=Depends 9=DK/NA
      env_econ_042 = recode_values(q11, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Corp profits good or bad
      # q14: 1=A good thing 2=A bad thing 3=Neither good nor bad 4=Depends 9=DK/NA
      env_econ_083 = recode_values(q14, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr fed govt: cities issues
      # q21r: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_047 = recode_values(q21r, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: social programs
      # q82f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q82f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Ban non-white immigration
      # q19c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_035 = recode_values(q19c, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Immigration good for Cdn economy
      # q19g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_055 = recode_values(q19g, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Many refugees not real refugees
      # q19b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 9=DK/NA
      env_idim_028 = recode_values(q19b, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 9 ~ 9999),

      # Appr prov govt: crime/justice
      # q82k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q82k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q82i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q82i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q82j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q82j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q82h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q82h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Confid: governments (5-pt)
      # q10c: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=Depends 9=DK/NA
      env_dpin_016 = recode_values(q10c, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2007-E-2007-1_F1.dta -- Environics, 14 questions
survey(
  survey_id = "cora-efc2007-E-2007-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2007-E-2007-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Willing to restrict cars in cities
      # q51a: 1=Very willing 2=Somewhat willing 3=Not very willing 4=Not at all willing 5=Depends 9=DK/NA
      env_ener_038 = recode_values(q51a, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Concern: water quality
      # q45a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 9=DK/NA
      bri_ener_006 = recode_values(q45a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q65a: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_030 = recode_values(q65a, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Enviro problems affect own health
      # q44: 1=A great deal 2=A fair amount 3=Not very much 4=Not at all 99=DK/NA
      env_ener_040 = recode_values(q44, c(1, 2) ~ 1, c(3, 4) ~ 0, c(9, 99) ~ 9999),

      # Neighbourhood pollution trend
      # q43a: 1=Increased 2=Decreased 3=Remained the same 4=Depends 9=DK/NA
      env_ener_007 = recode_values(q43a, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 9 ~ 9999),

      # Support/oppose Kyoto Accord
      # q57: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 9=DK/NA
      env_ener_036 = recode_values(q57, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Appr fed govt: cities issues
      # q21r: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_047 = recode_values(q21r, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: social programs
      # q65f: 1=Approve 2=Disapprove 9=DK/NA
      env_hwps_038 = recode_values(q65f, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: crime/justice
      # q65k: 1=Approve 2=Disapprove 9=DK/NA
      env_soim_049 = recode_values(q65k, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q65i: 1=Approve 2=Disapprove 9=DK/NA
      env_idim_046 = recode_values(q65i, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: ethical govt
      # q65j: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_014 = recode_values(q65j, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Appr prov govt: taxation
      # q65h: 1=Approve 2=Disapprove 9=DK/NA
      env_econ_073 = recode_values(q65h, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Cdn identity: the flag
      # q16a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 9=DK/NA
      env_intd_013 = recode_values(q16a, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Economy vs environment priority
      # q47: 1=Economy should take priority 2=Environment should take priority 3=Both equally important 9=DK/NA
      bri_ener_005 = recode_values(q47, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2007-E-2007-2_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc2007-E-2007-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2007-E-2007-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr fed govt: foreign policy
      # q8_1: 1=Approve 2=Disapprove 9=DK/NA
      env_intd_018 = recode_values(q8_1, 1 ~ 1, 2 ~ 0, 9 ~ 9999),

      # Access to family physician trend
      # q49_1: 1=Better 2=Worse 3=The same 9=DK/NA
      env_hwps_045 = recode_values(q49_1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9 ~ 9999),

      # Fed transfers: catastrophic drug costs
      # q56: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 9=DK/NA
      env_hwps_046 = recode_values(q56, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Health: user fee per visit (2007-12)
      # q55_1: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Depends 6=Neither support/oppose 9=DK/NA
      env_hwps_049 = recode_values(q55_1, c(1, 2) ~ 1, c(3, 4) ~ -1, c(5, 6) ~ 0, 9 ~ 9999),

      # Afghan mission likely successful
      # q39: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 5=Depends 9=DK/NA
      env_intd_051 = recode_values(q39, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 9 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q35: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 9=DK/NA
      env_intd_047 = recode_values(q35, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Cda prepared for terrorist attack
      # q41: 1=Very well prepared 2=Somewhat well prepared 3=Not very well prepared 4=Not at all well prepared 9=DK/NA
      env_intd_048 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Familiar w Aboriginal issues
      # q69: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 9=DK/NA
      env_idim_071 = recode_values(q69, c(1, 2) ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Govts not gone far enough: Aboriginal
      # q71: 1=Gone too far 2=Not gone far enough 3=Expending the right amount of effort 9=DK/NA
      env_idim_072 = recode_values(q71, 1 ~ -1, 2 ~ 1, 3 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2007-E-2007-3_F1.dta -- Environics, 26 questions
survey(
  survey_id = "cora-efc2007-E-2007-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2007-E-2007-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # q79a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q79a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fiscal imbalance exists or not
      # q46: 1=There is a fiscal imbalance 2=There is no fiscal imbalance 3=Depends/other 99=DK/NA
      env_idim_073 = recode_values(q46, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Reduce fed debt important
      # q41: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_econ_076 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q38k: 1=More 2=Less 3=Same 99=DK/NA
      env_idim_070 = recode_values(q38k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q38q: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q38q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr cutting federal taxes
      # q47: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_econ_074 = recode_values(q47, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # More concerned: services vs taxes
      # q43a: 1=Strongly disagree 7=Strongly Agree 99=DK/NA
      env_econ_078 = recode_values(q43a, c(1, 2, 3) ~ -1, 4 ~ 0, c(5, 6, 7) ~ 1, 99 ~ 9999),

      # Tax cuts stimulate growth/revenue
      # q43b: 1=Strongly disagree 7=Strongly Agree 99=DK/NA
      env_econ_079 = recode_values(q43b, c(1, 2, 3) ~ -1, 4 ~ 0, c(5, 6, 7) ~ 1, 99 ~ 9999),

      # Concern: nuclear energy cost
      # q60a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 99=DK/NA
      env_ener_030 = recode_values(q60a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q58r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q58r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q79f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q79f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: enviro protection
      # q38b: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_015 = recode_values(q38b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: energy development
      # q38c: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_037 = recode_values(q38c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: amateur athletes
      # q38w: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_045 = recode_values(q38w, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q38u: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q38u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q38s: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q38s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: homelessness
      # q38t: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_044 = recode_values(q38t, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: coastal sovereignty
      # q38v: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_053 = recode_values(q38v, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: domestic security
      # q38a: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_050 = recode_values(q38a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q38n: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_044 = recode_values(q38n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q79k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q79k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q79i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q79i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q79j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q79j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q79h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q79h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Senate: pop-based or equal
      # q70: 1=Continue to be appointed 2=Elected by the people 98=Other (SPECIFY) 99=DK/NA
      env_dpin_004 = recode_values(q70, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Fed spending: arts and culture
      # q38p: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_040 = recode_values(q38p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2007-E-2007-4_F1.dta -- Environics, 12 questions
survey(
  survey_id = "cora-efc2007-E-2007-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2007-E-2007-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr fed govt: cities issues
      # q57r: 1=Approve 2=Disapprove
      env_hwps_047 = recode_values(q57r, 1 ~ 1, 2 ~ 0),

      # Appr prov govt: social programs
      # q92f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q92f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Afghan mission likely successful
      # q25: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 5=Depends 99=DK/NA
      env_intd_051 = recode_values(q25, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q22: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(q22, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q92k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q92k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q92i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q92i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q92j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q92j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q92h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q92h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q92a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q92a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Confid: local police force
      # q55a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_052 = recode_values(q55a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Murder: death penalty vs life
      # q64: 1=Life imprisonment with no possibility of parole 2=The death penalty 3=Other 99=DK/NA
      env_soim_048 = recode_values(q64, 1 ~ 0, 2 ~ 1, c(3, 99) ~ 9999),

      # Favour capital punishment
      # q63: 1=In favour for certain crimes 2=Opposed under any circumstance 99=DK/NA
      bri_soim_002 = recode_values(q63, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2008-E-2008-1_F1.dta -- Environics, 19 questions
survey(
  survey_id = "cora-efc2008-E-2008-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2008-E-2008-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants take jobs from Cdns
      # q55e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_011 = recode_values(q55e, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Govt reg increases consumer protection
      # q20: 1=Increases 2=Decreases 3=Makes no difference 99=DK/NA
      env_econ_080 = recode_values(q20, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q8r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q8r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q78f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q78f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Afghan mission likely successful
      # q59: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 5=Depends 99=DK/NA
      env_intd_051 = recode_values(q59, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q56: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(q56, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Ban non-white immigration
      # q55c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_035 = recode_values(q55c, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Immigration good for Cdn economy
      # q55g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_055 = recode_values(q55g, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Many refugees not real refugees
      # q55b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_028 = recode_values(q55b, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q78k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q78k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q78i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q78i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q78j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q78j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q78h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q78h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q78a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q78a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Confid: lawyers
      # q60e: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_051 = recode_values(q60e, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Confid: parole boards
      # q60f: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_038 = recode_values(q60f, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Crime cause: lack school disc
      # q70a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_soim_041 = recode_values(q70a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Crime cause: low moral stds
      # q70j: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_soim_046 = recode_values(q70j, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Serious crime in neighbourhood
      # q67: 1=Yes 2=No 99=DK/NA
      env_soim_039 = recode_values(q67, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2008-E-2008-2_F1.dta -- Environics, 18 questions
survey(
  survey_id = "cora-efc2008-E-2008-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2008-E-2008-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # NAFTA helped/hurt Cdn economy
      # q47: 1=Helped Canadian economy 2=Hurt Canadian economy 3=Helped and hurt equally 99=DK/NA
      env_econ_070 = recode_values(q47, 1 ~ 1, c(2, 3) ~ 0, 99 ~ 9999),

      # Appr exporting bulk fresh water
      # q52: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_ener_035 = recode_values(q52, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr fed govt: cities issues
      # q12r: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_047 = recode_values(q12r, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # q64f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q64f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Cda-US common border policy
      # q42a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_intd_042 = recode_values(q42a, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # q60: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(q60, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Favourable opinion of Cdn Forces
      # q55: 1=Very favourable 2=Somewhat favourable 3=Not very favourable 4=Not at all favourable 99=DK/NA
      env_intd_011 = recode_values(q55, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda prepared for terrorist attack
      # q41: 1=Very well prepared 2=Somewhat well prepared 3=Not very well prepared 4=Not at all well prepared 99=DK/NA
      env_intd_048 = recode_values(q41, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cda spending on poor countries
      # q53: 1=Too much 2=Right amount 3=Not Enough 99=DK/NA
      env_intd_022 = recode_values(q53, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Terrorist attack in Cda in 2 yrs
      # q40: 1=Very likely 2=Somewhat likely 3=Not very likely 4=Not at all likely 99=DK/NA
      env_intd_041 = recode_values(q40, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Canada should improve border security
      # q42d: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      bri_intd_010 = recode_values(q42d, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # US security co-op erodes sovrgnty
      # q42e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_intd_052 = recode_values(q42e, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # World more/less peaceful than 5 yrs
      # q39: 1=More peaceful 2=Less peaceful 3=About the same 99=DK/NA
      env_intd_027 = recode_values(q39, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q64k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q64k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q64i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q64i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q64j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q64j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q64h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q64h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q64a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q64a, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2008-E-2008-3_F1.dta -- Environics, 21 questions
survey(
  survey_id = "cora-efc2008-E-2008-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2008-E-2008-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q10: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_econ_027 = recode_values(q10, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cdns pay too little tax
      # q38: 1=Too much 2=About the right amount 3=Too little 99=DK/NA
      env_econ_077 = recode_values(q38, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q59a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q59a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fiscal imbalance exists or not
      # q35: 1=There is a fiscal imbalance 2=There is no fiscal imbalance 3=Depends/Other 99=DK/NA
      env_idim_073 = recode_values(q35, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Reduce fed debt important
      # q30: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_econ_076 = recode_values(q30, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q27k: 1=More 2=Less 3=Same 99=DK/NA
      env_idim_070 = recode_values(q27k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q27q: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q27q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr cutting federal taxes
      # q36: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_econ_074 = recode_values(q36, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Taxes mostly positive or negative
      # q39: 1=Taxes are mostly a positive thing 2=Taxes are mostly a negative thing 3=Both equally true 4=Depends 98=OTHER (SPECIFY) 99=DK/NA
      env_econ_082 = recode_values(q39, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, c(98, 99) ~ 9999),

      # Appr prov govt: social programs
      # q59f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q59f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: enviro protection
      # q27b: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_015 = recode_values(q27b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: energy development
      # q27c: 1=More 2=Less 3=Same 99=DK/NA
      env_ener_037 = recode_values(q27c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q27u: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q27u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q27s: 1=More 2=Less 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q27s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: coastal sovereignty
      # q27v: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_053 = recode_values(q27v, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q27n: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_044 = recode_values(q27n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q59k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q59k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q59i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q59i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q59j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q59j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q59h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q59h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Fed spending: arts and culture
      # q27p: 1=More 2=Less 3=Same 99=DK/NA
      env_intd_040 = recode_values(q27p, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2008-E-2008-4_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc2008-E-2008-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2008-E-2008-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: social programs
      # q30f: 1=Approve 2=Disapprove
      env_hwps_038 = recode_values(q30f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q30k: 1=Approve 2=Disapprove
      env_soim_049 = recode_values(q30k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q30i: 1=Approve 2=Disapprove
      env_idim_046 = recode_values(q30i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q30j: 1=Approve 2=Disapprove
      env_dpin_014 = recode_values(q30j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q30h: 1=Approve 2=Disapprove
      env_econ_073 = recode_values(q30h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q30a: 1=Approve 2=Disapprove
      env_idim_030 = recode_values(q30a, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2009-E-2009-1_F1.dta -- Environics, 9 questions
survey(
  survey_id = "cora-efc2009-E-2009-1_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2009-E-2009-1_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Too little regulation of business
      # q11: 1=Too much 2=Too little, or 3=About right 4=Depends 9=DK/NA
      env_econ_042 = recode_values(q11, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 9 ~ 9999),

      # Govt intervention vs free market
      # q10: 1=The market serves the best interests of society [] 2=The government should intervene in the market to ensure [] 99=DK/NA
      env_econ_081 = recode_values(q10, 1 ~ 0, 2 ~ 1, 99 ~ NA_real_),

      # Appr prov govt: social programs
      # q38f: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(q38f, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # q38k: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(q38k, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # q38i: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(q38i, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # q38j: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(q38j, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # q38h: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(q38h, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: fed-prov relations
      # q38a: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(q38a, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Confid: governments (5-pt)
      # q9c: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 5=Depends 99=DK/NA
      env_dpin_016 = recode_values(q9c, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2009-E-2009-2_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc2009-E-2009-2_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2009-E-2009-2_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: social programs
      # Q27F: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(Q27F, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Cda spending on poor countries
      # Q18: 1=Too much 2=Right Amount 3=Not enough 99=DK/NA
      env_intd_022 = recode_values(Q18, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # Q27K: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(Q27K, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # Q27I: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(Q27I, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # Q27J: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(Q27J, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # Q27H: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(Q27H, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr fed govt: foreign policy
      # Q16A: 1=Approve 2=Disapprove 99=DK/NA
      env_intd_018 = recode_values(Q16A, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2009-E-2009-3_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc2009-E-2009-3_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2009-E-2009-3_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Cdns pay too little tax
      # Q10: 1=Too much 2=About the right amount 3=Too little 99=DK/NA
      env_econ_077 = recode_values(Q10, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Appr prov govt: social programs
      # Q21F: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(Q21F, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr Cdn military action Afghanistan
      # Q12: 1=Strongly approve 2=Somewhat approve 3=Somewhat disapprove 4=Strongly disapprove 99=DK/NA
      env_intd_047 = recode_values(Q12, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # Q21K: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(Q21K, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # Q21I: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(Q21I, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # Q21J: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(Q21J, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # Q21H: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(Q21H, 1 ~ 1, 2 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2009-E-2009-4_F1.dta -- Environics, 7 questions
survey(
  survey_id = "cora-efc2009-E-2009-4_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2009-E-2009-4_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Appr prov govt: fed-prov relations
      # Q21A: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_030 = recode_values(Q21A, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: social programs
      # Q21F: 1=Approve 2=Disapprove 99=DK/NA
      env_hwps_038 = recode_values(Q21F, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: crime/justice
      # Q21K: 1=Approve 2=Disapprove 99=DK/NA
      env_soim_049 = recode_values(Q21K, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: Indigenous affairs
      # Q21I: 1=Approve 2=Disapprove 99=DK/NA
      env_idim_046 = recode_values(Q21I, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: ethical govt
      # Q21J: 1=Approve 2=Disapprove 99=DK/NA
      env_dpin_014 = recode_values(Q21J, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr prov govt: taxation
      # Q21H: 1=Approve 2=Disapprove 99=DK/NA
      env_econ_073 = recode_values(Q21H, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Appr premier handling job
      # Q21: 1=Approve 2=Disapprove 9=DK/NA
      env_dpin_011 = recode_values(Q21, 1 ~ 1, 2 ~ 0, 9 ~ 9999)
    )
  }
)

# cora-efc2010-E-2010_F1.dta -- Environics, 28 questions
survey(
  survey_id = "cora-efc2010-E-2010_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2010-E-2010_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Govt should reduce rich-poor gap
      # q12: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_econ_027 = recode_values(q12, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Immigrants take jobs from Cdns
      # q53e: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_011 = recode_values(q53e, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, c(9, 99) ~ 9999),

      # Support fed firearms ownership laws
      # q61a: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Neither/nor 99=DK/NA
      env_soim_050 = recode_values(q61a, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999),

      # Fed spending: Aboriginal peoples
      # q35k: 1=More 2=Less' 3=Same 99=DK/NA
      env_idim_070 = recode_values(q35k, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: employment insurance
      # q35q: 1=More 2=Less' 3=Same 99=DK/NA
      env_hwps_041 = recode_values(q35q, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Taxes mostly positive or negative
      # q10: 1=Mostly a positive thing 2=Mostly a negative thing 3=Both equally true 4=Depends 98=Other 99=DK/NA
      env_econ_082 = recode_values(q10, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, c(98, 99) ~ 9999),

      # Health problems: mgmt vs funding
      # q43: 1=Not enough funding for the system 2=Inefficient management of the system 98=Other 99=DK/NA
      env_hwps_050 = recode_values(q43, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Fed spending: enviro protection
      # q35b: 1=More 2=Less' 3=Same 99=DK/NA
      env_ener_015 = recode_values(q35b, 0 ~ NA_real_, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: energy development
      # q35c: 1=More 2=Less' 3=Same 99=DK/NA
      env_ener_037 = recode_values(q35c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: assistance to cities
      # q35u: 1=More 2=Less' 3=Same 99=DK/NA
      env_hwps_043 = recode_values(q35u, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: reducing child poverty
      # q35s: 1=More 2=Less' 3=Same 99=DK/NA
      env_hwps_042 = recode_values(q35s, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Ban non-white immigration
      # q53c: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_035 = recode_values(q53c, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, c(9, 99) ~ 9999),

      # Cda more/less like US last 10 yrs
      # q73: 1=More like the U.S. 2=Less like the U.S. 3=No change 99=DK/NA
      env_intd_049 = recode_values(q73, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Immigration good for Cdn economy
      # q53g: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_055 = recode_values(q53g, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, c(9, 99) ~ 9999),

      # Many refugees not real refugees
      # q53b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_028 = recode_values(q53b, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, c(9, 99) ~ 9999),

      # Cda spending on poor countries
      # q70: 1=Too much 2=Right amount 3=Not enough 99=DK/NA
      env_intd_022 = recode_values(q70, 1 ~ -1, 2 ~ 0, 3 ~ 1, 99 ~ 9999),

      # Fed spending: coastal sovereignty
      # q35v: 1=More 2=Less' 3=Same 99=DK/NA
      env_intd_053 = recode_values(q35v, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: domestic security
      # q35a: 1=More 2=Less' 3=Same 99=DK/NA
      env_intd_050 = recode_values(q35a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Fed spending: foreign aid
      # q35n: 1=More 2=Less' 3=Same 99=DK/NA
      env_intd_044 = recode_values(q35n, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Confid: local police force
      # q62a: 1=A lot of confidence 2=Some confidence 3=Little confidence 4=No confidence at all 99=DK/NA
      env_soim_052 = recode_values(q62a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(9, 99) ~ 9999),

      # Familiar w Aboriginal issues
      # q49: 1=Very familiar 2=Somewhat familiar 3=Not very familiar 4=Not at all familiar 99=DK/NA
      env_idim_071 = recode_values(q49, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cdn identity: the flag
      # q20a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_013 = recode_values(q20a, 0 ~ NA_real_, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Important: settle native land claims
      # q50a: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_idim_056 = recode_values(q50a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(9, 99) ~ 9999),

      # Ethnic groups should blend in
      # q55a: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      env_idim_043 = recode_values(q55a, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_, c(9, 99) ~ 9999),

      # Harder for non-whites to succeed
      # q55b: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      bri_idim_012 = recode_values(q55b, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ NA_real_, c(9, 99) ~ 9999),

      # Serious crime in neighbourhood
      # q59: 1=Yes 2=No 99=DK/NA
      env_soim_039 = recode_values(q59, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Favour capital punishment
      # q63: 1=In favour for certain crimes 2=Opposed under any circumstance 99=DK/NA
      bri_soim_002 = recode_values(q63, 1 ~ 1, 2 ~ 0, 99 ~ 9999),

      # Support prop representation, depends opt
      # q34: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Depends on type of Proportional Representation 99=DK/NA
      env_dpin_015 = recode_values(q34, c(1, 2) ~ 1, c(3, 4) ~ -1, 5 ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2011-E-2011_F1.dta -- Environics, 6 questions
survey(
  survey_id = "cora-efc2011-E-2011_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2011-E-2011_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants take jobs from Cdns
      # Q29E: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_011 = recode_values(Q29E, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Too little regulation of business
      # Q16: 1=Too much 2=Too little, or 3=About right 4=Depends 99=DK/NA
      env_econ_042 = recode_values(Q16, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Corp profits good or bad
      # Q17: 1=A good thing 2=A bad thing 3=Neither good nor bad 4=Depends 99=DK/NA
      env_econ_083 = recode_values(Q17, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 0, 99 ~ 9999),

      # NAFTA helped/hurt Cdn economy
      # Q46: 1=Helped Canadian economy 2=Hurt Canadian economy 3=Helped and hurt equally 99=DK/NA
      env_econ_070 = recode_values(Q46, 1 ~ 1, c(2, 3) ~ 0, 99 ~ 9999),

      # Immigration good for Cdn economy
      # Q29G: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_055 = recode_values(Q29G, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Many refugees not real refugees
      # Q29B: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_028 = recode_values(Q29B, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999)
    )
  }
)

# cora-efc2012-E-2012_F1.dta -- Environics, 11 questions
survey(
  survey_id = "cora-efc2012-E-2012_F1.dta",
  source    = "Environics",
  file_name = "cora-efc2012-E-2012_F1.dta",
  recode = function(d) {
    d %>% transmute(
      # Immigrants take jobs from Cdns
      # Q35E: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      bri_idim_011 = recode_values(Q35E, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Urban/rural Cdns same values
      # Q16B: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 99=DK/NA
      bri_intd_012 = recode_values(Q16B, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Financially better off than parents
      # Q6: 1=Better off 2=Worse off 3=About the same 99=DK/NA
      env_econ_062 = recode_values(Q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 99 ~ 9999),

      # Rich provs give too little
      # Q32: 1=Give too much 2=Give too little 3=Give about the right amount 4=Depends 99=DK/NA
      env_hwps_021 = recode_values(Q32, 1 ~ -1, 2 ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Health problems: mgmt vs funding
      # Q39: 1=Not enough funding for the system 2=Inefficient management of the system 98=Other 99=DK/NA
      env_hwps_050 = recode_values(Q39, 1 ~ 0, 2 ~ 1, c(98, 99) ~ 9999),

      # Health: user fee per visit (2007-12)
      # Q41A: 1=Strongly support 2=Somewhat support 3=Somewhat oppose 4=Strongly oppose 5=Depends 6=Neither support/oppose 99=DK/NA
      env_hwps_049 = recode_values(Q41A, c(1, 2) ~ 1, c(3, 4) ~ -1, c(5, 6) ~ 0, 99 ~ 9999),

      # Immigration good for Cdn economy
      # Q35G: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_055 = recode_values(Q35G, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # Many refugees not real refugees
      # Q35B: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 5=Neither agree/disagree 99=DK/NA
      env_idim_028 = recode_values(Q35B, c(1, 2) ~ 1, c(3, 4, 5) ~ 0, 99 ~ 9999),

      # French in QC secure
      # Q26: 1=Very secure 2=Somewhat secure 3=Not very secure 4=Not at all secure 99=DK/NA
      env_idim_067 = recode_values(Q26, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # French outside QC secure
      # Q27: 1=Very secure 2=Somewhat secure 3=Not very secure 4=Not at all secure 99=DK/NA
      env_idim_068 = recode_values(Q27, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999),

      # Cdn identity: the flag
      # Q17A: 1=Very important 2=Somewhat important 3=Not very important 4=Not at all important 99=DK/NA
      env_intd_013 = recode_values(Q17A, c(1, 2) ~ 1, c(3, 4) ~ 0, 99 ~ 9999)
    )
  }
)
