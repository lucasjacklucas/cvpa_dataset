###############################################################################
# Gallup  -  Canadian Institute of Public Opinion polls
# 287 survey blocks, oldest first. One block per survey, per wave for panel
# files. Edit a recode_values() arm to change a coding; add a line to add a
# variable.
###############################################################################

# cipo-187-E-1949-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-187-E-1949-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-187-E-1949-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt should own and operate banks
      # q8a: 0=NOT STATED 1=SHOULD OWN 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_001 = recode_values(q8a, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cdn govt should own/operate CPR
      # q8b: 0=NOT STATED 1=SHOULD OWN 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_002 = recode_values(q8b, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-188-E-1949-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-188-E-1949-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-188-E-1949-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt should own and operate banks
      # q8a: 0=NOT STATED 1=SHOULD OWN 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_001 = recode_values(q8a, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cdn govt should own/operate CPR
      # q8b: 0=NOT STATED 1=SHOULD OWN 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_002 = recode_values(q8b, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-191-E-1949-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-191-E-1949-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-191-E-1949-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Allow corporal punishment in schools
      # q5: 0=NOT STATED 1=YES 2=NO 3=UNDECIDED
      gal_soim_001 = recode_values(q5, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-213-E-1951-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-213-E-1951-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-213-E-1951-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt should own and operate banks
      # q4d: 0=NOT STATED 1=SHOULD 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_001 = recode_values(q4d, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Cdn govt should own/operate CPR
      # q4b: 0=NOT STATED 1=SHOULD 2=SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      gal_econ_002 = recode_values(q4b, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-239-E-1954-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-239-E-1954-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-239-E-1954-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Teachers paid too little
      # q13a: 0=NOT STATED 1=TOO MUCH 2=TOO LITTLE 3=ABOUT RIGHT 4=NO OPINION
      bri_hwps_001 = recode_values(q13a, 0 ~ 9999, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-241-E-1955-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-241-E-1955-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-241-E-1955-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Larger/smaller Cdn population
      # q2a: 0=NOT STATED 1=SMALLER 2=LARGER 3=ABOUT RIGHT 4=NO OPINION
      gal_idim_001 = recode_values(q2a, 0 ~ 9999, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Compulsory military training at 18
      # q8: 0=NOT STATED 1=WOULD FAVOUR 2=WOULD NOT FAVOUR 3=NO OPINION
      bri_intd_001 = recode_values(q8, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-248-E-1956-05_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-248-E-1956-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-248-E-1956-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # US capital in Cda: enough or more
      # q15b: 0=NOT STATED 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW
      gal_econ_003 = recode_values(q15b, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-251-E-1956-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-251-E-1956-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-251-E-1956-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military training at 18
      # q14: 0=NOT STATED 1=WOULD FAVOUR 2=WOULD NOT FAVOUR 3=NO OPINION 5=WILD CODE 6=WILD CODE
      bri_intd_001 = recode_values(q14, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 5, 6) ~ 9999)
    )
  }
)

# cipo-254-E-1956-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-254-E-1956-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-254-E-1956-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Personal rights protected or in danger
      # q12a: 1=FULLY PROTECTED 2=IN DANGER 3=NO OPINION
      bri_soim_001 = recode_values(q12a, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-263-E-1957-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-263-E-1957-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-263-E-1957-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfied w/ Cdn defence policy
      # q11a: 0=NOT STATED 1=SATISFIED 2=NEED A NEW LOOK 3=NO OPINION
      gal_intd_001 = recode_values(q11a, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-268-E-1958-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-268-E-1958-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-268-E-1958-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour capital punishment
      # q3: 0=NOT STATED 1=SHOULD ABOLISH 2=SHOULD NOT 3=NO OPINION
      bri_soim_002 = recode_values(q3, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-270-E-1958-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-270-E-1958-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-270-E-1958-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Lower voting age to 18
      # q6a: 0=NOT STATED 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=UNDECIDED 6=WILD CODE
      gal_dpin_001 = recode_values(q6a, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 6) ~ 9999)
    )
  }
)

# cipo-274-E-1959-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-274-E-1959-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-274-E-1959-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfied w/ Cdn defence policy
      # q16a: 1=SATISFIED 2=NEED NEW LOOK 3=NO OPINION
      gal_intd_001 = recode_values(q16a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-275-E-1959-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-275-E-1959-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-275-E-1959-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # US capital in Cda: enough or more
      # q18b: 0=NOT STATED 1=ENOUGH NOW 2=LIKE MORE 3=DON'T KNOW
      gal_econ_003 = recode_values(q18b, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Recognize Communist China govt
      # q15a: 1=YES 2=NO 3=NO OPINION
      gal_intd_002 = recode_values(q15a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-280-E-1960-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-280-E-1960-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-280-E-1960-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour capital punishment
      # q9: 1=YES 2=NO 3=DON'T KNOW
      bri_soim_002 = recode_values(q9, 1 ~ 0, 2 ~ 1, 3 ~ 9999),

      # Satisfied w/ Cdn defence policy
      # q11a: 1=SATISFIED 2=NEED NEW LOOK 3=DON'T KNOW
      gal_intd_001 = recode_values(q11a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-286-E-1961-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-286-E-1961-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-286-E-1961-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt should own banks
      # q2d: 1=YES 2=NO 3=NO OPINION
      bri_econ_001 = recode_values(q2d, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # US capital in Cda: enough or more
      # q5: 0=NOT STATED 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW
      gal_econ_003 = recode_values(q5, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-288-E-1961-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-288-E-1961-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-288-E-1961-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # English compulsory in French schools
      # q6b: 1=YES 2=NO 3=NO OPINION
      gal_idim_002 = recode_values(q6b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # French compulsory in English schools
      # q6a: 1=YES 2=NO 3=NO OPINION
      gal_idim_003 = recode_values(q6a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-290-E-1961-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-290-E-1961-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-290-E-1961-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Senate: abolish vs elect vs keep
      # q11: 1=CONTINUE AS IS 2=ELECT SENATORS 3=DO AWAY W/ SENATE 4=UNDECIDED
      gal_dpin_002 = recode_values(q11, 1 ~ 0, 2 ~ 1, 3 ~ 2, 4 ~ 9999)
    )
  }
)

# cipo-291-E-1961-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-291-E-1961-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-291-E-1961-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Union laws too strict/not enough
      # q6b: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=NO OPINION
      gal_econ_004 = recode_values(q6b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-297-E-1962-06-b_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-297-E-1962-06-b_F1.tab",
  source    = "Gallup",
  file_name = "cipo-297-E-1962-06-b_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfied w/ Cdn defence policy
      # q4: 0=NOT STATED 1=SATISFIED 2=DISSATISFIED 3=NO OPINION
      gal_intd_001 = recode_values(q4, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-298-E-1962-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-298-E-1962-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-298-E-1962-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price freeze
      # q10: 1=FAVOUR 2=OPPOSE 3=QUALIFIED 4=NO OPINION
      gal_econ_005 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-299-E-1962-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-299-E-1962-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-299-E-1962-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Workers should have right to strike
      # q13a: 1=YES. 2=NO. 3=NO OPINION.
      bri_hwps_002 = recode_values(q13a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-302-E-1963-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-302-E-1963-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-302-E-1963-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfied w/ Cdn defence policy
      # q12: 0=NOT STATED 1=SATISFIED 2=DISSATISFIED 3=NO OPINION
      gal_intd_001 = recode_values(q12, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-303-E-1963-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-303-E-1963-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-303-E-1963-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada better/worse off w free trade
      # q12: 1=CANADA BETTER OFF 2=CANADA WORSE OFF 3=NO OPINION
      gal_econ_006 = recode_values(q12, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-304-E-1963-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-304-E-1963-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-304-E-1963-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Larger/smaller Cdn population
      # q4: 1=YES 2=NO 3=QUALIFIED 4=CAN'T SAY
      gal_idim_001 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-305-E-1963-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-305-E-1963-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-305-E-1963-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # US capital in Cda: enough or more
      # q14: 0=NOT STATED 1=ENOUGH NOW 2=NEED MORE 3=UNDECIDED
      gal_econ_003 = recode_values(q14, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-306-E-1964-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-306-E-1964-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-306-E-1964-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Recognize Communist China govt
      # q7: 1=YES SHOULD RECOGNIZE 2=NO SHOULD NOT 3=NO OPINION
      gal_intd_002 = recode_values(q7, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Sex education in schools
      # q13: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=NO OPINION
      gal_soim_003 = recode_values(q13, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-307-E-1964-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-307-E-1964-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-307-E-1964-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Ban cigarette advertising
      # q12: 1=AGREE 2=DISAGREE 3=NO OPINION
      gal_soim_002 = recode_values(q12, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-308-E-1964-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-308-E-1964-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-308-E-1964-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada become part of US
      # q3: 1=JOIN U.S.A. 2=REMAIN INDEPENDENT 3=QUALIFIED 4=UNDECIDED
      bri_intd_002 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-310-E-1965-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-310-E-1965-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-310-E-1965-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Want larger Cdn population
      # q8: 1=LARGER POPULATION 2=JUST ABOUT RIGHT 3=UNDECIDED
      bri_idim_001 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favour capital punishment
      # q2: 1=SHOULD 2=SHOULDN'T 3=NO OPINION
      bri_soim_002 = recode_values(q2, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-312-E-1965-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-312-E-1965-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-312-E-1965-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # English compulsory in French schools
      # q11: 1=YES 2=NO 3=NO OPINION
      gal_idim_002 = recode_values(q11, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # French compulsory in English schools
      # q10: 1=YES 2=NO 3=NO OPINION
      gal_idim_003 = recode_values(q10, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-313-E-1965-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-313-E-1965-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-313-E-1965-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Allow corporal punishment in schools
      # q1a: 1=YES 2=NO 3=CAN'T SAY
      gal_soim_001 = recode_values(q1a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-314-E-1965-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-314-E-1965-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-314-E-1965-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Farmers get square deal from fed govt
      # q12: 1=FAIR 2=NOT FAIR 3=NO OPINION 99=INAPPLICABLE
      gal_econ_007 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999)
    )
  }
)

# cipo-318-E-1966-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-318-E-1966-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-318-E-1966-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Union laws too strict/not enough
      # q7a: 1=TOO STRICT 2=ABOUT RIGHT 3=NOT STRICT ENOUGH 4=UNDECIDED
      gal_econ_004 = recode_values(q7a, 1 ~ 1, 2 ~ 0, 3 ~ -1, 4 ~ 9999)
    )
  }
)

# cipo-319-E-1966-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-319-E-1966-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-319-E-1966-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Personal rights protected or in danger
      # q9a: 1=YES 2=NO, IN DANGER 3=NO OPINION
      bri_soim_001 = recode_values(q9a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Lower voting age to 18
      # q1a: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=UNDECIDED
      gal_dpin_001 = recode_values(q1a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-321-E-1966-10_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-321-E-1966-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-321-E-1966-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price freeze
      # q3: 1=YES 2=NO 3=NO OPINION
      gal_econ_005 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 9999),

      # Recognize Communist China govt
      # q13: 1=YES 2=NO 3=NO OPINION
      gal_intd_002 = recode_values(q13, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-322-E-1967-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-322-E-1967-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-322-E-1967-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement at 65 good idea
      # q6: 1=GOOD IDEA 2=NOT GOOD IDEA 3=CAN'T SAY
      bri_hwps_003 = recode_values(q6, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-323-E-1967-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-323-E-1967-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-323-E-1967-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # US capital in Cda: enough or more
      # q14: 0=NOT STATED 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW
      gal_econ_003 = recode_values(q14, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-326-E-1967-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-326-E-1967-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-326-E-1967-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Strength of separatism in Quebec
      # q5: 1=VERY STRONG 2=FAIRLY STRONG 3=NOT VERY STRONG 4=CAN'T SAY
      gal_idim_004 = recode_values(q5, 1 ~ 1, 2 ~ 0, 3 ~ -1, 4 ~ 9999)
    )
  }
)

# cipo-327-E-1968-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-327-E-1968-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-327-E-1968-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt treats Indigenous well/badly
      # q14: 1=WELL TREATED 2=BADLY TREATED 3=FAIRLY TREATED 4=CAN'T SAY
      bri_idim_003 = recode_values(q14, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Canada better/worse off w free trade
      # q11: 1=CANADA BETTER OFF 2=WORSE OFF 3=CAN'T SAY
      gal_econ_006 = recode_values(q11, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-328-E-1968-05_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-328-E-1968-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-328-E-1968-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Doctors may end life: mercy killing
      # q10: 1=YES 2=NO 3=QUALIFIED 4=CAN'T SAY
      bri_soim_003 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-331-E-1968-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-331-E-1968-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-331-E-1968-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Keep Queen/King vs republic
      # q6: 0=NOT STATED 1=LOYAL TO QUEEN 2=BE REPUBLIC 3=CAN'T SAY
      gal_intd_003 = recode_values(q6, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-333-E-1969-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-333-E-1969-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-333-E-1969-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Want larger Cdn population
      # q7: 1=LARGER POPULATION 2=ABOUT RIGHT 3=CAN'T SAY
      bri_idim_001 = recode_values(q7, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-334-E-1969-03_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-334-E-1969-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-334-E-1969-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Recognize Communist China govt
      # q11: 1=YES 2=NO 3=NO OPINION
      gal_intd_002 = recode_values(q11, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Courts harsh on criminals
      # q13: 1=NOT HARSHLY ENOUGH 2=ABOUT RIGHT 3=TOO HARSHLY 4=NO OPINION 5=WILD CODE
      gal_soim_004 = recode_values(q13, 1 ~ -1, 2 ~ 0, 3 ~ 1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-338-E-1969-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-338-E-1969-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-338-E-1969-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Lower voting age to 18
      # q6: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=UNDECIDED
      gal_dpin_001 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-339-E-1970-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-339-E-1970-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-339-E-1970-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price freeze
      # q3: 1=GOOD IDEA 2=POOR IDEA 3=CAN'T SAY
      gal_econ_005 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 9999)
    )
  }
)

# cipo-341-E-1970-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-341-E-1970-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-341-E-1970-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q2: 0=NOT STATED 1=TOO HIGH 2=ABOUT RIGHT 3=CAN'T SAY
      gal_econ_009 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Farmers get square deal from fed govt
      # q9: 1=YES 2=NO 3=NO OPINION
      gal_econ_007 = recode_values(q9, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-342-E-1970-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-342-E-1970-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-342-E-1970-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Union laws too strict/not enough
      # q7: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=UNDECIDED
      gal_econ_004 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Keep Queen/King vs republic
      # q1: 1=ACCEPT KING CHARLES 2=BECOME A REPUBLIC 3=NO OPINION
      gal_intd_003 = recode_values(q1, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-343-E-1970-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-343-E-1970-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-343-E-1970-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Buy back 51% control of US firms
      # q11b: 0=NOT STATED 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=UNDECIDED
      gal_econ_008 = recode_values(q11b, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # US capital in Cda: enough or more
      # q11a: 0=NOT STATED 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW
      gal_econ_003 = recode_values(q11a, 0 ~ 9999, 1 ~ 0, 2 ~ 1, 3 ~ 9999)
    )
  }
)

# cipo-345-E-1971-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-345-E-1971-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-345-E-1971-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # q17: 1=LESS INFLATION 2=LESS UNEMPLOYMENT 3=CAN'T SAY
      gal_econ_010 = recode_values(q17, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Education costs in prov too high
      # q4a: 1=TOO HIGH 2=TOO LOW 3=ABOUT RIGHT 4=CAN'T SAY
      gal_hwps_001 = recode_values(q4a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-346-E-1971-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-346-E-1971-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-346-E-1971-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Quebec right to separate
      # q13: 1=YES 2=NO 3=UNDECIDED
      gal_idim_005 = recode_values(q13, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-350-E-1971-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-350-E-1971-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-350-E-1971-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Vote for reinstating death penalty
      # q7a: 1=YES 2=NO 3=UNDECIDED
      bri_soim_004 = recode_values(q7a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-355-E-1972-009_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-355-E-1972-009_F1.tab",
  source    = "Gallup",
  file_name = "cipo-355-E-1972-009_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion if woman's health in danger
      # q6b: 0=INAPPLICABLE 1=YES 2=NO 3=NOT SURE
      gal_soim_005 = recode_values(q6b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # More power to provs, less to fed
      # q14a: 1=APPROVE 2=DISAPPROVE 3=UNDECIDED
      gal_idim_006 = recode_values(q14a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-358-E-1973-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-358-E-1973-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-358-E-1973-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price controls
      # q5a: 1=WAGE\PRICE FREEZE 2=OTHER MEASURES 3=CAN'T SAY 99=NOT STATED
      gal_econ_011 = recode_values(q5a, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999)
    )
  }
)

# cipo-360-E-1973-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-360-E-1973-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-360-E-1973-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 0=NOT STATED 1=HANDLING PROPERLY 2=ARE NOT 3=DON'T KNOW
      bri_econ_002 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-364-E-1974-03_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-364-E-1974-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-364-E-1974-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Workers should have right to strike
      # q17a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED
      bri_hwps_002 = recode_values(q17a, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Essential services right to strike
      # q17b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED
      gal_hwps_002 = recode_values(q17b, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Energy crisis in Canada exists
      # q6a: 0=NOT STATED 1=YES 2=NO 3=DON'T KNOW
      gal_ener_001 = recode_values(q6a, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Public school discipline too strict
      # q12a: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CAN'T SAY
      gal_hwps_003 = recode_values(q12a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # High school discipline too strict
      # q12b: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CAN'T SAY
      gal_hwps_004 = recode_values(q12b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Courts harsh on criminals
      # q16: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW
      gal_soim_004 = recode_values(q16, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Doctors may end life: mercy killing
      # q14: 1=YES, SHOULD 2=NO, SHOULD NOT 3=QUALIFIED 4=UNDECIDED
      bri_soim_003 = recode_values(q14, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-366-E-1974-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-366-E-1974-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-366-E-1974-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military training at 18
      # q11: 0=NOT STATED 1=WOULD FAVOUR 2=WOULD OPPOSE 3=NO OPINION
      bri_intd_001 = recode_values(q11, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-368-E-1974-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-368-E-1974-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-368-E-1974-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price controls
      # q12: 0=WILD CODE 1=FAVOUR 2=OPPOSE 3=DON'T KNOW
      gal_econ_011 = recode_values(q12, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion if woman's health in danger
      # q7b: 0=NOT STATED 1=YES 2=NO 3=NOT SURE
      gal_soim_005 = recode_values(q7b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-372-E-1975-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-372-E-1975-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-372-E-1975-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q5: 0=WILD CODE 1=TOO HIGH 2=ABOUT RIGHT 3=CAN'T SAY
      gal_econ_009 = recode_values(q5, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Child care: govt or family resp
      # q7: 1=FAMILY 2=GOVT 3=QUALIFIED 4=CAN'T SAY
      gal_hwps_005 = recode_values(q7, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-373-E-1975-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-373-E-1975-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-373-E-1975-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Farmers get square deal from fed govt
      # q8: 1=YES 2=NO 3=NO OPINION
      gal_econ_007 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Union laws too strict/not enough
      # q2: 0=WILD CODE 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CAN'T SAY
      gal_econ_004 = recode_values(q2, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-374-E-1975-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-374-E-1975-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-374-E-1975-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Courts harsh on criminals
      # q8: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW
      gal_soim_004 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-375-E-1975-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-375-E-1975-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-375-E-1975-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Essential services right to strike
      # q2a: 1=SHOULD BE 2=SHOULD NOT BE 3=UNDECIDED
      gal_hwps_002 = recode_values(q2a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-377-E-1975-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-377-E-1975-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-377-E-1975-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q13a: 1=INCREASE 2=DECREASE 3=SAME LEVEL 4=DON'T KNOW
      bri_idim_004 = recode_values(q13a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Buy back 51% control of US firms
      # q2: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=UNDECIDED
      gal_econ_008 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Courts harsh on criminals
      # q5: 0=WILD CODE 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW
      gal_soim_004 = recode_values(q5, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999),

      # Keep Queen/King vs republic
      # q8: 1=HAVE KING 2=BECOME REPUBLIC 3=UNDECIDED
      gal_intd_003 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-378-E-1975-07_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-378-E-1975-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-378-E-1975-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q7: 1=YES 2=NO 3=DON'T KNOW
      bri_econ_002 = recode_values(q7, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Want larger Cdn population
      # q5: 1=SHOULD BE LARGER 2=RIGHT SIZE 3=UNDECIDED
      bri_idim_001 = recode_values(q5, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion legal in all/some/no cases
      # q10a: 1=LEGAL ANY REASON 2=LEGAL-CERTAIN REASON 3=ILLEGAL-ALL REASONS 4=DON'T KNOW
      bri_soim_005 = recode_values(q10a, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Favour registration of all firearms
      # q8: 1=FAVOR 2=OPPOSE 3=NO OPINION
      gal_soim_006 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion legal: serious birth defect
      # q10b: 0=NOT STATED 1=SHOULD BE LEGAL 2=SHOULD NOT 3=DON'T KNOW
      gal_soim_007 = recode_values(q10b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion legal: health endangered
      # q10c: 0=NOT STATED 1=SHOULD BE LEGAL 2=SHOULD NOT 3=DON'T KNOW
      gal_soim_009 = recode_values(q10c, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Abortion legal: family low income
      # q10d: 0=NOT STATED 1=SHOULD BE LEGAL 2=SHOULD NOT 3=DON'T KNOW
      gal_soim_008 = recode_values(q10d, 0 ~ 9999, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-385-E-1976-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-385-E-1976-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-385-E-1976-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Education costs in prov too high
      # q1a: 1=TOO HIGH 2=TOO LOW 3=ABOUT RIGHT 4=DON'T KNOW
      gal_hwps_001 = recode_values(q1a, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-386-E-1976-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-386-E-1976-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-386-E-1976-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement at 65 good idea
      # q1: 1=GOOD IDEA 2=NOT A GOOD IDEA 3=CAN'T SAY 4=NOT STATED
      bri_hwps_003 = recode_values(q1, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-388-E-1976-05_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-388-E-1976-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-388-E-1976-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Union laws too strict/not enough
      # q8a: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=UNDECIDED 5=NOT STATED
      gal_econ_004 = recode_values(q8a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Ban liquor advertising
      # q6b: 1=YES, SHOULD 2=NO, SHOULD NO 3=UNDECIDED 4=NOT STATED
      gal_soim_010 = recode_values(q6b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Ban cigarette advertising
      # q6a: 1=YES, SHOULD 2=NO, SHOULD NO 3=UNDECIDED 4=NOT STATED
      gal_soim_002 = recode_values(q6a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-186-E-1976-07_F1.sav -- Gallup, 2 questions
survey(
  survey_id = "cipo-186-E-1976-07_F1.sav",
  source    = "Gallup",
  file_name = "cipo-186-E-1976-07_F1.sav",
  recode = function(d) {
    d %>% transmute(
      # Farmers get square deal from fed govt
      # q10: 1=YES 2=NO 3=NO OPINION 4=NOT STATED
      gal_econ_007 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Strength of separatism in Quebec
      # q7: 1=VERY STRONG 2=FAIRLY STRONG 3=NOT VERY STRONG 4=CAN'T SAY 5=NOT STATED
      gal_idim_004 = recode_values(q7, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-392-E-1976-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-392-E-1976-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-392-E-1976-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q3b: 1=AGREE TO IT 2=NOT OPPOSE, WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q3b, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Increase or stop nuclear generation
      # q3a: 1=INCREASE GENERATION 2=NOT DEVELOP MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q3a, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-393-E-1976-10_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-393-E-1976-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-393-E-1976-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Quebec right to separate
      # q6: 1=YES 2=NO 3=UNDECIDED 4=NOT STATED
      gal_idim_005 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Unions have been good/bad for Cda
      # q7: 1=GOOD THING 2=BAD THING 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_012 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-395-E-1976-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-395-E-1976-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-395-E-1976-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Unemployment benefits too high/low
      # q8: 1=TOO HIGH 2=ABOUT RIGHT 3=TOO LOW 4=DON'T KNOW 5=NOT STATED
      gal_hwps_006 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-396-E-1977-01_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-396-E-1977-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-396-E-1977-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=HANDLING PROPERLY 2=NOT HANDLING PROPER. 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Workers should have right to strike
      # q6: 1=YES 2=NO 3=UNDECIDED 4=NOT STATED
      bri_hwps_002 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Child care: govt or family resp
      # q1: 1=NO, FAMILY 2=YES, GOV SHARE 3=QUALIFIED 4=NOT STATED
      gal_hwps_005 = recode_values(q1, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-398-E-1977-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-398-E-1977-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-398-E-1977-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Courts harsh on criminals
      # q7: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-399-E-1977-04_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-399-E-1977-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-399-E-1977-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q4: 1=IN FAVOR 2=OPPOSED 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      bri_idim_002 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Small marijuana possession an offence
      # q8: 1=YES, CRIMINAL 2=FINE ONLY 3=NO OFFENSE AT ALL 4=DON'T KNOW 5=NOT STATED
      bri_soim_006 = recode_values(q8, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Divorce: equal division of assets
      # q1: 1=YES, BELIEVE 2=NO, DO NOT 3=DEPENDS 4=DON'T KNOW
      gal_soim_011 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-402-E-1977-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-402-E-1977-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-402-E-1977-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q8a: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      bri_idim_002 = recode_values(q8a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Buy back 51% control of US firms
      # q11: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q11, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q10: 1=ENOUGH NOW 2=LIKE SEE MORE 3=LIKE SEE LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q10, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999),

      # More power to provs, less to fed
      # q7a: 1=APPROVE 2=DISAPROVE 3=UNDECIDED 4=NOT STATED 5=WILD CODE 6=WILD CODE 2 7=WILD CODE 3
      gal_idim_006 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4, 5, 6, 7) ~ 9999)
    )
  }
)

# cipo-403-E-1977-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-403-E-1977-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-403-E-1977-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Courts harsh on criminals
      # q4: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-404-E-1977-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-404-E-1977-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-404-E-1977-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Workers should have right to strike
      # q8a: 1=YES 2=NO 3=UNDECIDED 4=NOT STATED
      bri_hwps_002 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Essential services right to strike
      # q8b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_hwps_002 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-405-E-1977-10_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-405-E-1977-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-405-E-1977-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q12b: 1=AGREE TO IT 2=NOT OPPOSE BUT WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q12b, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Unemployment benefits too high/low
      # q9d: 1=TOO HIGH 2=ABOUT RIGHT 3=TOO LOW 4=CAN'T SAY 5=NOT STATED
      gal_hwps_006 = recode_values(q9d, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Increase or stop nuclear generation
      # q12a: 1=INCREASE 2=NOT DEVELOP MORE 3=STOP 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q12a, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Keep Queen/King vs republic
      # q2: 1=SHOULD HAVE QUEEN 2=BECOME A REPUBLIC 3=CAN'T SAY 4=NOT STATED
      gal_intd_003 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-406-E-1977-11_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-406-E-1977-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-406-E-1977-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement 65 good/qualified
      # q10: 1=GOOD IDEA 2=NOT GOOD IDEA 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_hwps_007 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Favour Quebec separation
      # q2: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      bri_idim_002 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-408-E-1978-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-408-E-1978-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-408-E-1978-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-410-E-1978-03_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-410-E-1978-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-410-E-1978-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q3a: 1=YES 2=CERTAIN CASES 3=NO 4=NOT STATED
      bri_soim_005 = recode_values(q3a, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Vote for reinstating death penalty
      # q5b: 1=FAVOR 2=OPPOSED 3=DON'T KNOW 4=NOT STATED
      bri_soim_004 = recode_values(q5b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Sex education in schools
      # q2a: 1=APPROVE 2=DISAPPROVE 3=NO OPINION
      gal_soim_003 = recode_values(q2a, 1 ~ 1, 2 ~ -1, 3 ~ 9999)
    )
  }
)

# cipo-411-E-1978-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-411-E-1978-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-411-E-1978-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Divorce: equal division of assets
      # q5: 1=YES, BELIEVE 2=NO, DO NOT 3=DEPENDS 4=DON'T KNOW 5=NOT STATED
      gal_soim_011 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-414-E-1978-07_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-414-E-1978-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-414-E-1978-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Personal rights protected or in danger
      # q1: 1=YES, FULLY 2=NO, IN DANGER 3=NO OPINION 4=NOT STATED
      bri_soim_001 = recode_values(q1, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Buy back 51% control of US firms
      # q7b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q7b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q7a: 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=LIKE TO SEE LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q7a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-416a-E-1978-09_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-416a-E-1978-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-416a-E-1978-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Workers should have right to strike
      # q3: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      bri_hwps_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Essential services right to strike
      # q4: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_hwps_002 = recode_values(q4, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More power to provs, less to fed
      # q5b: 1=APPROVE 2=DISAPPROVE 3=UNDECIDED 4=NOT STATED
      gal_idim_006 = recode_values(q5b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-417a-E-1978-10_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-417a-E-1978-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-417a-E-1978-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q5b: 1=AGREE TO IT 2=NOT OPPOSE BUT WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q5b, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Police right to strike
      # q11b: 0=NOT ASKED 1=SHOULD 2=SHOULD NOT 3=NO OPINION 4=NOT STATED
      gal_hwps_009 = recode_values(q11b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Postal workers right to strike
      # q11a: 0=NOT ASKED 1=SHOULD 2=SHOULD NOT 3=NO OPINION 4=NOT STATED
      gal_hwps_008 = recode_values(q11a, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Unions have been good/bad for Cda
      # q3: 0=NOT ASKED 1=A GOOD THING 2=A BAD THING 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_012 = recode_values(q3, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Favour wage-price controls
      # q7: 0=NOT ASKED 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q7, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Increase or stop nuclear generation
      # q5a: 1=INCREASE GENERATION 2=NOT DEVELOP MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q5a, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q1: 0=NOT ASKED 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q1, 0 ~ 9999, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # English compulsory in French schools
      # q8b: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_idim_002 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # French compulsory in English schools
      # q8a: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_idim_003 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-419-E-1978-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-419-E-1978-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-419-E-1978-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # QC special status, more powers
      # q6: 1=YES 2=NO,SAME AS OTHERS 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      gal_idim_007 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-420-E-1979-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-420-E-1979-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-420-E-1979-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=HANDLING PROPERLY 2=NOT PROPERLY HANDLED 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour Quebec separation (referendum)
      # q5: 1=IN FAVOR 2=OPPOSED 3=DON'T KNOW 4=NOT STATED
      bri_idim_005 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-421a-E-1979-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-421a-E-1979-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-421a-E-1979-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Want larger Cdn population
      # q6: 1=YES 2=STAY AS IS 3=CAN'T SAY 4=NOT STATED
      bri_idim_001 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-421b-E-1979-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-421b-E-1979-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-421b-E-1979-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Want larger Cdn population
      # q5: 1=YES LARGER 2=NO, STAY SAME 3=CAN'T SAY 4=NOT STATED
      bri_idim_001 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion if woman's health in danger
      # q1b: 0=INAPPLICABLE 1=YES 2=NO 3=NOT SURE 4=NOT STATED
      gal_soim_005 = recode_values(q1b, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-423a-E-1979-04_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-423a-E-1979-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-423a-E-1979-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Public school discipline too strict
      # q11a: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CAN'T SAY 5=NOT STATED
      gal_hwps_003 = recode_values(q11a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # High school discipline too strict
      # q11b: 0=NOT STATED 6=TOO STRICT 7=NOT STRICT ENOUGH 8=ABOUT RIGHT 9=CAN'T SAY
      gal_hwps_004 = recode_values(q11b, 0 ~ 9999, 6 ~ 1, 7 ~ -1, 8 ~ 0, 9 ~ 9999)
    )
  }
)

# cipo-426-E-1979-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-426-E-1979-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-426-E-1979-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q6: 1=IN FAVOR 2=OPPOSED 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      bri_idim_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-427b-E-1979-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-427b-E-1979-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-427b-E-1979-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Labour unions too powerful
      # q2b: 1=TOO POWERFUL 2=NOT POWERFUL ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      bri_econ_003 = recode_values(q2b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Unions a good/bad thing for Cda
      # q2a: 1=GOOD THING 2=BAD THING 3=DON'T KNOW 4=NOT STATED
      gal_econ_014 = recode_values(q2a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-428a-E-1979-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-428a-E-1979-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-428a-E-1979-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Energy crisis in Canada exists
      # q2a: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_ener_001 = recode_values(q2a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-249a-E-1979-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-249a-E-1979-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-249a-E-1979-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Doctors may end life: mercy killing
      # q6: 1=YES, SHOULD 2=NO, SHOULD NOT 3=QUALIFIED 4=UNDECIDED 5=NOT STATED
      bri_soim_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-430b-E-1979-10_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-430b-E-1979-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-430b-E-1979-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # English compulsory in French schools
      # q11b: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_idim_002 = recode_values(q11b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # French compulsory in English schools
      # q11a: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_idim_003 = recode_values(q11a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Appr local police performance
      # q9a: 1=APPROVE 2=DISAPPROVE 3=DON'T KNOW 4=NOT STATED
      gal_soim_012 = recode_values(q9a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999, default = 9999),

      # Police prejudice vs racial minorities
      # q9b: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_idim_008 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-431a-E-1979-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-431a-E-1979-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-431a-E-1979-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Cut taxes vs keep up govt spending
      # q13: 1=CUT TAXES 2=LEFT AS ARE 3=INCREASE TAX 4=DON'T KNOW 5=NOT STATED
      bri_econ_004 = recode_values(q13, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-433a-E-1980-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-433a-E-1980-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-433a-E-1980-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # q12: 1=IN FAVOUR 2=OPPOSED 3=DON'T KNOW 4=NOT STATED
      bri_idim_005 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-434b-E-1980-02_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-434b-E-1980-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-434b-E-1980-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Child care: govt or family resp
      # q6: 1=MOTHER 2=GOVT SHARE 3=QUALIFIED 4=CAN'T SAY 5=NOT STATED
      gal_hwps_005 = recode_values(q6, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Mandatory retirement 65 good/qualified
      # q5: 1=GOOD IDEA 2=NOT A GOOD IDEA 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_hwps_007 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Larger/smaller Cdn population
      # q12: 1=YES 2=NO, STAY SAME 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_idim_001 = recode_values(q12, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-455-1-E-1980-02_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-455-1-E-1980-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-455-1-E-1980-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q10: 1=YES PROPERLY 2=NO NOT PROPERLY 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Buy back 51% control of US firms
      # q3b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q3b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q3a: 1=ENOUGH NOW 2=WANT MORE 3=WANT LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q3a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-436a-E-1980-03_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-436a-E-1980-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-436a-E-1980-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military training: women
      # q8b: 1=WOULD FAVOUR 2=WOULD OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_intd_004 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Courts harsh on criminals
      # q7: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-437a-E-1980-04_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-437a-E-1980-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-437a-E-1980-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Buy back 51% control of US firms
      # q5b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q5b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q5a: 1=ENOUGH NOW 2=LIKE SEE MORE 3=LIKE SEE LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q5a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-438a-E-1980-05_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-438a-E-1980-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-438a-E-1980-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Increase or stop nuclear generation
      # q1: 1=INCREASE GENERATION 2=NOT DEVELOP MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q1, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-439a-E-1980-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-439a-E-1980-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-439a-E-1980-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=HANDLING PROPERLY 2=NOT PROPERLY HANDLED 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-440-1-E-1980-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-440-1-E-1980-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-440-1-E-1980-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # More power: fed vs prov govts
      # q7: 1=REMAIN AS IS 2=PROV MORE POWER 3=FED MORE POWER 4=DON'T KNOW 5=NOT STATED
      bri_idim_006 = recode_values(q7, 1 ~ 0, 2 ~ -1, 3 ~ 1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-441-1-E-1980-08_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-441-1-E-1980-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-441-1-E-1980-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # More power: fed vs prov govts
      # q3a: 1=MORE TO PROV 2=MORE TO FED 3=REMAIN AS IS 4=DON'T KNOW 5=NOT STATED
      bri_idim_006 = recode_values(q3a, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Small marijuana possession an offence
      # q9: 1=CRIMINAL OFFENSE 2=FINE ONLY 3=NO OFFENSE AT ALL 4=DON'T KNOW 5=NOT STATED
      bri_soim_006 = recode_values(q9, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Energy crisis in Canada exists
      # q7a: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_ener_001 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-442-1-E-1980-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-442-1-E-1980-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-442-1-E-1980-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q9a: 1=INCREASE 2=DECREASE 3=SAME LEVEL 4=DON'T KNOW 5=NOT STATED
      bri_idim_004 = recode_values(q9a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-186-E-1980-10_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-186-E-1980-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-186-E-1980-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Labour unions too powerful
      # q3: 1=TOO POWERFUL 2=NOT POWERFUL ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      bri_econ_003 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Unions have been good/bad for Cda
      # q2: 1=A GOOD THING 2=A BAD THING 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_econ_012 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q1: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-443-2-E-1980-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-443-2-E-1980-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-443-2-E-1980-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price controls
      # q2: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-444-4-E-1980-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-444-4-E-1980-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-444-4-E-1980-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement at 65 good idea
      # q6: 1=GOOD IDEA 2=NOT A GOOD IDEA 3=DON'T KNOW 4=NOT STATED
      bri_hwps_003 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-447-3-E-1981-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-447-3-E-1981-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-447-3-E-1981-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military training: women
      # q4b: 1=WOULD FAVOR 2=WOULD OPPOSE 3=NO OPINION 4=NOT STATED
      gal_intd_004 = recode_values(q4b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-448-2-E-1981-04_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-448-2-E-1981-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-448-2-E-1981-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Buy back 51% control of US firms
      # q8b: 1=APPROVE 2=DISAPPROVE 4=QUALIFIED 5=DON'T KNOW 6=NOT STATED
      gal_econ_008 = recode_values(q8b, 1 ~ 1, 2 ~ -1, 4 ~ 0, c(5, 6) ~ 9999),

      # US capital in Cda: enough/more/less
      # q8a: 1=ENOUGH NOW 2=WANT MORE 3=WANT LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q8a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-449-2-E-1981-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-449-2-E-1981-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-449-2-E-1981-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Ban liquor advertising
      # q7b: 5=YES, SHOULD 6=NO, SHOULD NOT 7=UNDECIDED 8=NOT STATED
      gal_soim_010 = recode_values(q7b, 5 ~ 1, 6 ~ 0, c(7, 8) ~ 9999),

      # Ban cigarette advertising
      # q7a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_soim_002 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-450-1-E-1981-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-450-1-E-1981-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-450-1-E-1981-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price controls
      # q7: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Energy crisis in Canada exists
      # q12: 1=YES, IS 2=NO, IS NOT 3=DON'T KNOW 4=NOT STATED
      gal_ener_001 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-451-1-E-1981-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-451-1-E-1981-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-451-1-E-1981-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Farmers get square deal from fed govt
      # q6: 1=YES 2=NO 3=NO OPINION 4=NOT STATED
      gal_econ_007 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-454-1-E-1981-10_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-454-1-E-1981-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-454-1-E-1981-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q3: 1=AGREE TO BEING BUILT 2=NOT OPPOSE BUT WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Small marijuana possession an offence
      # q6: 1=CRIMINAL OFFENSE 2=OFFENSE & FINE 3=NO OFFENSE AT ALL 4=DON'T KNOW 5=NOT STATED
      bri_soim_006 = recode_values(q6, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Increase or stop nuclear generation
      # q2: 1=INCREASE GENERATION 2=NOT DEVELOP MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q2, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-458-1-E-1982-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-458-1-E-1982-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-458-1-E-1982-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour wage-price controls
      # q8: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q8, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-460-1-E-1982-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-460-1-E-1982-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-460-1-E-1982-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Child care: govt or family resp
      # q12: 1=NO, MOTHER'S 2=YES, GOV SHARE 3=QUALIFIED 4=CAN'T SAY
      gal_hwps_005 = recode_values(q12, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-462-1-E-1982-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-462-1-E-1982-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-462-1-E-1982-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # q2: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=NO OPINION 4=NOT STATED
      gal_econ_010 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Energy crisis in Canada exists
      # q10: 1=YES, IS 2=NO, IS NOT 3=DON'T KNOW 4=NOT STATED
      gal_ener_001 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-463-1-E-1982-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-463-1-E-1982-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-463-1-E-1982-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Buy back 51% control of US firms
      # q10b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q10b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q10a: 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=LIKE TO SEE LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q10a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999),

      # Favour wage-price controls
      # q3: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Satisfied w/ Cdn defence policy
      # q5: 1=SATISFIED 2=DISSATISFIED 3=NO OPINION 4=NOT STATED
      gal_intd_001 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-465-1-E-1982-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-465-1-E-1982-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-465-1-E-1982-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfaction: prov medical care plan
      # q13: 1=VERY SATISFIED 2=QUITE SATISFIED 3=NOT TOO SATISFIED 4=NOT SATISFIED 5=CAN'T SAY 6=NOT STATED
      gal_hwps_010 = recode_values(q13, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # q12b: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      bri_soim_004 = recode_values(q12b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-465-4-E-1982-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-465-4-E-1982-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-465-4-E-1982-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # q8: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=NO OPINION 4=NOT STATED
      gal_econ_010 = recode_values(q8, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-467-1-E-1982-11_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-467-1-E-1982-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-467-1-E-1982-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q9: 1=HANDLING PROPERLY 2=NOT PROPERLY HANDLED 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Labour unions too powerful
      # q5: 1=TOO POWERFUL 2=NOT POWERFUL ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      bri_econ_003 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Accept nuclear plant in your area
      # q12: 1=AGREE TO BEING BUILT 2=NOT OPPOSE BUT WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q12, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Immigration: increase/decrease level
      # q15: 1=INCREASE 2=DECREASE 3=SAME LEVEL 4=DON'T KNOW 5=NOT STATED
      bri_idim_004 = recode_values(q15, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Unions a good/bad thing for Cda
      # q4: 1=A GOOD THING 2=A BAD THING 3=DON'T KNOW 4=NOT STATED
      gal_econ_014 = recode_values(q4, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Increase or stop nuclear generation
      # q11: 1=INCREASE GENERATION 2=NOT DEVELOP MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q11, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q2: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-468-1-E-1982-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-468-1-E-1982-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-468-1-E-1982-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Permit US cruise missile testing
      # q4b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=DON'T KNOW 4=NOT STATED
      gal_intd_005 = recode_values(q4b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-469-1-E-1983-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-469-1-E-1983-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-469-1-E-1983-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # q7: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=NO OPINION 4=NOT STATED
      gal_econ_010 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-470-1-E-1983-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-470-1-E-1983-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-470-1-E-1983-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # q2: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=NO OPINION
      gal_econ_010 = recode_values(q2, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Favour wage-price controls
      # q6: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=NOT STATED
      gal_econ_011 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-471-1-E-1983-03_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-471-1-E-1983-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-471-1-E-1983-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Education costs in prov too high
      # q2: 1=TOO HIGH 2=TOO LOW 3=ABOUT RIGHT 4=CAN'T SAY 5=NOT STATED
      gal_hwps_001 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Compulsory military training: women
      # q10: 1=FAVOUR 2=OPPOSE 3=NO OPINION 4=NOT STATED
      gal_intd_004 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-473-1-E-1983-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-473-1-E-1983-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-473-1-E-1983-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada better/worse off w free trade
      # q8: 1=BETTER OFF 2=WORSE OFF 3=CAN'T SAY 4=NOT STATED
      gal_econ_006 = recode_values(q8, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Strength of separatism in Quebec
      # q6: 1=VERY STRONG 2=FAIRLY STRONG 3=NOT VERY STRONG 4=CAN'T SAY 5=NOT STATED
      gal_idim_004 = recode_values(q6, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-474-1-E-1983-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-474-1-E-1983-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-474-1-E-1983-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Energy crisis in Canada exists
      # q12a: 1=YES, IS 2=NO, IS NOT 3=DON'T KNOW 4=NOT STATED
      gal_ener_001 = recode_values(q12a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-475-1-E-1983-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-475-1-E-1983-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-475-1-E-1983-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Permit US cruise missile testing
      # q11b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=DON'T KNOW 4=NOT STATED
      gal_intd_005 = recode_values(q11b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal in all/some/no cases
      # q13a: 1=ALL CIRCUMSTANCES 2=SOME CIRCUMSTANCE 3=ILLEGAL: ALL 4=DON'T KNOW
      bri_soim_005 = recode_values(q13a, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Buy back 51% control of US firms
      # q7b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q7b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough/more/less
      # q7a: 1=ENOUGH NOW 2=WANT MORE 3=WANT LESS 4=DON'T KNOW 5=NOT STATED
      gal_econ_013 = recode_values(q7a, 1 ~ 0, 2 ~ 1, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-476-1-E-1983-08_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-476-1-E-1983-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-476-1-E-1983-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt treats Indigenous well/badly
      # q8: 1=WELL TREATED 2=BADLY TREATED 3=FAIRLY TREATED 4=CAN'T SAY 5=NOT STATED
      bri_idim_003 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # English compulsory in French schools
      # q4b: 1=YES 2=NO 3=NO OPINION 4=NOT STATED
      gal_idim_002 = recode_values(q4b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # French compulsory in English schools
      # q4a: 1=YES 2=NO 3=NO OPINION 4=NOT STATED
      gal_idim_003 = recode_values(q4a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Strength of separatism in Quebec
      # q9: 1=VERY STRONG 2=FAIRLY STRONG 3=NOT VERY STRONG 4=CAN'T SAY 5=NOT STATED
      gal_idim_004 = recode_values(q9, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-477-1-E-1983-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-477-1-E-1983-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-477-1-E-1983-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Sunday retail sales: allow/special
      # q12: 1=YES, SHOULD 2=SPECIAL CIRCUMSTANCE 3=NO, SHOULD NOT 4=DON'T KNOW 5=NOT STATED
      gal_soim_013 = recode_values(q12, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-477-4-E-1983-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-477-4-E-1983-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-477-4-E-1983-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q8: 1=AGREE TO BUILDING 2=NOT OPPOSE BUT WORRY 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Increase or stop nuclear generation
      # q7: 1=INCREASE GENERATION 2=NOT DEVELOP ANY MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q7, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-480-1-E-1983-12_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-480-1-E-1983-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-480-1-E-1983-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Permit US cruise missile testing
      # q4b: 1=SHOULD PERMIT 2=SHOULD NOT 3=DON'T KNOW 4=NOT STATED
      gal_intd_005 = recode_values(q4b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Larger/smaller Cdn population
      # q9: 1=YES, MUCH LARGER 2=JUST ABOUT RIGHT 3=QUALIFIED 4=DON'T KNOW
      gal_idim_001 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-482-1-E-1984-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-482-1-E-1984-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-482-1-E-1984-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Cut taxes vs keep up govt spending
      # q4: 1=CUT TAXES 2=LEAVE SAME 3=EXTEND SERVICES 4=DON'T KNOW 5=NOT STATED
      bri_econ_004 = recode_values(q4, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-483-5-E-1984-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-483-5-E-1984-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-483-5-E-1984-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Priority: balance budget vs unemploy
      # q1: 1=BALANCE BUDGET 2=REDUCE UNEMPLOYMENT 3=DON'T KNOW 4=NOT STATED
      bri_econ_007 = recode_values(q1, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-186-E-1984-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-186-E-1984-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-186-E-1984-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Courts harsh on criminals
      # q4: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      gal_soim_004 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-486-4-E-1984-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-486-4-E-1984-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-486-4-E-1984-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Labour unions too powerful
      # q13b: 1=TOO POWERFUL 2=NOT POWERFUL ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=NOT STATED
      bri_econ_003 = recode_values(q13b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Buy back 51% control of US firms
      # q3: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough or more
      # q2: 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW 4=NOT STATED
      gal_econ_003 = recode_values(q2, 1 ~ 0, 2 ~ 1, c(3, 4) ~ 9999),

      # Unions a good/bad thing for Cda
      # q13a: 1=GOOD THING 2=BAD THING 3=DON'T KNOW 4=NOT STATED
      gal_econ_014 = recode_values(q13a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-490-2-E-1984-10_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-490-2-E-1984-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-490-2-E-1984-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Labour unions too powerful
      # q2b: 1=TOO POWERFUL 2=NOT POWRFL ENOUGH 3=ABOUT RIGHT 4=DONT KNOW 5=NOT STATED
      bri_econ_003 = recode_values(q2b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Referendum: reinstate death penalty
      # q10: 1=FOR 2=AGAINST 3=QUALIFIED 4=NO OPINION 5=NOT STATED
      bri_soim_007 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Curb inflation vs reduce unemployment
      # q12: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=DONT KNOW 4=NOT STATED
      gal_econ_010 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Unions a good/bad thing for Cda
      # q2a: 1=GOOD THING 2=BAD THING 3=DONT KNOW 4=NOT STATED
      gal_econ_014 = recode_values(q2a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Appr local police performance
      # q8a: 1=APPROVE 2=DISAPPROVE 3=DONT KNOW 4=REFUSED
      gal_soim_012 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Police prejudice vs racial minorities
      # q8b: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_idim_008 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-492-1-E-1984-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-492-1-E-1984-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-492-1-E-1984-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada better/worse off w free trade
      # q11: 1=BETTER OFF 2=WORSE OFF 3=DON'T KNOW 4=NOT STATED
      gal_econ_006 = recode_values(q11, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-493-1-E-1985-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-493-1-E-1985-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-493-1-E-1985-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement 65 good/qualified
      # q9: 1=GOOD IDEA 2=NOT A GOOD IDEA 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_hwps_007 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-494-1-E-1985-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-494-1-E-1985-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-494-1-E-1985-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Child care: govt or family resp
      # q3: 1=Mother/Family 2=Government 3=Qualified 4=DK
      gal_hwps_005 = recode_values(q3, 1 ~ -1, 2 ~ 1, 3 ~ 0, 4 ~ 9999),

      # Want larger Cdn population
      # q2: 1=Yes 2=No 3=Undecided 4=DK
      bri_idim_001 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-494-4-E-1985-02_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-494-4-E-1985-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-494-4-E-1985-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q10: 1=TOO HIGH 2=ABOUT RIGHT 3=CAN'T SAY 4=NOT STATED
      gal_econ_009 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Workers should have right to strike
      # q7a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      bri_hwps_002 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Essential services right to strike
      # q7b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_hwps_002 = recode_values(q7b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Compulsory military training: women
      # q8b: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      gal_intd_004 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-497-3-E-1985-05_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-497-3-E-1985-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-497-3-E-1985-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Permit US cruise missile testing
      # q9b: 1=SHOULD PERMIT 2=SHOULD NOT PERMIT 3=DON'T KNOW 4=NOT STATED
      gal_intd_005 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-498-2-E-1985-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-498-2-E-1985-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-498-2-E-1985-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q3: 1=HANDLING PROPERLY 2=NOT PROPERLY HANDLED 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-499-2-E-1985-07_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-499-2-E-1985-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-499-2-E-1985-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Small marijuana possession an offence
      # q9: 1=CRIMINAL OFFENSE 2=SUBJECT TO FINE ONLY 3=NO OFFENSE AT ALL 4=DON'T KNOW 5=NOT STATED
      bri_soim_006 = recode_values(q9, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Buy back 51% control of US firms
      # q4: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 5=NOT STATED
      gal_econ_008 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # US capital in Cda: enough or more
      # q3: 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW 4=NOT STATED
      gal_econ_003 = recode_values(q3, 1 ~ 0, 2 ~ 1, c(3, 4) ~ 9999)
    )
  }
)

# cipo-500-2-E-1985-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-500-2-E-1985-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-500-2-E-1985-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Priority: balance budget vs unemploy
      # q9: 1=BALANCE THE BUDGET 2=REDUCE UNEMPLOYMENT 3=DON'T KNOW 4=NOT STATED
      bri_econ_007 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-501-1-E-1985-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-501-1-E-1985-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-501-1-E-1985-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Referendum: reinstate death penalty
      # q7: 1=FOR DEATH PENALTY 2=AGAINST DTH. PENALTY 3=QUALIFIED 4=NO OPINION
      bri_soim_007 = recode_values(q7, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-504-1-E-1985-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-504-1-E-1985-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-504-1-E-1985-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Mandatory retirement at 65 good idea
      # q8: 1=GOOD IDEA 2=NOT A GOOD IDEA 3=DON'T KNOW 4=NOT STATED
      bri_hwps_003 = recode_values(q8, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-505-1-E-1986-01_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-505-1-E-1986-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-505-1-E-1986-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q2: 1=YES 2=NO 3=DON'T KNOW 4=NOT STATED
      bri_econ_002 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Ban liquor advertising
      # q11b: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_soim_010 = recode_values(q11b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Ban cigarette advertising
      # q11a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      gal_soim_002 = recode_values(q11a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-507-2-E-1986-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-507-2-E-1986-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-507-2-E-1986-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Workers should have right to strike
      # q8a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED
      bri_hwps_002 = recode_values(q8a, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-508-1-E-1986-04_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-508-1-E-1986-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-508-1-E-1986-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q1: 1=TOO HIGH 2=ABOUT RIGHT 3=CAN'T SAY
      gal_econ_009 = recode_values(q1, 1 ~ 1, 2 ~ 0, 3 ~ 9999),

      # Divorce: equal division of assets
      # q4: 1=YES, BELIEVE 2=NO, DO NOT 3=DEPENDS 4=DON'T KNOW
      gal_soim_011 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-510-1-E-1986-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-510-1-E-1986-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-510-1-E-1986-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q5b: 1=AGREE TO BUILDING 2=FEEL ANXIOUS 3=WOULD OPPOSE IT 4=DON'T KNOW 5=NOT STATED
      bri_ener_002 = recode_values(q5b, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999),

      # Increase or stop nuclear generation
      # q5a: 1=YES, INCREASE 2=NOT DEVELOP ANY MORE 3=STOP GENERATION 4=DON'T KNOW 5=NOT STATED
      bri_ener_001 = recode_values(q5a, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-511-1-E-1986-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-511-1-E-1986-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-511-1-E-1986-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Buy back 51% control of US firms
      # q6: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 4=DON'T KNOW 99=REFUSED
      gal_econ_008 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 99) ~ 9999),

      # US capital in Cda: enough or more
      # q5: 1=ENOUGH NOW 2=LIKE TO SEE MORE 3=DON'T KNOW 4=NOT STATED 99=REFUSED
      gal_econ_003 = recode_values(q5, 1 ~ 0, 2 ~ 1, c(3, 4, 99) ~ 9999)
    )
  }
)

# cipo-513-2-E-1986-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-513-2-E-1986-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-513-2-E-1986-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Admit more or fewer refugees
      # q10b: 1=ACCEPT MORE 2=ACCEPT FEWER 3=NO CHANGE IN POLICY 4=DON'T KNOW 99=NOT STATED
      bri_idim_008 = recode_values(q10b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q9: 1=BETTER OFF 2=WORSE OFF 3=CAN'T SAY 99=NOT STATED
      gal_econ_006 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999)
    )
  }
)

# cipo-514-1-E-1986-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-514-1-E-1986-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-514-1-E-1986-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Referendum: reinstate death penalty
      # q9: 1=FOR 2=AGAINST 3=QUALIFIED 4=NO OPINION 99=NOT STATED
      bri_soim_007 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 99) ~ 9999)
    )
  }
)

# cipo-515-1-E-1986-11_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-515-1-E-1986-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-515-1-E-1986-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Priority: balance budget vs unemploy
      # q4: 1=BALANCING BUDGET 2=REDUCE UNEMPLOYMENT 3=DON'T KNOW 99=NOT STATED
      bri_econ_007 = recode_values(q4, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999),

      # Sunday retail sales: allow/special
      # q2: 1=YES, SHOULD 2=SPECIAL CIRCUMSTANCE 3=NO, SHOULD NOT 4=DON'T KNOW 99=NOT STATED
      gal_soim_013 = recode_values(q2, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 99) ~ 9999),

      # More prov funding: high schools
      # q9b: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 99=NOT STATED
      gal_hwps_011 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999),

      # More prov funding: post-secondary
      # q9c: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 99=NOT STATED
      gal_hwps_012 = recode_values(q9c, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999),

      # More prov funding: public schools
      # q9a: 1=FAVOR 2=OPPOSE 3=DON'T KNOW 99=NOT STATED
      gal_hwps_013 = recode_values(q9a, 1 ~ 1, 2 ~ 0, c(3, 99) ~ 9999)
    )
  }
)

# cipo-516-1-E-1986-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-516-1-E-1986-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-516-1-E-1986-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Courts harsh on criminals
      # q6: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 99=NOT STATED
      gal_soim_004 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 99) ~ 9999)
    )
  }
)

# cipo-517-1-E-1987-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-517-1-E-1987-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-517-1-E-1987-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q12: 1=YES 2=NOT PROPERLY 3=DONT KNOW
      bri_econ_002 = recode_values(q12, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-519-2-E-1987-03_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-519-2-E-1987-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-519-2-E-1987-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q5: 1=TOO HIGH 2=ABOUT RIGHT 3=UNDECIDED 4=NOT STATED 99=BLANKS
      gal_econ_009 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(3, 4, 99) ~ 9999),

      # Workers should have right to strike
      # q4a: 1=YES, SHOULD 2=NO, SHOULD NOT 3=UNDECIDED 4=NOT STATED
      bri_hwps_002 = recode_values(q4a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Immigration: increase/decrease level
      # q2: 1=INCREASE 2=DECREASE 3=SAME 4=DONT KNOW 5=NOT STATED 99=BLANKS
      bri_idim_004 = recode_values(q2, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5, 99) ~ 9999)
    )
  }
)

# cipo-520-2-E-1987-04_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-520-2-E-1987-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-520-2-E-1987-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Privatize: Petro-Canada
      # q7: 1=YES 2=NO 3=DONT KNOW 4=NOT STATED 99=BLANKS
      bri_econ_006 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(3, 4, 99) ~ 9999),

      # Vote for reinstating death penalty
      # q6c: 1=VOTE FOR 2=VOTE AGAINST 3=CANT SAY 4=NOT STATED 99=BLANKS
      bri_soim_004 = recode_values(q6c, 1 ~ 1, 2 ~ 0, c(3, 4, 99) ~ 9999),

      # Death penalty deters murder
      # q6b: 1=YES 2=NO 3=DONT KNOW 4=NOT STATED
      gal_soim_014 = recode_values(q6b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-521-1-E-1987-05_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-521-1-E-1987-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-521-1-E-1987-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Rights better protected post-Charter
      # q8b: 1=BETTER 2=NOT AS WELL 3=ABOUT THE SAME 4=DONT KNOW 99=BLANKS
      gal_soim_015 = recode_values(q8b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 99) ~ 9999)
    )
  }
)

# cipo-522-1-E-1987-06_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-522-1-E-1987-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-522-1-E-1987-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Approve Quebec distinct society
      # q10d: 1=APPROVE 2=DISAPPROVE 11=NOT STATED
      bri_idim_009 = recode_values(q10d, 1 ~ 1, 2 ~ 0, 11 ~ 9999),

      # Buy back 51% control of US firms
      # q3b: 1=APPROVE 2=DISAPPROVE 3=QUALIFIED 11=NOT STATED
      gal_econ_008 = recode_values(q3b, 1 ~ 1, 2 ~ -1, 3 ~ 0, 11 ~ 9999),

      # US capital in Cda: enough or more
      # q3a: 1=ENOUGH NOW 2=LIKE TO SEE MORE 11=NOT STATED 99=BLANKS
      gal_econ_003 = recode_values(q3a, 1 ~ 0, 2 ~ 1, c(11, 99) ~ 9999)
    )
  }
)

# cipo-523-2-E-1987-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-523-2-E-1987-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-523-2-E-1987-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Postal workers right to strike
      # q3a: 1=YES, SHOULD 2=NO, SHOULD NOT 11=NOT STATED
      gal_hwps_008 = recode_values(q3a, 1 ~ 1, 2 ~ 0, 11 ~ 9999),

      # Satisfaction: prov medical care plan
      # q1a: 1=VERY SATISFIED 2=QUITE SATISFIED 3=NOT TOO SATISFIED 4=NOT SATISFIED 11=NOT STATED
      gal_hwps_010 = recode_values(q1a, c(1, 2) ~ 1, c(3, 4) ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-525-1-E-1987-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-525-1-E-1987-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-525-1-E-1987-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Senate: abolish vs elect vs keep
      # q13a: 1=STAY SAME 2=ELECT SENATE 3=REMOVE SENATE 11=NOT STATED
      gal_dpin_002 = recode_values(q13a, 1 ~ 0, 2 ~ 1, 3 ~ 2, 11 ~ 9999),

      # Canada better/worse off w free trade
      # q10: 1=BETTER 2=WORSE 11=NOT STATED
      gal_econ_006 = recode_values(q10, 1 ~ 1, 2 ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-526-1-E-1987-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-526-1-E-1987-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-526-1-E-1987-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Child care: govt or family resp
      # q9: 1=MOTHER-FAMILY 2=GOVERNMENT 3=QUALIFIED 11=NOT STATED 99=BLANKS
      gal_hwps_005 = recode_values(q9, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-528-1-E-1987-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-528-1-E-1987-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-528-1-E-1987-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Keep Queen/King vs republic
      # q7: 1=ALLEGIANCE TO QUEEN 2=BECOME REPUBLIC 11=NOT STATED
      gal_intd_003 = recode_values(q7, 1 ~ 1, 2 ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-531-1-E-1988-03_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-531-1-E-1988-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-531-1-E-1988-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Permit US cruise missile testing
      # q7b: 1=SHOULD PERMIT 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_intd_005 = recode_values(q7b, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Immigration: increase/decrease level
      # q11: 1=INCREASE 2=DECREASE 3=SAME LEVEL 4=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_idim_004 = recode_values(q11, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 11, 99) ~ 9999),

      # Increase or stop nuclear generation
      # q8: 1=INCREASE 2=STAY THE SAME 3=STOP DEVEL. 4=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_ener_001 = recode_values(q8, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 11, 99) ~ 9999)
    )
  }
)

# cipo-532-1-E-1988-04_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-532-1-E-1988-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-532-1-E-1988-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Approve Quebec distinct society
      # q1d: 1=APPROVE 2=DISAPPROVE 3=CANT SAY 11=NOT STATED 99=BLANKS
      bri_idim_009 = recode_values(q1d, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals as prison officers
      # q9g: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_016 = recode_values(q9g, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals as salespeople
      # q9e: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_017 = recode_values(q9e, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals in armed forces
      # q9f: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_018 = recode_values(q9f, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals as clergy
      # q9b: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_019 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals as doctors
      # q9d: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_020 = recode_values(q9d, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals adopt children
      # q10d: 1=YES 2=NO 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_021 = recode_values(q10d, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Homosexuals as MPs
      # q9c: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_soim_022 = recode_values(q9c, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999)
    )
  }
)

# cipo-533-1-E-1988-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-533-1-E-1988-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-533-1-E-1988-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q10a: 1=LEGAL ALWAYS 2=LEGAL, CONDITIONS 3=ILLEGAL 4=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_soim_005 = recode_values(q10a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 11, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q9a: 1=BETTER OFF 2=WORSE OFF 3=CANT SAY 11=NOT STATED 99=BLANKS
      gal_econ_006 = recode_values(q9a, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999)
    )
  }
)

# cipo-806-1-E-1988-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-806-1-E-1988-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-806-1-E-1988-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada become part of US
      # q12b: 1=APPROVE 2=DISAPPROVE 3=DONT KNOW 11=NOT STATED 12=CANT SAY 99=BLANKS
      bri_intd_002 = recode_values(q12b, 1 ~ 1, 2 ~ -1, c(3, 11, 12, 99) ~ 9999),

      # Abortion legal in all/some/no cases
      # q7a: 1=LEGAL ALWAYS 2=LEGAL SOMETIMES 3=ILLEGAL 4=DONT KNOW 11=NOT STATED 12=CANT SAY 99=BLANKS
      bri_soim_005 = recode_values(q7a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 11, 12, 99) ~ 9999),

      # US capital in Cda: enough or more
      # q5: 1=ENOUGH 2=LIKE MORE 3=DONT KNOW 11=NOT STATED 12=CANT SAY 99=BLANKS
      gal_econ_003 = recode_values(q5, 1 ~ 0, 2 ~ 1, c(3, 11, 12, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q10: 0=WILD CODE 1=BETTER OFF 2=WORSE OFF 3=DONT KNOW 11=NOT STATED 12=CANT SAY 99=BLANKS
      gal_econ_006 = recode_values(q10, 0 ~ 9999, 1 ~ 1, 2 ~ 0, c(3, 11, 12, 99) ~ 9999)
    )
  }
)

# cipo-807-1-E-1988-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-807-1-E-1988-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-807-1-E-1988-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Compulsory military training at 18
      # q9a: 1=FAVOUR 2=OPPOSE 3=NO OPINION 11=NOT STATED 99=BLANKS
      bri_intd_001 = recode_values(q9a, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Compulsory military training: women
      # q9b: 1=FAVOUR 2=OPPOSE 3=NO OPINION 11=NOT STATED 99=BLANKS
      gal_intd_004 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999)
    )
  }
)

# cipo-808-1-E-1988-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-808-1-E-1988-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-808-1-E-1988-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Senate: abolish vs elect vs keep
      # q15a: 1=CONTINUE SAME 2=ELECT SENATORS 3=ABOLISH SENATE 4=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_dpin_002 = recode_values(q15a, 1 ~ 0, 2 ~ 1, 3 ~ 2, c(4, 11, 99) ~ 9999)
    )
  }
)

# cipo-808-2-E-1988-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-808-2-E-1988-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-808-2-E-1988-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed spending poorer regions: up/down
      # q3: 1=INCREASE 2=DECREASE 3=SAME LEVEL 4=BE ELIMINATED 5=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_hwps_005 = recode_values(q3, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ -1, c(5, 11, 99, 12) ~ 9999)
    )
  }
)

# cipo-809-1-E-1988-09_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-809-1-E-1988-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-809-1-E-1988-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q7a: 1=ALWAYS LEGAL 2=SOMETIMES LEGAL 3=ILLEGAL 4=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_soim_005 = recode_values(q7a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q5a: 1=BETTER OFF 2=WORSE OFF 3=CANT SAY 11=NOT STATED 99=BLANKS
      gal_econ_006 = recode_values(q5a, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Public school discipline too strict
      # q1b: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CANT SAY 11=NOT STATED 99=BLANKS
      gal_hwps_003 = recode_values(q1b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 11, 99) ~ 9999),

      # High school discipline too strict
      # q1c: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=CANT SAY 11=NOT STATED 99=BLANKS
      gal_hwps_004 = recode_values(q1c, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 11, 99) ~ 9999)
    )
  }
)

# cipo-765t-E-1988-10_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-765t-E-1988-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-765t-E-1988-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Concern: the environment
      # q6f: 1=VERY CONCERNED 2=QUITE CONCERNED 3=NOT TOO CONCERNED 4=NOT AT ALL 5=DONT KNOW 6=NOT STATED
      gal_ener_002 = recode_values(q6f, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: cost of housing
      # q6b: 1=VERY CONCERNED 2=QUITE CONCERNED 3=NOT TOO CONCERNED 4=NOT AT ALL 5=DONT KNOW 6=NOT STATED
      gal_econ_016 = recode_values(q6b, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-767t-E-1988-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-767t-E-1988-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-767t-E-1988-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada better/worse off w free trade
      # q9: 1=BETTER OFF 2=WORSE OFF 3=CANT SAY 4=WILD CODE
      gal_econ_006 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-811-2-E-1988-11_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-811-2-E-1988-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-811-2-E-1988-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada become part of US
      # q17: 1=APPROVE 2=DISAPPROVE 3=DONT KNOW 4=NOT STATED 11=NOT STATED 2 99=BLANKS
      bri_intd_002 = recode_values(q17, 1 ~ 1, 2 ~ -1, c(3, 4, 11, 99) ~ 9999)
    )
  }
)

# cipo-811-3-E-1988-11_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-811-3-E-1988-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-811-3-E-1988-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Canada become part of US
      # qii14: 1=APPROVE 2=DISAPPROVE 3=DONT KNOW 4=NOT STATED 11=REFUSED 99=BLANKS
      bri_intd_002 = recode_values(qii14, 1 ~ 1, 2 ~ -1, c(3, 4, 11, 99) ~ 9999),

      # Canada better/worse off w free trade
      # qii15: 1=BETTER OFF 2=WORSE OFF 3=CANT SAY 4=NOT STATED 11=REFUSED 99=BLANKS
      gal_econ_006 = recode_values(qii15, 1 ~ 1, 2 ~ 0, c(3, 4, 11, 99) ~ 9999)
    )
  }
)

# cipo-812-1-E-1988-12_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-812-1-E-1988-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-812-1-E-1988-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Priority: balance budget vs unemploy
      # q14: 1=BALANCE BUDGET 2=UNEMPLOYMENT 3=DONT KNOW 11=NOT STATED 99=BLANKS
      bri_econ_007 = recode_values(q14, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Concern: federal deficit
      # q15a: 1=VERY CONCERNED 2=QUITE CONCERNED 3=NOT TOO CONCERNED 4=NOT CONCERNED 5=DONT KNOW 11=NOT STATED 99=BLANKS
      gal_econ_015 = recode_values(q15a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 11, 99) ~ 9999)
    )
  }
)

# cipo-902-2-E-1989-02_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-902-2-E-1989-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-902-2-E-1989-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Admit more or fewer refugees
      # q2b: 1=ACCEPT MORE 2=ACCEPT FEWER 3=NO CHANGE 11=DONT KNOW 99=BLANK
      bri_idim_008 = recode_values(q2b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 99) ~ 9999),

      # Abortion legal in all/some/no cases
      # q3a: 1=ANY CIRCUMSTANCE 2=SOME CIRCUMSTANCE 3=ILLEGAL IN ALL 11=DONT KNOW 99=BLANK
      bri_soim_005 = recode_values(q3a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 99) ~ 9999),

      # Unemployment benefits too high/low
      # qq5b: 1=TOO HIGH 2=TOO LOW 3=JUST RIGHT 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_hwps_006 = recode_values(qq5b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Appr local police performance
      # q6a: 1=APPROVE 2=DISAPPROVE 3=DONT KNOW 11=REFUSED 12=NOT STATED 99=BLANK
      gal_soim_012 = recode_values(q6a, 1 ~ 1, 2 ~ 0, c(3, 11, 12, 99) ~ 9999),

      # Police prejudice vs racial minorities
      # q6b: 1=YES 2=NO 11=DONT KNOW 99=BLANK
      gal_idim_008 = recode_values(q6b, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-903-1-E-1989-03_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-903-1-E-1989-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-903-1-E-1989-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Labour unions too powerful
      # qq8b: 1=TOO POWERFUL 2=NOT POWERFUL ENOUGH 3=ABOUT RIGHT 11=DONT KNOW 99=BLANK - DNS
      bri_econ_003 = recode_values(qq8b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 99) ~ 9999),

      # Workers should have right to strike
      # qq2a: 1=YES, SHOULD 2=NO, SHOULD NOT 11=UNDECIDED 99=BLANK - NS
      bri_hwps_002 = recode_values(qq2a, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Mandatory retirement at 65 good idea
      # qq12: 1=GOOD IDEA 2=NOT A GOOD IDEA 11=DONT KNOW 99=BLANK - DNS
      bri_hwps_003 = recode_values(qq12, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Permit US cruise missile testing
      # q7: 1=SHOULD PERMIT 2=SHOULD NOT 11=DONT KNOW 99=BLANK - DNS
      gal_intd_005 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Senate: abolish vs elect vs keep
      # q5: 1=PRESENT SYSTEM 2=ELECT SENATORS 3=ABOLISH SENATE 11=DONT KNOW 99=BLANK - DNS
      gal_dpin_002 = recode_values(q5, 1 ~ 0, 2 ~ 1, 3 ~ 2, c(11, 99) ~ 9999),

      # Essential services right to strike
      # qq2b: 1=YES, SHOULD 2=NO, SHOULD NOT 11=UNDECIDED 99=BLANK - NS
      gal_hwps_002 = recode_values(qq2b, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Unions a good/bad thing for Cda
      # qq8a: 1=GOOD THING 2=BAD THING 11=DONT KNOW 99=BLANK - DNS
      gal_econ_014 = recode_values(qq8a, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Satisfaction: prov medical care plan
      # q4a: 1=VERY SATISFIED 2=QUITE SATISFIED 3=NOT TOO SATISFIED 4=NOT AT ALL SATISFIED 11=DONT KNOW 99=BLANK - DNS
      gal_hwps_010 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-904-1-E-1989-04_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-904-1-E-1989-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-904-1-E-1989-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # qqq1: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT SERIOUS 11=DONT KNOW 99=BLANK
      bri_hwps_008 = recode_values(qqq1, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Privatize govt-controlled companies
      # qq11h: 1=AGREE STRONGLY 2=AGREE SOMEWHAT 3=DISAGREE SOMEWHAT 4=DISAGREE STRONGLY 11=DONT KNOW 99=BLANK
      gal_econ_022 = recode_values(qq11h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Govt responsibility: solve hunger
      # qqq2a: 1=NO RESPONSIBILITY 2=LITTLE RESPONS. 3=SOME RESPONSIBILITY 4=GREAT DEAL RESPONS. 11=DONT KNOW 99=BLANK
      gal_hwps_014 = recode_values(qqq2a, c(1, 2) ~ 0, c(3, 4) ~ 1, c(11, 99) ~ 9999),

      # Compulsory military training: women
      # q5b: 1=WOULD FAVOUR 2=WOULD OPPOSE 11=DONT KNOW 99=BLANK
      gal_intd_004 = recode_values(q5b, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-906-2-E-1989-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-906-2-E-1989-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-906-2-E-1989-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Teachers paid too little
      # q4b: 1=PAID TOO LITTLE 2=PAID TOO MUCH 3=THE RIGHT AMOUNT 11=DONT KNOW 99=BLANK
      bri_hwps_001 = recode_values(q4b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 99) ~ 9999),

      # Approve Quebec distinct society
      # q3b: 1=APPROVE 2=DISAPPROVE 11=CANT SAY 99=BLANK
      bri_idim_009 = recode_values(q3b, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Doctors may end life: mercy killing
      # q11: 1=YES, SHOULD 2=NO, SHOULD NOT 3=QUALIFIED 11=UNDECIDED 99=BLANK
      bri_soim_003 = recode_values(q11, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 99) ~ 9999),

      # Meech Lake good for Canada
      # q3c: 1=GOOD THING 2=NOT A GOOD THING 11=CANT SAY 99=BLANK
      gal_idim_009 = recode_values(q3c, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-908-2-E-1989-08_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-908-2-E-1989-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-908-2-E-1989-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q5: 1=TOO HIGH 2=ABOUT RIGHT 3=CANT SAY 11=DID NOT STATE 99=BLANK
      gal_econ_009 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(3, 11, 99) ~ 9999),

      # Fed spending poorer regions: up/down
      # qq7a: 1=YES, MORE 2=REMAIN THE SAME 3=NO, LESS 4=BE ELIMINATED 11=DONT KNOW 99=BLANK
      bri_hwps_005 = recode_values(qq7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, c(11, 99) ~ 9999),

      # Abortion legal in all/some/no cases
      # q6a: 1=ANYTIME 2=SOMETIMES 3=ILLEGAL ALWAYS 11=DONT KNOW 99=BLANK
      bri_soim_005 = recode_values(q6a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-909-1-E-1989-09_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-909-1-E-1989-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-909-1-E-1989-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # In favour of FTA with US or not
      # q12: 1=FAVOUR 2=OPPOSED 11=DONT KNOW 99=BLANK
      gal_econ_019 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: water quality
      # q14#1: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANK
      bri_ener_006 = recode_values(`q14#1`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # QC special status, more powers
      # q4: 1=YES 2=NO 11=DONT KNOW 99=BLANK
      gal_idim_007 = recode_values(q4, 1 ~ 1, 2 ~ -1, c(11, 12, 99) ~ 9999),

      # Unions a good/bad thing for Cda
      # q2: 1=GOOD THING 2=BAD THING 11=DONT KNOW 99=BLANK
      gal_econ_014 = recode_values(q2, 1 ~ 1, 2 ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: air quality
      # q14#2: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANK
      gal_ener_003 = recode_values(`q14#2`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Concern: greenhouse effect
      # q14#6: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANK
      gal_ener_005 = recode_values(`q14#6`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Concern: ozone layer depletion
      # q14#7: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANK
      gal_ener_004 = recode_values(`q14#7`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999)
    )
  }
)

# cipo-910-1-E-1989-10_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-910-1-E-1989-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-910-1-E-1989-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # qq6: 1=TOO HIGH 2=ABOUT RIGHT 11=CANT SAY 99=BLANK
      gal_econ_009 = recode_values(qq6, 1 ~ 1, 2 ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: federal deficit
      # qq8: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANK
      gal_econ_015 = recode_values(qq8, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q7a: 1=BETTER OFF 2=WORST OFF 11=CANT SAY
      gal_econ_006 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Free trade creating more jobs (now)
      # q8a: 1=YES 2=NO 11=DONT KNOW 99=BLANK
      gal_econ_020 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Free trade threatens Cdn culture (now)
      # q8b: 1=YES 2=NO 11=DONT KNOW 99=BLANK
      gal_intd_006 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Free trade benefits you/family (now)
      # q8c: 1=YES 2=NO 11=DONT KNOW 99=BLANK
      gal_econ_021 = recode_values(q8c, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Unions a good/bad thing for Cda
      # qq12: 1=GOOD THING 2=BAD THING 11=DONT KNOW 99=BLANK
      gal_econ_014 = recode_values(qq12, 1 ~ 1, 2 ~ 0, c(11, 99, 12) ~ 9999),

      # Keep Queen/King vs republic
      # q3: 1=SHOULD PAY 2=BECOME REPUBLIC 11=CANT SAY 99=BLANK
      gal_intd_003 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(11, 99, 12) ~ 9999)
    )
  }
)

# cipo-911-2-E-1989-11_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-911-2-E-1989-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-911-2-E-1989-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Approve Quebec distinct society
      # q7c: 1=APPROVE 2=DISAPPROVE 11=DONT KNOW 99=BLANK
      bri_idim_009 = recode_values(q7c, 1 ~ 1, 2 ~ 0, c(11, 99) ~ 9999),

      # Govt treats Indigenous well/badly
      # q6: 1=WELL TREATED 2=BADLY TREATED 3=FAIRLY TREATED 11=CANT SAY 99=BLANK
      bri_idim_003 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 99, 12) ~ 9999),

      # Meech Lake good for Canada
      # q7b: 1=GOOD THING 2=DISAPPROVE 11=CANT SAY 99=BLANK
      gal_idim_009 = recode_values(q7b, 1 ~ 1, 2 ~ 0, c(11, 99, 12) ~ 9999)
    )
  }
)

# cipo-912-1-E-1989-12_F1.tab -- Gallup, 10 questions
survey(
  survey_id = "cipo-912-1-E-1989-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-912-1-E-1989-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Worry about nuclear war
      # qq1m: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      bri_intd_003 = recode_values(qq1m, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99) ~ 9999),

      # Favour Quebec separation
      # qq4a: 1=IN FAVOR 2=OPPOSED 3=QUALIFIED 11=UNDECIDED 99=BLANK
      bri_idim_002 = recode_values(qq4a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Abortion legal in all/some/no cases
      # qq3a: 1=LEGAL ALWAYS 2=CERTAIN CIRCUMSTANCE 3=ALWAYS ILLEGAL 11=DONT  KNOW 99=BLANKS
      bri_soim_005 = recode_values(qq3a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 99, 12) ~ 9999),

      # Senate: abolish vs elect vs keep
      # q5b: 1=PRESENT SYSTEM 2=ELECT SENATORS 3=DO AWAY WITH 11=DONT KNOW 99=BLANKS
      gal_dpin_002 = recode_values(q5b, 1 ~ 0, 2 ~ 1, 3 ~ 2, c(11, 12, 99) ~ 9999),

      # Concern: fed govt growth
      # qq1l: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_econ_017 = recode_values(qq1l, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: federal deficit
      # qq1h: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_econ_015 = recode_values(qq1h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: govt taxation levels
      # qq1j: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_econ_018 = recode_values(qq1j, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: the environment
      # qq1a: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_ener_002 = recode_values(qq1a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: cost of housing
      # qq1d: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_econ_016 = recode_values(qq1d, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999),

      # Concern: treatment of Natives
      # qq1i: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 99=BLANKS
      gal_idim_010 = recode_values(qq1i, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 99, 12) ~ 9999)
    )
  }
)

# cipo-002-1-E-1990-02_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-002-1-E-1990-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-002-1-E-1990-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # In favour of FTA with US or not
      # q11: 1=FAVOUR 2=OPPOSE 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_019 = recode_values(q11, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Cut taxes vs keep up govt spending
      # q9: 1=CUT TAXES 2=LEAVE AS IS 3=NEW SERVICES 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_econ_004 = recode_values(q9, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(11, 12, 99) ~ 9999),

      # Permit US cruise missile testing
      # q7: 1=SHOULD PERMIT 2=SHOULD NOT 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_intd_005 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Approve Quebec distinct society
      # q13c: 1=APPROVE 2=DISAPPROVE 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_009 = recode_values(q13c, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q13b: 1=GOOD THING 2=NOT GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q13b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-003-1-E-1990-03_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-003-1-E-1990-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-003-1-E-1990-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Approve Quebec distinct society
      # q16c: 1=APPROVE 2=DISAPROVE 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_009 = recode_values(q16c, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # US capital in Cda: enough or more
      # q12: 1=ENOUGH NOW 2=LIKE TO SEE MORE 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_003 = recode_values(q12, 1 ~ 0, 2 ~ 1, c(11, 12, 99) ~ 9999),

      # Privatize govt-controlled companies
      # q11h: 1=STRONGLY AGREE 2=SOMEWHAT AGREE 3=SOMEWHAT DISAGREE 4=STRONGLY DISAGREE 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_022 = recode_values(q11h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q16b: 1=GOOD THING 2=NOT A GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q16b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-004-1-E-1990-04_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-004-1-E-1990-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-004-1-E-1990-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Accept nuclear plant in your area
      # q5: 1=AGREE TO IT 2=FEEL ANXIOUS 3=WOULD OPPOSE IT 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_ener_002 = recode_values(q5, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(11, 12, 99) ~ 9999),

      # Hunger serious problem in Canada
      # q1a: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT SERIOUS 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_hwps_008 = recode_values(q1a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Favour Quebec separation
      # q14: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_002 = recode_values(q14, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # QC special status, more powers
      # q7e: 1=YES 2=NO 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_007 = recode_values(q7e, 1 ~ 1, 2 ~ -1, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q7b: 1=GOOD THING 2=NOT GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q7b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-005-1-E-1990-05_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-005-1-E-1990-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-005-1-E-1990-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q7: 1=IN FAVOUR 2=OPPOSED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_023 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Approve Quebec distinct society
      # q8d: 1=APPROVE 2=DISAPPROVE 11=CANT SAY 12=NOT STATED 99=BLANK
      bri_idim_009 = recode_values(q8d, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q8b: 1=GOOD THING 2=NOT A GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-006-1-E-1990-06_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-006-1-E-1990-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-006-1-E-1990-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Worry about nuclear war
      # q6m: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_intd_003 = recode_values(q6m, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Favour Quebec separation
      # q9: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: fed govt growth
      # q6l: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_017 = recode_values(q6l, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: federal deficit
      # q6h: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_015 = recode_values(q6h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: rate of inflation
      # q6o: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_024 = recode_values(q6o, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: govt taxation levels
      # q6j: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_018 = recode_values(q6j, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: the environment
      # q6a: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_ener_002 = recode_values(q6a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: cost of housing
      # q6d: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_016 = recode_values(q6d, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q8b: 1=GOOD THING 2=NOT GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-006-2-E-1990-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-006-2-E-1990-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-006-2-E-1990-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q6: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_002 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Meech Lake good for Canada
      # q5: 1=GOOD THING 2=NOT GOOD THING 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_idim_009 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-007-2-E-1990-07_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-007-2-E-1990-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-007-2-E-1990-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q12: 1=ARE 2=ARE NOT 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_econ_002 = recode_values(q12, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-008-E-1990-08_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-008-E-1990-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-008-E-1990-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt treats Indigenous well/badly
      # q6a: 1=WELL TREATED 2=BADLY TREATED 3=FAIRLY TREATED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_idim_003 = recode_values(q6a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Doctors may end life: mercy killing
      # q4: 1=YES, SHOULD 2=NO, SHOULD NOT 3=QUALIFIED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_soim_003 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Vote for reinstating death penalty
      # q11b: 1=VOTE FOR 2=VOTE AGAINST 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_soim_004 = recode_values(q11b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Death penalty deters murder
      # q11a: 1=YES 2=NO, DOES NOT 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_soim_014 = recode_values(q11a, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-009-2-E-1990-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-009-2-E-1990-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-009-2-E-1990-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q11a: 1=YES, ANY 2=ONLY CERTAIN 3=ILLEGAL IN ALL 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_soim_005 = recode_values(q11a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-010-2-E-1990-10_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-010-2-E-1990-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-010-2-E-1990-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Senate: abolish vs elect vs keep
      # q7a: 1=PRESENT SYSTEM 2=ELECT SENATORS 3=ABOLISH SENATE 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_dpin_002 = recode_values(q7a, 1 ~ 0, 2 ~ 1, 3 ~ 2, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-011-E-1990-11_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-011-E-1990-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-011-E-1990-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # In favour of FTA with US or not
      # q7a: 1=FAVOUR 2=OPPOSED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_019 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Canada become part of US
      # q9: 1=APPROVE 2=DISAPPROVE 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_intd_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, c(11, 12, 99) ~ 9999),

      # Canada better/worse off w free trade
      # q10: 1=BETTER OFF 2=WORSE OFF 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_006 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Free trade creating more jobs (now)
      # q8a: 1=YES 2=NO 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_020 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Free trade threatens Cdn culture (now)
      # q8b: 1=YES 2=NO 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_intd_006 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999),

      # Free trade benefits you/family (now)
      # q8c: 1=YES 2=NO 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_021 = recode_values(q8c, 1 ~ 1, 2 ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-012-1-E-1990-12_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-012-1-E-1990-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-012-1-E-1990-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt spending: welfare
      # q5a: 1=TOO MUCH 2=TOO LITTLE 3=RIGHT AMOUNT 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_hwps_004 = recode_values(q5a, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(11, 12, 99) ~ 9999),

      # Worry about nuclear war
      # q12m: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      bri_intd_003 = recode_values(q12m, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: fed govt growth
      # q12l: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_017 = recode_values(q12l, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: federal deficit
      # q12h: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_015 = recode_values(q12h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: rate of inflation
      # q12o: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_024 = recode_values(q12o, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: govt taxation levels
      # q12j: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_018 = recode_values(q12j, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: the environment
      # q12a: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_ener_002 = recode_values(q12a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999),

      # Concern: cost of housing
      # q12d: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 11=DONT KNOW 12=NOT STATED 99=BLANK
      gal_econ_016 = recode_values(q12d, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12, 99) ~ 9999)
    )
  }
)

# cipo-101-1-E-1991-01_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-101-1-E-1991-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-101-1-E-1991-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Cdn economy if Quebec separates
      # q11: 1=BETTER OFF 2=WORSE OFF 3=NO EFFECT 11=DONT KNOW 12=NOT STATED
      gal_idim_012 = recode_values(q11, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999),

      # Que economy if Quebec separates
      # q10: 1=BETTER OFF 2=WORSE OFF 3=NO EFFECT 11=DONT KNOW 12=NOT STATED
      gal_idim_013 = recode_values(q10, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-102-E-1991-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-102-E-1991-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-102-E-1991-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation
      # q4: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED RESPONSE 11=UNDECIDED 12=NOT STATED
      bri_idim_002 = recode_values(q4, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-103-2-E-1991-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-103-2-E-1991-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-103-2-E-1991-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q3: 1=FAVOUR 2=OPPOSE
      gal_econ_023 = recode_values(q3, 1 ~ 1, 2 ~ 0, 7 ~ 9999)
    )
  }
)

# cipo-104-1-E-1991-04_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-104-1-E-1991-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-104-1-E-1991-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # q1a: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT SERIOUS 11=DONT KNOW
      bri_hwps_008 = recode_values(q1a, c(1, 2) ~ 1, c(3, 4) ~ 0, 11 ~ 9999),

      # Sunday retail sales: allow/special
      # q11: 1=YES, SHOULD 2=SPECIAL CIRCUMSTANCE 3=NO, SHOULD NOT 11=DONT KNOW
      gal_soim_013 = recode_values(q11, 1 ~ 2, 2 ~ 1, 3 ~ 0, 11 ~ 9999),

      # Rights better protected post-Charter
      # q6: 1=BETTER 2=NOT AS WELL 3=ABOUT THE SAME 11=DONT KNOW 12=NOT STATED
      gal_soim_015 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-105-1-E-1991-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-105-1-E-1991-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-105-1-E-1991-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q5a: 1=LEGAL AT ALL TIMES 2=LEGAL CERTAIN TIMES 3=ILLEGAL ALL TIMES 11=DONT KNOW 12=NOT STATED
      bri_soim_005 = recode_values(q5a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(11, 12) ~ 9999),

      # Bilingualism success or failure
      # q6: 1=A SUCCESS 2=A FAILURE 11=DONT KNOW
      gal_idim_011 = recode_values(q6, 1 ~ 1, 2 ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-106-2-E-1991-06_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-106-2-E-1991-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-106-2-E-1991-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q5: 1=INCREASE 2=DECREASE 3=STAY SAME 11=DONT KNOW 12=NOT STATED
      bri_idim_004 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999),

      # Approve Quebec distinct society
      # q9b: 1=APPROVE 2=DISAPPROVE 11=DONT KNOW 12=NOT STATED
      bri_idim_009 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Govt treats Indigenous well/badly
      # q8: 1=WELL TREATED 2=BADLY TREATED 3=FAIRLY TREATED 11=CANT SAY
      bri_idim_003 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-107-2-E-1991-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-107-2-E-1991-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-107-2-E-1991-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Keep monarch as head of state
      # q1: 1=YES, CONTINUE 2=NO, DISCONTINUE TIES 11=DONT KNOW 12=NOT STATED
      bri_intd_008 = recode_values(q1, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Better health system: Cda or US
      # q11c: 1=CANADA 2=UNITED STATES 3=BOTH/EQUAL 11=DONT KNOW
      gal_hwps_015 = recode_values(q11c, 1 ~ 1, 2 ~ -1, 3 ~ 0, 11 ~ 9999),

      # Cost of health care very high/low
      # q11b: 1=VERY HIGH 2=HIGH 3=ABOUT RIGHT 4=LOW 5=VERY LOW 11=DONT KNOW 12=NOT STATED
      gal_hwps_016 = recode_values(q11b, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(11, 12) ~ 9999),

      # Homosexuals adopt children
      # q8b: 1=YES, SHOULD 2=NO, SHOULD NOT 11=DONT KNOW 12=NOT STATED
      gal_soim_021 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-108-1-E-1991-08_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-108-1-E-1991-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-108-1-E-1991-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed spending poorer regions: up/down
      # q7a: 1=INCREASE 2=REMAIN THE SAME 3=DECREASE 4=BE ELIMINATED 11=DONT KNOW 99=BLANK
      bri_hwps_005 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, c(11, 99) ~ 9999),

      # More prov funding: high schools
      # q1b: 1=FAVOUR 2=OPPOSE 11=DONT KNOW 12=NOT STATED
      gal_hwps_011 = recode_values(q1b, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # More prov funding: post-secondary
      # q1c: 1=FAVOUR 2=OPPOSE 11=DONT KNOW 12=NOT STATED
      gal_hwps_012 = recode_values(q1c, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # More prov funding: public schools
      # q1a: 1=FAVOUR 2=OPPOSE 11=DONT KNOW 12=NOT STATED
      gal_hwps_013 = recode_values(q1a, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-109-1-E-1991-09_F1.tab -- Gallup, 11 questions
survey(
  survey_id = "cipo-109-1-E-1991-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-109-1-E-1991-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Worry about nuclear war
      # q8b13: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      bri_intd_003 = recode_values(q8b13, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Favour Quebec separation
      # q9: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 11=UNDECIDED 12=NOT STATED
      bri_idim_002 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999),

      # Concern: fed govt growth
      # q8b12: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_econ_017 = recode_values(q8b12, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Concern: federal deficit
      # q8b8: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_econ_015 = recode_values(q8b8, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Concern: rate of inflation
      # q8b15: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_econ_024 = recode_values(q8b15, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Postal workers right to strike
      # q14a: 1=YES, SHOULD 2=NO, SHOULD NOT 11=DONT KNOW 12=NOT STATED
      gal_hwps_008 = recode_values(q14a, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Concern: govt taxation levels
      # q8b10: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_econ_018 = recode_values(q8b10, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Concern: the environment
      # q8b1: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_ener_002 = recode_values(q8b1, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Concern: cost of housing
      # q8b4: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW 12=NOT STATED
      gal_econ_016 = recode_values(q8b4, c(1, 2) ~ 1, c(3, 4) ~ 0, c(11, 12) ~ 9999),

      # Courts harsh on criminals
      # q1: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=ABOUT RIGHT 11=DONT KNOW 12=NOT STATED
      gal_soim_004 = recode_values(q1, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999),

      # Concern: treatment of Natives
      # q8b17: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 11=DONT KNOW
      gal_idim_010 = recode_values(q8b17, c(1, 2) ~ 1, c(3, 4) ~ 0, 11 ~ 9999)
    )
  }
)

# cipo-110-1-E-1991-10_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-110-1-E-1991-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-110-1-E-1991-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # In favour of FTA with US or not
      # q5: 1=FAVOUR 2=OPPOSE 11=DONT KNOW 12=NOT STATED
      gal_econ_019 = recode_values(q5, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # GST necessary or should abolish
      # q10: 1=NECESSARY 2=SHOULD ABOLISH 11=DONT KNOW 12=NOT STATED
      gal_econ_025 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Approve Quebec distinct society
      # q8b: 1=APPROVE 2=DISAPPROVE 11=DONT KNOW 12=NOT STATED
      bri_idim_009 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(11, 12) ~ 9999),

      # Favour Quebec separation
      # q8a: 1=IN FAVOUR 2=OPPOSED 3=QUALIFIED 11=UNDECIDED 12=NOT STATED
      bri_idim_002 = recode_values(q8a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(11, 12) ~ 9999)
    )
  }
)

# cipo-111-1-E-1991-11_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-111-1-E-1991-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-111-1-E-1991-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q9b: 1=HANDLING PROPERLY 2=NOT HANDLING PROPER 3=DONT KNOW 11=NOT STATED
      bri_econ_002 = recode_values(q9b, 1 ~ 1, 2 ~ 0, c(3, 11) ~ 9999),

      # Senate: abolish vs elect vs keep
      # q4: 1=CONTINUE SYSTEM 2=ELECT SENATORS 3=DO AWAY W/ SENATE 4=DONT KNOW 11=NOT STATED
      gal_dpin_002 = recode_values(q4, 1 ~ 0, 2 ~ 1, 3 ~ 2, c(4, 11) ~ 9999)
    )
  }
)

# jun1992_206-1.tab -- Gallup, 1 question
survey(
  survey_id = "jun1992_206-1.tab",
  source    = "Gallup",
  file_name = "jun1992_206-1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q3: 1=Favour 2=Oppose 3=Dont know 4=Not stated
      gal_econ_023 = recode_values(q3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-201-1-E-1992-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-201-1-E-1992-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-201-1-E-1992-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Sunday retail sales: allow/special
      # q1: 1=Yes 2=Yes, special reason 3=No 4=Dont know
      gal_soim_013 = recode_values(q1, 1 ~ 2, 2 ~ 1, 3 ~ 0, 4 ~ 9999)
    )
  }
)

# cipo-202-1-E-1992-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-202-1-E-1992-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-202-1-E-1992-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Satisfaction: prov medical care plan
      # q15: 1=Very satisfied 2=Quite satisfied 3=Not too satisfied 4=Not at all satisfied 5=Dont know 6=Not stated
      gal_hwps_010 = recode_values(q15, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Bilingualism success or failure
      # q9: 1=A success 2=A failure 3=Dont know 4=Not stated
      gal_idim_011 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-203-1-E-1992-03_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-203-1-E-1992-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-203-1-E-1992-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Concern: water quality
      # q1b_a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=Don't know 6=Refused
      bri_ener_006 = recode_values(q1b_a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt spending: welfare
      # q4c: 1=Too much 2=Too little 3=About right 4=Don't know 5=Not stated
      bri_hwps_004 = recode_values(q4c, 0 ~ 9999, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Make welfare recipients work
      # q4a: 1=Favour 2=Oppose 3=Don't know 4=Not stated
      bri_hwps_010 = recode_values(q4a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Approve Quebec distinct society
      # q9: 1=Approve 2=Disapprove 3=Don't know 4=Not stated
      bri_idim_009 = recode_values(q9, 1 ~ 1, 2 ~ 0, c(3, 4, 7) ~ 9999),

      # Concern: air quality
      # q1b_b: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=Don't know 6=Refused
      gal_ener_003 = recode_values(q1b_b, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: greenhouse effect
      # q1b_f: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=Don't know 6=Refused
      gal_ener_005 = recode_values(q1b_f, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: ozone layer depletion
      # q1b_g: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not at all concerned 5=Don't know 6=Refused
      gal_ener_004 = recode_values(q1b_g, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-204-1-E-1992-04_F1.tab -- Gallup, 15 questions
survey(
  survey_id = "cipo-204-1-E-1992-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-204-1-E-1992-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # q1a: 1=Very serious 2=Quite serious 3=Not too serious 4=Not at all serious 5=Dont know 6=Not stated
      bri_hwps_008 = recode_values(q1a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Worry about nuclear war
      # q4b_m: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      bri_intd_003 = recode_values(q4b_m, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: fed govt growth
      # q4b_l: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_econ_017 = recode_values(q4b_l, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: federal deficit
      # q4b_h: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_econ_015 = recode_values(q4b_h, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: rate of inflation
      # q4b_o: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_econ_024 = recode_values(q4b_o, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: govt taxation levels
      # q4b_j: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_econ_018 = recode_values(q4b_j, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: the environment
      # q4b_a: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_ener_002 = recode_values(q4b_a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: cost of housing
      # q4b_d: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_econ_016 = recode_values(q4b_d, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: treatment of Natives
      # q4b_q: 1=Very concerned 2=Somewhat concerned 3=Not very concerned 4=Not concerned 5=Don't know 6=Not stated
      gal_idim_010 = recode_values(q4b_q, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Homosexuals as prison officers
      # q12a_g: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_016 = recode_values(q12a_g, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # q12a_e: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_017 = recode_values(q12a_e, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # q12a_f: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_018 = recode_values(q12a_f, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # q12a_b: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_019 = recode_values(q12a_b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # q12a_d: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_020 = recode_values(q12a_d, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # q12a_c: 1=Support 2=Do not support 3=Don't know 4=Not stated
      gal_soim_022 = recode_values(q12a_c, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-205-1-E-1992-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-205-1-E-1992-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-205-1-E-1992-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q9: 1=Increase 2=Decrease 3=Stay current level 4=Don't know 5=Not stated
      bri_idim_004 = recode_values(q9, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # More power: fed vs prov govts
      # q8: 1=Federal govt 2=Provincial govt 3=Maintain as is 4=Don't know 5=Not stated
      bri_idim_006 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-566t-E-1993-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-566t-E-1993-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-566t-E-1993-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Personal rights protected or in danger
      # q10: 1=FULLY PROTECTED 2=IN DANGER 3=DONT KNOW 4=REFUSED
      bri_soim_001 = recode_values(q10, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-595t-E-1993-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-595t-E-1993-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-595t-E-1993-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q6: 1=IN FAVOUR OF 2=OPPOSED TO 3=DONT KNOW 4=REFUSED
      gal_econ_023 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-597-E-1993-04_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-597-E-1993-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-597-E-1993-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Taxes too high or about right
      # q6: 1=TOO HIGH 2=ABOUT RIGHT 3=DON'T KNOW 4=REFUSED
      gal_econ_009 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-654t-E-1993-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-654t-E-1993-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-654t-E-1993-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Curb inflation vs reduce unemployment
      # govt: 1=CURB INFLATION 2=REDUCE UNEMPLOYMENT 3=DK/REFUSED
      gal_econ_010 = recode_values(govt, 1 ~ 1, 2 ~ 0, 3 ~ 9999)
    )
  }
)

# cipo-655t-E-1993-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-655t-E-1993-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-655t-E-1993-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # hunger: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT REALLY SERIOUS 5=DK/REFUSED
      bri_hwps_008 = recode_values(hunger, c(1, 2) ~ 1, c(3, 4) ~ 0, 5 ~ 9999),

      # Govt responsibility: solve hunger
      # govt: 1=NONE 2=LITTLE 3=SOME 4=A GREAT DEAL 5=DONT KNOW 6=REFUSED
      gal_hwps_014 = recode_values(govt, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-656t-E-1993-06_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-656t-E-1993-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-656t-E-1993-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # abortion: 1=ALWAYS LEGAL 2=SOMETIMES LEGAL 3=ALWAYS ILLEGAL 4=DONT KNOW 5=REFUSED
      bri_soim_005 = recode_values(abortion, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-010t-E-1993-08_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-010t-E-1993-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-010t-E-1993-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed spending poorer regions: up/down
      # q11a: 1=Increase 2=Remain the same 3=Decrease 4=Be eliminated 5=DK/refused
      bri_hwps_005 = recode_values(q11a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, 5 ~ 9999),

      # Better health system: Cda or US
      # q7a: 1=Canada 2=USA 3=Equal 4=Do not know 5=Refused
      gal_hwps_015 = recode_values(q7a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Cost of health care very high/low
      # q7c: 1=Very high 2=High 3=About Right 4=Low 5=Very Low 6=Do not know 7=Refused
      gal_hwps_016 = recode_values(q7c, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7) ~ 9999)
    )
  }
)

# cipo-022z-E-1993-12_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-022z-E-1993-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-022z-E-1993-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q11: 1=Favour 2=Oppose 3=Do not know 4=Refused
      gal_econ_023 = recode_values(q11, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Top priority: deficit vs unemployment
      # q12: 1=Deficit 2=Unemployment 3=Neither 4=Both 5=Do not know 6=Refused
      gal_econ_026 = recode_values(q12, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999),

      # Immigration: increase/decrease level
      # q8: 1=Increase 2=Decrease 3=Stay the same 4=Do not know 5=Refused
      bri_idim_004 = recode_values(q8, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Cdn economy if Quebec separates
      # q9b: 1=be better off 2=be worse off 3=remain the same 4=Do not know 5=Refused
      gal_idim_012 = recode_values(q9b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Que economy if Quebec separates
      # q9c: 1=be better off 2=be worse off 3=remain the same 4=Do not know 5=Refused
      gal_idim_013 = recode_values(q9c, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1994-02_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1994-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Bilingualism success or failure
      # biling: 1=SUCCESS 2=FAILURE 3=DONT KNOW 4=REFUSED
      gal_idim_011 = recode_values(biling, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Vote for reinstating death penalty
      # deathpen: 1=VOTE FOR 2=VOTE AGAINST 3=DONT KNOW 4=REFUSED
      bri_soim_004 = recode_values(deathpen, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Death penalty deters murder
      # murder: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_014 = recode_values(murder, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-03_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1994-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt spending: welfare
      # welspend: 1=TOO MUCH 2=TOO LITTLE 3=ABOUT RIGHT 4=DONT KNOW 5=REFUSED
      bri_hwps_004 = recode_values(welspend, 1 ~ -1, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Make welfare recipients work
      # work4wel: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_hwps_010 = recode_values(work4wel, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-04_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1994-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # que_sep: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(que_sep, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour same-sex marriage
      # samesex: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_soim_011 = recode_values(samesex, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Same benefits for gay couples
      # benefits: 1=SAME BENEFITS 2=NOT SAME BENEFITS 3=DONT KNOW 4=REFUSED
      gal_soim_027 = recode_values(benefits, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-05_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-E-1994-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # handling: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(handling, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # General public allowed to own gun
      # public: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_soim_012 = recode_values(public, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Confidence fed govt: deficit reduction
      # deficit: 1=LOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(deficit, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Police harsh on criminals
      # police: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_023 = recode_values(police, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # courts: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_004 = recode_values(courts, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # federal: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_024 = recode_values(federal, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Gun owner req: psych evaluation
      # pub_ev: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_028 = recode_values(pub_ev, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Firearm sale laws stricter/less
      # firearms: 1=MORE STRICT 2=LESS STRICT 3=KEPT AS ARE NOW 4=DONT KNOW 5=REFUSED
      gal_soim_026 = recode_values(firearms, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1994-06_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-1994-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Concern: water quality
      # q12#a: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 5=DONT KNOW 6=REFUSED
      bri_ener_006 = recode_values(`q12#a`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Hunger serious problem in Canada
      # q4a: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT SERIOUS 5=DONT KNOW 6=REFUSED
      bri_hwps_008 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Favour Quebec separation (referendum)
      # q13: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q13, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Concern: air quality
      # q12#b: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 5=DONT KNOW 6=REFUSED
      gal_ener_003 = recode_values(`q12#b`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: ozone layer depletion
      # q12#g: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 5=DONT KNOW 6=REFUSED
      gal_ener_004 = recode_values(`q12#g`, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # q4b#a: 1=NONE 2=LITTLE 3=SOME 4=A GREAT DEAL 5=DONT KNOW 6=REFUSED
      gal_hwps_014 = recode_values(`q4b#a`, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1994-07_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1994-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # GST necessary or should abolish
      # q8a: 1=NO, NEED REVENUE 2=YES, ABOLISH 3=DONT KNOW 4=REFUSED
      gal_econ_025 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Taxes too high or about right
      # q7c: 1=TOO HIGH 2=ABOUT RIGHT 3=DONT KNOW 4=REFUSED
      gal_econ_009 = recode_values(q7c, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Top priority: deficit vs unemployment
      # q9: 1=REDUCE DEFICIT 2=REDUCE UNEMPLOYMENT 3=NEITHER 4=BOTH 5=DONT KNOW 6=REFUSED
      gal_econ_026 = recode_values(q9, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1994-08_F1.tab -- Gallup, 7 questions
survey(
  survey_id = "cipo-E-1994-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed spending poorer regions: up/down
      # q5a: 1=INCREASE 2=REMAIN THE SAME 3=DECREASE 4=BE ELIMINATED 5=DONT KNOW 6=REFUSED
      bri_hwps_005 = recode_values(q5a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, c(5, 6) ~ 9999),

      # Favour Quebec separation (referendum)
      # q11: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q11, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Public school discipline too strict
      # q8a: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DONT KNOW 5=REFUSED
      gal_hwps_003 = recode_values(q8a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # High school discipline too strict
      # q8b: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DONT KNOW 5=REFUSED
      gal_hwps_004 = recode_values(q8b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # More prov funding: high schools
      # q9#b: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_011 = recode_values(`q9#b`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: post-secondary
      # q9#c: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_012 = recode_values(`q9#c`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: public schools
      # q9#a: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_013 = recode_values(`q9#a`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-09_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-E-1994-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # q8_q: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q8_q, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Better health system: Cda or US
      # q7a: 1=CDA: BETTER 2=USA: BETTER 3=EQUAL 4=DONT KNOW 5=REFUSED
      gal_hwps_015 = recode_values(q7a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Cost of health care very high/low
      # q7c: 1=VERY HIGH 2=HIGH 3=ABOUT RIGHT 4=LOW 5=VERY LOW 6=DONT KNOW 7=REFUSED
      gal_hwps_016 = recode_values(q7c, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7) ~ 9999),

      # Cdn economy if Quebec separates
      # q7a_q: 1=BETTER OFF 2=WORSE OFF 3=REMAIN THE SAME 4=DONT KNOW 5=REFUSED
      gal_idim_012 = recode_values(q7a_q, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Que economy if Quebec separates
      # q7b_q: 1=BETTER OFF 2=WORSE OFF 3=REMAIN THE SAME 4=DONT KNOW 5=REFUSED
      gal_idim_013 = recode_values(q7b_q, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1994-10_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-E-1994-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # q7: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as junior school teachers
      # q4#a: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_025 = recode_values(`q4#a`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as prison officers
      # q4#g: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_016 = recode_values(`q4#g`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # q4#e: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_017 = recode_values(`q4#e`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # q4#f: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_018 = recode_values(`q4#f`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # q4#b: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_019 = recode_values(`q4#b`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # q4#d: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_020 = recode_values(`q4#d`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals adopt children
      # q5b: 1=YES, SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_021 = recode_values(q5b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # q4#c: 1=SHOULD BE 2=SHOULD NOT BE 3=DONT KNOW 4=REFUSED
      gal_soim_022 = recode_values(`q4#c`, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-11_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-1994-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q11: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(q11, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Top priority: deficit vs unemployment
      # q9: 1=REDUCE DEFICIT 2=REDUCE UNEMPLOY 3=NEITHER 4=BOTH 5=DONT KNOW 6=REFUSED
      gal_econ_026 = recode_values(q9, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999),

      # Favour registration of all firearms
      # q14: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_soim_006 = recode_values(q14, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Confidence fed govt: deficit reduction
      # q8: 1=LOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(q8, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: federal deficit
      # q7a: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT CONCERNED 5=DONT KNOW 6=REFUSED
      gal_econ_015 = recode_values(q7a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Police prejudice vs racial minorities
      # q15b: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_idim_008 = recode_values(q15b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1994-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1994-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1994-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # q7a: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1995-01_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1995-01_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-01_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # q7: 1=IN FAVOUR 2=OPPOSED 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q7, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1995-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1995-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour free trade Can-US-Mexico
      # q5a: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_econ_023 = recode_values(q5a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Top priority: deficit vs unemployment
      # q4: 1=REDUCE DEFICIT 2=REDUCE UNEMPLOY. 3=NEITHER 4=BOTH 5=DONT KNOW 6=REFUSED
      gal_econ_026 = recode_values(q4, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1995-05_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-1995-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q6_a: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(q6_a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Immigration: increase/decrease level
      # q4_a: 1=YES 2=NO, DECREASE 3=KEEP THE SAME 4=DONT KNOW 5=REFUSED
      bri_idim_004 = recode_values(q4_a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Confidence fed govt: deficit reduction
      # q6_c: 1=LOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(q6_c, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Police harsh on criminals
      # q9b_a: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_023 = recode_values(q9b_a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q9b_c: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_004 = recode_values(q9b_c, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # q9b_b: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_024 = recode_values(q9b_b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1995-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1995-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # q4a: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT SERIOUS AT ALL 5=DONT KNOW 6=REFUSED
      bri_hwps_008 = recode_values(q4a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Favour registration of all firearms
      # q9_b: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_soim_006 = recode_values(q9_b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Govt responsibility: solve hunger
      # q4b_a: 1=NONE 2=LITTLE 3=SOME 4=A GREAT DEAL 5=DONT KNOW 6=REFUSED
      gal_hwps_014 = recode_values(q4b_a, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999),

      # Firearm sale laws stricter/less
      # q9_a: 1=MORE STRICT 2=LESS STRICT 3=KEPT AS ARE NOW 4=DONT KNOW 5=REFUSED
      gal_soim_026 = recode_values(q9_a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1995-08_F1.tab -- Gallup, 8 questions
survey(
  survey_id = "cipo-E-1995-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # GST necessary or should abolish
      # q7_d: 1=NEED FOR REVENUE 2=ABOLISH GST 3=DONT KNOW 4=REFUSED
      gal_econ_025 = recode_values(q7_d, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Fed spending poorer regions: up/down
      # q5_a: 1=INCREASE 2=REMAIN THE SAME 3=DECREASE 4=BE ELIMINATED 5=DONT KNOW 6=REFUSED
      bri_hwps_005 = recode_values(q5_a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, c(5, 6) ~ 9999),

      # Abortion legal in all/some/no cases
      # q9a: 1=YES, ANY CIRCUMST. 2=UNDER SOME 3=ILLEGAL ALL 4=DONT KNOW 5=REFUSED
      bri_soim_005 = recode_values(q9a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Abortion legal: serious birth defect
      # q9b_a: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_007 = recode_values(q9b_a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: rape or incest
      # q9b_g: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_029 = recode_values(q9b_g, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: within 3 months
      # q9b_f: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_030 = recode_values(q9b_f, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: health endangered
      # q9b_b: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_009 = recode_values(q9b_b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: family low income
      # q9b_d: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_008 = recode_values(q9b_d, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1995-09_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-E-1995-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Better health system: Cda or US
      # q8_a: 1=CANADA BETTER 2=USA BETTER 3=EQUAL 4=DONT KNOW 5=REFUSED
      gal_hwps_015 = recode_values(q8_a, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Cost of health care very high/low
      # q8_c: 1=VERY HIGH 2=HIGH 3=ABOUT RIGHT 4=LOW 5=VERY LOW 6=DONT KNOW 7=REFUSED
      gal_hwps_016 = recode_values(q8_c, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, c(6, 7) ~ 9999),

      # More prov funding: high schools
      # q6_b: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_011 = recode_values(q6_b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: post-secondary
      # q6_c: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_012 = recode_values(q6_c, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: public schools
      # q6_a: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_013 = recode_values(q6_a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1995-10_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1995-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Govt treats Indigenous well/badly
      # q13: 1=WELL-TREATED 2=BADLY TREATED 3=FAIRLY TREATED 4=DONT KNOW 5=REFUSED
      bri_idim_003 = recode_values(q13, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Favour Quebec separation (referendum)
      # q6: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(q6, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Ban cigarette advertising
      # q14: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_002 = recode_values(q14, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1995-11_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1995-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # q7_a: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(q7_a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More power: fed vs prov govts
      # q9: 1=KEEP SHARING AS IS 2=PROV MORE POWER 3=FED GOVT MORE POWER 4=DONT KNOW 5=REFUSED
      bri_idim_006 = recode_values(q9, 1 ~ 0, 2 ~ -1, 3 ~ 1, c(4, 5) ~ 9999),

      # Confidence fed govt: deficit reduction
      # q7_c: 1=ALOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(q7_c, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1995-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1995-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1995-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # q10a: 1=STRONGLY IN FAVOUR 2=SOMEWHAT IN FAVOUR 3=SOMEWHAT OPPOSED 4=STRONGLY OPPOSED 5=DONT KNOW 6=REFUSED
      bri_hwps_012 = recode_values(q10a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1996-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1996-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Top priority: deficit vs unemployment
      # defop: 1=REDUCE DEFICIT 2=REDUCE UNEMPLOYMENT 3=NEITHER 4=BOTH 5=DONT KNOW 6=REFUSED
      gal_econ_026 = recode_values(defop, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # refdp: 1=VOTE FOR 2=VOTE AGAINST 3=DONT KNOW 4=REFUSED
      bri_soim_004 = recode_values(refdp, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1996-05_F1.tab -- Gallup, 5 questions
survey(
  survey_id = "cipo-E-1996-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # GST necessary or should abolish
      # gst: 1=NECESSARY 2=SHOULD ABOLISH 3=DONT KNOW 4=REFUSED
      gal_econ_025 = recode_values(gst, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Immigration: increase/decrease level
      # immig: 1=INCREASED 2=DECREASED 3=CURRENT LEVELS 4=DONT KNOW 5=REFUSED
      bri_idim_004 = recode_values(immig, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Police harsh on criminals
      # pol: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=NOT IN CORRECT WAY 4=DONT KNOW 5=REFUSED
      gal_soim_023 = recode_values(pol, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, 5 ~ NA_real_),

      # Courts harsh on criminals
      # court: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=NOT IN CORRECT WAY 4=DONT KNOW 5=REFUSED
      gal_soim_004 = recode_values(court, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, 5 ~ NA_real_),

      # Fed govt harsh on criminals
      # fedg: 1=TOO HARSHLY 2=NOT HARSH ENOUGH 3=NOT IN CORRECT WAY 4=DONT KNOW 5=REFUSED
      gal_soim_024 = recode_values(fedg, 1 ~ 1, 2 ~ -1, 3 ~ 0, 4 ~ 9999, 5 ~ NA_real_)
    )
  }
)

# cipo-E-1996-06_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1996-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # ecsit: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(ecsit, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Hunger serious problem in Canada
      # hunger: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT REALLY SERIOUS 5=DONT KNOW 6=REFUSED
      bri_hwps_008 = recode_values(hunger, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Confidence fed govt: deficit reduction
      # defhand: 1=LOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(defhand, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # hgov: 1=NONE 2=LITTLE 3=SOME 4=GREAT DEAL 5=DONT KNOW 6=REFUSED
      gal_hwps_014 = recode_values(hgov, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1996-07_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1996-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour Quebec separation (referendum)
      # que: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_005 = recode_values(que, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Rights better protected post-Charter
      # right: 1=BETTER PROTECTED 2=ABOUT THE SAME 3=NOT WELL PROTECTED 4=DONT KNOW 5=REFUSED
      gal_soim_015 = recode_values(right, 1 ~ 1, 2 ~ 0, 3 ~ -1, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1996-08_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1996-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed spending poorer regions: up/down
      # poor: 1=INCREASE 2=REMAIN THE SAME 3=DECREASE 4=BE ELIMINATED 5=DONT KNOW 6=REFUSED
      bri_hwps_005 = recode_values(poor, 1 ~ 1, 2 ~ 0, c(3, 4) ~ -1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1996-09_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1996-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # health2: 1=STRONGLY IN FAVOUR 2=SOMEWHAT IN FAVOUR 3=SOMEWHAT OPPOSED 4=STRONGLY OPPOSED 5=DONT KNOW 6=REFUSED
      bri_hwps_012 = recode_values(health2, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # More prov funding: high schools
      # fundhi: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSE
      gal_hwps_011 = recode_values(fundhi, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: post-secondary
      # fundps: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSE
      gal_hwps_012 = recode_values(fundps, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: public schools
      # fundel: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSE
      gal_hwps_013 = recode_values(fundel, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1996-10_F1.tab -- Gallup, 12 questions
survey(
  survey_id = "cipo-E-1996-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Fed govt handling economy properly
      # hec: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_econ_002 = recode_values(hec, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as junior school teachers
      # hscht: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_025 = recode_values(hscht, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour same-sex marriage
      # marhom: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSE
      bri_soim_011 = recode_values(marhom, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Confidence fed govt: deficit reduction
      # hdef: 1=LOT OF CONFIDENCE 2=SOME CONFIDENCE 3=LITTLE CONFIDENCE 4=NO CONFIDENCE 5=DONT KNOW 6=REFUSED
      gal_econ_027 = recode_values(hdef, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Homosexuals as prison officers
      # hpri: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_016 = recode_values(hpri, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # hsal: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_017 = recode_values(hsal, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # harm: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_018 = recode_values(harm, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # hcler: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_019 = recode_values(hcler, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # hdoc: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_020 = recode_values(hdoc, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Same benefits for gay couples
      # clhomo: 1=SAME BENEFITS 2=NOT SAME BENEFITS 3=DONT KNOW 4=REFUSED
      gal_soim_027 = recode_values(clhomo, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals adopt children
      # adhomo: 1=YES, SHOULD 2=NO , SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_021 = recode_values(adhomo, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # hmop: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_022 = recode_values(hmop, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1996-11_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1996-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1996-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Top priority: deficit vs unemployment
      # defop: 1=REDUCE DEFICIT 2=REDUCE UNEMPLOY. 3=NEITHER 4=BOTH 5=DONT KNOW 6=REFUSED
      gal_econ_026 = recode_values(defop, 1 ~ 2, 2 ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999),

      # Immigration: increase/decrease level
      # immig: 1=SHOULD INCREASE 2=SHOULD DECREASE 3=STAY SAME 4=DONT KNOW 5=REFUSED
      bri_idim_004 = recode_values(immig, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Concern: federal deficit
      # feddef: 1=VERY CONCERNED 2=SOMEWHAT CONCERNED 3=NOT VERY CONCERNED 4=NOT AT ALL CONCERNED 5=DONT KNOW 6=REFUSED
      gal_econ_015 = recode_values(feddef, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1997-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1997-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # hung: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT REALLY SERIOUS 5=DONT KNOW 6=REFUSED
      bri_hwps_008 = recode_values(hung, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # hgov: 1=NONE 2=LITTLE 3=SOME 4=A GREAT DEAL 5=DONT KNOW 6=REFUSED
      gal_hwps_014 = recode_values(hgov, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1997-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1997-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # imm: 1=INCREASE 2=DECREASE 3=KEEP CURRENT LEVEL 4=DONT KNOW 5=REFUSED
      bri_idim_004 = recode_values(imm, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Police harsh on criminals
      # tpol: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=THE CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_023 = recode_values(tpol, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # tcour: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=THE CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_004 = recode_values(tcour, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # tgov: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=THE CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_024 = recode_values(tgov, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1997-08_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1997-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # heal2: 1=STRONGLY FAVOUR 2=SOMEWHAT FAVOUR 3=SOMEWHAT OPPOSED 4=STRONGLY OPPOSED 5=DONT KNOW 6=REFUSED
      bri_hwps_012 = recode_values(heal2, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # exec: 1=VOTE FOR 2=VOTE AGAINST 3=DONT KNOW 4=REFUSED
      bri_soim_004 = recode_values(exec, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1997-09_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1997-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Approve Quebec distinct society
      # queds: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      bri_idim_009 = recode_values(queds, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More power: fed vs prov govts
      # con: 1=REMAIN SAME 2=PROV GIVEN MORE 3=FED GIVEN MORE 4=DONT KNOW 5=REFUSED
      bri_idim_006 = recode_values(con, 1 ~ 0, 2 ~ -1, 3 ~ 1, c(4, 5) ~ 9999),

      # Keep monarch as head of state
      # monarch: 1=CONTINUE 2=DISCONTINUE 3=DONT KNOW 4=REFUSED
      bri_intd_008 = recode_values(monarch, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1997-11_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-E-1997-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # abort: 1=ANY REASON 2=CERTAIN REASONS 3=NO REASONS 4=DONT KNOW 5=REFUSED
      bri_soim_005 = recode_values(abort, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # More prov funding: high schools
      # fundhi: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_011 = recode_values(fundhi, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: post-secondary
      # fundps: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_012 = recode_values(fundps, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # More prov funding: public schools
      # fundel: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_hwps_013 = recode_values(fundel, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: serious birth defect
      # defect: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_007 = recode_values(defect, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: rape or incest
      # rape: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_029 = recode_values(rape, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: within 3 months
      # month3: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_030 = recode_values(month3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: health endangered
      # health: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_009 = recode_values(health, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: family low income
      # loinc: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_008 = recode_values(loinc, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1997-12_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1997-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1997-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Police right to strike
      # sps: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_hwps_009 = recode_values(sps, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Postal workers right to strike
      # spo: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_hwps_008 = recode_values(spo, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-02_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1998-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Quebec right to separate
      # q4b: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_idim_005 = recode_values(q4b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1998-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Legalize marijuana for medical use
      # q10b: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      gal_soim_031 = recode_values(q10b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-04_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-E-1998-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Homosexuals as junior school teachers
      # q7ba: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_025 = recode_values(q7ba, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour same-sex marriage
      # q6a: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      bri_soim_011 = recode_values(q6a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as prison officers
      # q7bg: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_016 = recode_values(q7bg, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # q7be: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_017 = recode_values(q7be, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # q7bf: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_018 = recode_values(q7bf, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # q7bb: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_019 = recode_values(q7bb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # q7bd: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_020 = recode_values(q7bd, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals adopt children
      # q6c: 1=YES SHOULD 2=NO SHOULD NOT 3=REFUSED
      gal_soim_021 = recode_values(q6c, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # q7bc: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_022 = recode_values(q7bc, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-06_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1998-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # q8: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT A PROBLEM 5=DON'T KNOW 6=REFUSED
      bri_hwps_008 = recode_values(q8, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # q9a: 1=NONE 2=LITTLE 3=SOME 4=GREAT DEAL 5=DON'T KNOW 6=REFUSED
      gal_hwps_014 = recode_values(q9a, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1998-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1998-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q6: 1=INCREASED 2=DECREASED 3=KEEP SAME 4=DON'T KNOW 5=REFUSED
      bri_idim_004 = recode_values(q6, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Police harsh on criminals
      # q4da: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_023 = recode_values(q4da, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q4dc: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_004 = recode_values(q4dc, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # q4db: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_024 = recode_values(q4db, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1998-08_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1998-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # q6a: 1=STRONGLY IN FAVOUR 2=SOMEWHAT IN FAVOUR 3=SOMEWHAT OPPOSED 4=STRONGLY OPPOSED 5=DON'T KNOW 6=REFUSED
      bri_hwps_012 = recode_values(q6a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # q7a: 1=VOTE FOR 2=VOTE AGAINST 3=DON'T KNOW 4=REFUSED
      bri_soim_004 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Death penalty deters murder
      # q7d: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_014 = recode_values(q7d, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1998-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Keep monarch as head of state
      # q8a: 1=CONTINUE AS HEAD 2=DISCONTINUE 3=DON'T KNOW 4=REFUSED
      bri_intd_008 = recode_values(q8a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1998-10_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1998-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour registration of all firearms
      # q10a: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      gal_soim_006 = recode_values(q10a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # General public allowed to own gun
      # q10cb: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_soim_012 = recode_values(q10cb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Gun owner req: psych evaluation
      # q10eb: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_028 = recode_values(q10eb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Firearm sale laws stricter/less
      # q10b: 1=MORE STRICT 2=LESS STRICT 3=KEPT AS IS 4=DON'T KNOW 5=REFUSED
      gal_soim_026 = recode_values(q10b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1998-11_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-1998-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1998-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q5a: 1=YES, LEGAL 2=SOMETIMES 3=ILLEGAL 4=DON'T KNOW 5=REFUSED
      bri_soim_005 = recode_values(q5a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Abortion legal: serious birth defect
      # q5ba: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_007 = recode_values(q5ba, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: rape or incest
      # q5bg: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_029 = recode_values(q5bg, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: within 3 months
      # q5bf: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_030 = recode_values(q5bf, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: health endangered
      # q5bb: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_009 = recode_values(q5bb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: family low income
      # q5bd: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_008 = recode_values(q5bd, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1999-02_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1999-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Public school discipline too strict
      # q5b: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=REFUSED
      gal_hwps_003 = recode_values(q5b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # High school discipline too strict
      # q5c: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=REFUSED
      gal_hwps_004 = recode_values(q5c, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1999-03_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-1999-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Legalize marijuana for medical use
      # q8b: 1=FAVOUR 2=OPPOSED 3=DON'T KNOW 4=REFUSED
      gal_soim_031 = recode_values(q8b, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1999-04_F1.tab -- Gallup, 9 questions
survey(
  survey_id = "cipo-E-1999-04_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-04_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Homosexuals as junior school teachers
      # q6ba: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_025 = recode_values(q6ba, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour same-sex marriage
      # q5a: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      bri_soim_011 = recode_values(q5a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as prison officers
      # q6bg: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_016 = recode_values(q6bg, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # q6be: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_017 = recode_values(q6be, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # q6bf: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_018 = recode_values(q6bf, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # q6bb: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_019 = recode_values(q6bb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # q6bd: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_020 = recode_values(q6bd, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals adopt children
      # q5c: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_021 = recode_values(q5c, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # q6bc: 1=SHOULD 2=SHOULD NOT 3=DONT KNOW 4=REFUSED
      gal_soim_022 = recode_values(q6bc, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1999-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1999-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # q7: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT REALLY SERIOUS 5=DON'T KNOW 6=REFUSED
      bri_hwps_008 = recode_values(q7, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # q8a: 1=NONE 2=LITTLE 3=SOME 4=GREAT DEAL 5=DON'T KNOW 6=REFUSED
      gal_hwps_014 = recode_values(q8a, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-1999-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-1999-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # q5: 1=INCREASED 2=DECREASED 3=SAME THE SAME 4=DON'T KNOW 5=REFUSED
      bri_idim_004 = recode_values(q5, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Police harsh on criminals
      # q4da: 1=TOO HARSH 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_023 = recode_values(q4da, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # q4dc: 1=TOO HARSH 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_004 = recode_values(q4dc, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # q4db: 1=TOO HARSH 2=NOT HARSH ENOUGH 3=CORRECT MANNER 4=DONT KNOW 5=REFUSED
      gal_soim_024 = recode_values(q4db, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1999-08_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1999-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # q6a: 1=STRONGLY FAVOUR 2=SOMEWHAT FAVOUR 3=STRONGLY OPPOSE 4=SOMEWHAT OPPOSE 5=DONT KNOW 6=REFUSED
      bri_hwps_012 = recode_values(q6a, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # q7a: 1=VOTE FOR 2=VOTE AGAINST 3=DONT KNOW 4=REFUSED
      bri_soim_004 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1999-09_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-1999-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Admit more or fewer refugees
      # q8b: 1=INCREASE 2=DECREASE 3=SAME 4=DONT KNOW 5=REFUSED
      bri_idim_008 = recode_values(q8b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Keep monarch as head of state
      # q7a: 1=CONTINUE 2=DISCONTINUE 3=DONT KNOW 4=REFUSED
      bri_intd_008 = recode_values(q7a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-1999-10_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-1999-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour registration of all firearms
      # q10a: 1=FAVOUR 2=OPPOSE 3=DONT KNOW 4=REFUSED
      gal_soim_006 = recode_values(q10a, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # General public allowed to own gun
      # q10cb: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_soim_012 = recode_values(q10cb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Firearm sale laws stricter/less
      # q10b: 1=MORE STRICT 2=LESS STRICT 3=STAY SAME 4=DONT KNOW 5=REFUSED
      gal_soim_026 = recode_values(q10b, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-1999-11_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-1999-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-1999-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # q4a: 1=LEGAL 2=LEGAL SOMETIMES 3=ILLEGAL 4=DONT KNOW 5=REFUSED
      bri_soim_005 = recode_values(q4a, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Abortion legal: serious birth defect
      # q4ba: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_007 = recode_values(q4ba, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: rape or incest
      # q4bg: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_029 = recode_values(q4bg, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: within 3 months
      # q4bf: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_030 = recode_values(q4bf, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: health endangered
      # q4bb: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_009 = recode_values(q4bb, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: family low income
      # q4bd: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      gal_soim_008 = recode_values(q4bd, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-02_F1.tab -- Gallup, 12 questions
survey(
  survey_id = "cipo-E-2000-02_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-02_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Homosexuals as junior school teachers
      # teacher: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_025 = recode_values(teacher, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Favour same-sex marriage
      # samesex: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      bri_soim_011 = recode_values(samesex, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Public school discipline too strict
      # diselem: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=REFUSED
      gal_hwps_003 = recode_values(diselem, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # High school discipline too strict
      # dissec: 1=TOO STRICT 2=NOT STRICT ENOUGH 3=ABOUT RIGHT 4=DON'T KNOW 5=REFUSED
      gal_hwps_004 = recode_values(dissec, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Homosexuals as prison officers
      # prison: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_016 = recode_values(prison, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as salespeople
      # sales: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_017 = recode_values(sales, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals in armed forces
      # army: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_018 = recode_values(army, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as clergy
      # clergy: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_019 = recode_values(clergy, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as doctors
      # dr: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_020 = recode_values(dr, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Same benefits for gay couples
      # tax: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_027 = recode_values(tax, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals adopt children
      # adopt: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_021 = recode_values(adopt, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Homosexuals as MPs
      # mp: 1=SHOULD 2=SHOULD NOT 3=DON'T KNOW 4=REFUSED
      gal_soim_022 = recode_values(mp, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-03_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-2000-03_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-03_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # medicare: 1=STRONGLY FAVOUR 2=SOMEWHAT FAVOUR 3=SOMEWHAT OPPOSE 4=STRONGLY OPPOSE 5=DON'T KNOW 6=REFUSED
      bri_hwps_012 = recode_values(medicare, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Legalize marijuana for medical use
      # medicine: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      gal_soim_031 = recode_values(medicine, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-05_F1.tab -- Gallup, 2 questions
survey(
  survey_id = "cipo-E-2000-05_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-05_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Hunger serious problem in Canada
      # hunger: 1=VERY SERIOUS 2=QUITE SERIOUS 3=NOT TOO SERIOUS 4=NOT A PROBLEM 5=DON'T KNOW 6=REFUSED
      bri_hwps_008 = recode_values(hunger, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Govt responsibility: solve hunger
      # govt: 1=NONE 2=LITTLE 3=SOME 4=A GREAT DEAL 5=DON'T KNOW 6=REFUSED
      gal_hwps_014 = recode_values(govt, c(1, 2) ~ 0, c(3, 4) ~ 1, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-2000-06_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-2000-06_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-06_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Concern: air quality
      # air: 1=VERY 2=SOMEWHAT 3=NOT VERY 4=NOT AT ALL 5=DON'T KNOW 6=REFUSED
      gal_ener_003 = recode_values(air, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: greenhouse effect
      # grhs: 1=VERY 2=SOMEWHAT 3=NOT VERY 4=NOT AT ALL 5=DON'T KNOW 6=REFUSED
      gal_ener_005 = recode_values(grhs, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Concern: ozone layer depletion
      # ozone: 1=VERY 2=SOMEWHAT 3=NOT VERY 4=NOT AT ALL 5=DON'T KNOW 6=REFUSED
      gal_ener_004 = recode_values(ozone, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999)
    )
  }
)

# cipo-E-2000-07_F1.tab -- Gallup, 4 questions
survey(
  survey_id = "cipo-E-2000-07_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-07_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Immigration: increase/decrease level
      # immig: 1=INCREASE 2=DECREASE 3=KEEP THE SAME 4=DON'T KNOW 5=REFUSED
      bri_idim_004 = recode_values(immig, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Police harsh on criminals
      # police: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_023 = recode_values(police, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Courts harsh on criminals
      # courts: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_004 = recode_values(courts, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999),

      # Fed govt harsh on criminals
      # feds: 1=TOO HARSHLY 2=NOT HARSHLY ENOUGH 3=CORRECT MANNER 4=DON'T KNOW 5=REFUSED
      gal_soim_024 = recode_values(feds, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-2000-08_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-2000-08_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-08_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour two-tier health care
      # health: 1=STRONGLY FAVOUR 2=SOMEWHAT FAVOUR 3=SOMEWHAT OPPOSE 4=STRONGLY OPPOSE 5=DK 6=REFUSED
      bri_hwps_012 = recode_values(health, c(1, 2) ~ 1, c(3, 4) ~ 0, c(5, 6) ~ 9999),

      # Vote for reinstating death penalty
      # death: 1=YES 2=NO 3=DK 4=REFUSED
      bri_soim_004 = recode_values(death, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Death penalty deters murder
      # rate: 1=YES 2=NO 3=DK 4=REFUSED
      gal_soim_014 = recode_values(rate, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-09_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-2000-09_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-09_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Keep monarch as head of state
      # monarch: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      bri_intd_008 = recode_values(monarch, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-10_F1.tab -- Gallup, 3 questions
survey(
  survey_id = "cipo-E-2000-10_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-10_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Favour registration of all firearms
      # guns: 1=FAVOUR 2=OPPOSE 3=DON'T KNOW 4=REFUSED
      gal_soim_006 = recode_values(guns, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # General public allowed to own gun
      # public: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      bri_soim_012 = recode_values(public, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Firearm sale laws stricter/less
      # laws: 1=MORE STRICT 2=LESS STRICT 3=SAME AS NOW 4=DON'T KNOW 5=REFUSED
      gal_soim_026 = recode_values(laws, 1 ~ 1, 2 ~ -1, 3 ~ 0, c(4, 5) ~ 9999)
    )
  }
)

# cipo-E-2000-11_F1.tab -- Gallup, 6 questions
survey(
  survey_id = "cipo-E-2000-11_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-11_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Abortion legal in all/some/no cases
      # abort: 1=ANY 2=CERTAIN 3=NONE 4=DON'T KNOW 5=REFUSED
      bri_soim_005 = recode_values(abort, 1 ~ 2, 2 ~ 1, 3 ~ 0, c(4, 5) ~ 9999),

      # Abortion legal: serious birth defect
      # defect: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_007 = recode_values(defect, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: rape or incest
      # rape: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_029 = recode_values(rape, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: within 3 months
      # concep3: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_030 = recode_values(concep3, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: health endangered
      # woman: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_009 = recode_values(woman, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999),

      # Abortion legal: family low income
      # low: 1=YES 2=NO 3=DON'T KNOW 4=REFUSED
      gal_soim_008 = recode_values(low, 1 ~ 1, 2 ~ 0, c(3, 4) ~ 9999)
    )
  }
)

# cipo-E-2000-12_F1.tab -- Gallup, 1 question
survey(
  survey_id = "cipo-E-2000-12_F1.tab",
  source    = "Gallup",
  file_name = "cipo-E-2000-12_F1.tab",
  recode = function(d) {
    d %>% transmute(
      # Doctors may end life: mercy killing
      # q8a: 1=YES 2=NO 3=DONT KNOW 4=REFUSED
      bri_soim_003 = recode_values(q8a, 1 ~ 1, 2 ~ -1, c(3, 4) ~ 9999)
    )
  }
)
