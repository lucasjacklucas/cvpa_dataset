###############################################################################
# CVPA 2026 Bridge Survey
# 1 survey block, oldest first. One block per survey, per wave for panel
# files. Edit a recode_values() arm to change a coding; add a line to add a
# variable.
###############################################################################

# bridge_clean.csv -- 2026 Bridge Survey, 60 questions (wave CVPA 2026 Bridge Survey)
survey(
  survey_id = "bridge_clean.csv",
  source    = "2026 Bridge Survey",
  file_name = "bridge_clean.csv",
  id_stem   = "CVPA 2026 Bridge Survey",
  wave      = "CVPA 2026 Bridge Survey",
  recode = function(d) {
    d %>% transmute(
      # Free trade w US good for econ
      # addt_econ_02: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_econ_012 = recode_values(addt_econ_02, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # How much to reduce rich-poor gap
      # core_econ_02: 1=Much more 2=Somewhat more 3=About the same as now 4=Somewhat less 5=Much less 9999=Don't know
      bri_econ_013 = recode_values(core_econ_02, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 9999 ~ 9999),

      # Income tax system unfair
      # addt_econ_04: 1=Fair 2=Unfair 9999=Don't know
      bri_econ_008 = recode_values(addt_econ_04, 1 ~ 0, 2 ~ 1, 9999 ~ 9999),

      # Decent living vs get ahead on own
      # addt_econ_03: 1=See to it that everyone has a decent standard of living 2=Leave people to get ahead on their own 9999=Don't know
      bri_econ_010 = recode_values(addt_econ_03, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Cdn corps should invest in Canada
      # core_econ_04: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_econ_005 = recode_values(core_econ_04, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Leave job creation to private sector
      # addt_econ_01: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_econ_011 = recode_values(addt_econ_01, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Fed govt should own banks
      # addt_econ_05: 1=Yes 2=No 9999=Don't know
      bri_econ_001 = recode_values(addt_econ_05, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Cut taxes vs keep up govt spending
      # addt_econ_06: 1=Cut taxes 2=Leave taxes as is 3=Increase taxes 9999=Don't know
      bri_econ_004 = recode_values(addt_econ_06, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9999 ~ 9999),

      # Priority: balance budget vs unemploy
      # core_econ_03: 1=Balancing the budget 2=Reducing unemployment 9999=Don't know
      bri_econ_007 = recode_values(core_econ_03, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Labour unions too powerful
      # core_econ_01: 1=Too powerful 2=About right 3=Not powerful enough 9999=Don't know
      bri_econ_003 = recode_values(core_econ_01, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9999 ~ 9999),

      # Increase or stop nuclear generation
      # core_ener_01: 1=Canada should increase nuclear generation 2=Canada should not develop any more than at present 3=Canada should stop generation
      bri_ener_001 = recode_values(core_ener_01, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9999 ~ 9999),

      # Oil price: market vs regulated
      # addt_ener_06: 1=Regulated 2=Determined by the marketplace 9999=Don't know
      bri_ener_004 = recode_values(addt_ener_06, 1 ~ 0, 2 ~ 1, 9999 ~ 9999),

      # Lower prices vs enviro protection
      # core_ener_03: 1=Pay higher prices and protect the environment 2=Pay lower prices and have more pollution 9999=Don't know
      bri_ener_003 = recode_values(core_ener_03, 1 ~ 0, 2 ~ 1, 9999 ~ 9999),

      # Willing: restrict urban car use
      # core_ener_04: 1=Very willing 2=Somewhat willing 3=Not very willing 4=Not at all willing 9999=Don't know
      bri_ener_007 = recode_values(core_ener_04, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Environment more important than jobs
      # core_ener_02: 1=Strongly disagree 2=Somewhat disagree 3=Somewhat agree 4=Strongly agree 9999=Don't know
      bri_ener_008 = recode_values(core_ener_02, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Fed govt should continue carbon tax
      # addt_ener_01: 1=Strongly agree 2=Somewhat agree 3=Neither agree nor disagree 4=Somewhat disagree 5=Strongly disagree 9999=Don't know
      bri_ener_009 = recode_values(addt_ener_01, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 9999 ~ 9999),

      # Jobs come first over environment
      # addt_ener_02: 1=Strongly agree 2=Somewhat agree 3=Neither agree nor disagree 4=Somewhat disagree 5=Strongly disagree 9999=Don't know
      bri_ener_010 = recode_values(addt_ener_02, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 9999 ~ 9999),

      # Fed govt help energy sector/pipelines
      # addt_ener_03: 1=Strongly agree 2=Somewhat agree 3=Neither agree nor disagree 4=Somewhat disagree 5=Strongly disagree 9999=Don't know
      bri_ener_011 = recode_values(addt_ener_03, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 9999 ~ 9999),

      # Accept nuclear plant in your area
      # addt_ener_04: 1=Agree to it 2=Not oppose it but worry 3=Oppose it 9999=Don't know
      bri_ener_002 = recode_values(addt_ener_04, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9999 ~ 9999),

      # Adequate income a guaranteed right
      # addt_hwps_06: 1=Should be a guaranteed right 2=Should not be a guaranteed right 9999=Don't know
      bri_hwps_006 = recode_values(addt_hwps_06, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Govt guarantee post-sec education
      # addt_hwps_05: 1=Should be a guaranteed right 2=Should not be a guaranteed right 9999=Don't know
      bri_hwps_007 = recode_values(addt_hwps_05, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Pay to get medical treatment sooner
      # core_hwps_03: 2=Strongly agree 3=Somewhat agree 4=Somewhat disagree 5=Strongly disagree 9999=Don't know
      bri_hwps_013 = recode_values(core_hwps_03, c(2, 3) ~ 1, c(4, 5) ~ 0, 9999 ~ 9999),

      # Workers should have right to strike
      # addt_hwps_01: 1=Yes, they should 2=No, they should not 9999=Don't know
      bri_hwps_002 = recode_values(addt_hwps_01, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Fund public daycare vs money to parents
      # core_hwps_04: 1=Fund public daycare 2=Give the money directly to parents 9999=Don't know
      bri_hwps_014 = recode_values(core_hwps_04, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Favour two-tier health care
      # addt_hwps_02: 1=Strongly in favour 2=Somewhat in favour 3=Somewhat opposed 4=Strongly opposed 9999=Don't know
      bri_hwps_012 = recode_values(addt_hwps_02, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Hunger serious problem in Canada
      # core_hwps_01: 1=Not serious 2=Not too serious 3=Quite serious 4=Very serious 9999=Don't know
      bri_hwps_008 = recode_values(core_hwps_01, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Mandatory retirement at 65 good idea
      # addt_hwps_04: 1=Good idea 2=Not a good idea 9999=Don't know
      bri_hwps_003 = recode_values(addt_hwps_04, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Make welfare recipients work
      # core_hwps_02: 1=Favour 2=Oppose 9999=Don't know
      bri_hwps_010 = recode_values(core_hwps_02, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Immigrants not adopting Cdn values
      # addt_idim_05: 1=Strongly disagree 2=Somewhat disagree 3=Somewhat agree 4=Strongly agree 9999=Don't know
      bri_idim_013 = recode_values(addt_idim_05, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Too much immigration to Canada
      # core_idim_03: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_idim_007 = recode_values(core_idim_03, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Immigration: admit more/fewer
      # addt_idim_02: 1=More 2=Fewer 3=About the same as now 9999=Don't know
      bri_idim_010 = recode_values(addt_idim_02, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9999 ~ 9999),

      # Immigration: increase/decrease level
      # addt_idim_01: 1=Increase 2=Decrease 3=Maintain at current level 9999=Don't know
      bri_idim_004 = recode_values(addt_idim_01, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9999 ~ 9999),

      # Want larger Cdn population
      # addt_idim_06: 1=Much larger 2=Just about right 9999=Don't know
      bri_idim_001 = recode_values(addt_idim_06, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Govt treats Indigenous well/badly
      # core_idim_02: 1=Badly treated 2=Fairly treated 3=Well treated 9999=Don't know
      bri_idim_003 = recode_values(core_idim_02, 1 ~ -1, 2 ~ 0, 3 ~ 1, 9999 ~ 9999),

      # More power: fed vs prov govts
      # addt_idim_03: 1=More powers for federal government 2=More powers for provincial government 3=Powers stay the same 9999=Don't know
      bri_idim_006 = recode_values(addt_idim_03, 1 ~ 1, 2 ~ -1, 3 ~ 0, 9999 ~ 9999),

      # Favour Quebec separation (referendum)
      # core_idim_01: 1=In favour 2=Opposed 9999=Don't know
      bri_idim_005 = recode_values(core_idim_01, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Canada should improve border security
      # addt_intd_03: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_intd_010 = recode_values(addt_intd_03, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Peacekeeping abroad despite risk
      # addt_intd_01: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_intd_009 = recode_values(addt_intd_01, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Crack down on terrorists vs rights
      # addt_intd_02: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_intd_011 = recode_values(addt_intd_02, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Canada has distinct culture
      # addt_intd_04: 1=Yes 2=No 9999=Don't know
      bri_intd_006 = recode_values(addt_intd_04, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Urban/rural Cdns same values
      # addt_intd_06: 1=Strongly agree 2=Somewhat agree 3=Somewhat disagree 4=Strongly disagree 9999=Don't know
      bri_intd_012 = recode_values(addt_intd_06, c(1, 2) ~ 1, c(3, 4) ~ 0, 9999 ~ 9999),

      # Ties with US closer/more distant
      # core_intd_03: 1=Much closer 2=Somewhat closer 3=About the same as now 4=Somewhat more distant 5=Much more distant 9999=Don't know
      bri_intd_005 = recode_values(core_intd_03, c(1, 2) ~ 1, 3 ~ 0, c(4, 5) ~ -1, 9999 ~ 9999),

      # Compulsory military training at 18
      # addt_intd_05: 1=Would favour 2=Would not favour 9999=Don't know
      bri_intd_001 = recode_values(addt_intd_05, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Canada become part of US
      # core_intd_01: 1=Approve 2=Disapprove 9999=Don't know
      bri_intd_002 = recode_values(core_intd_01, 1 ~ 1, 2 ~ -1, 9999 ~ 9999),

      # Keep monarch as head of state
      # core_intd_02: 1=Continue to have monarch as head of state 2=Discontinue ties with the monarchy 9999=Don't know
      bri_intd_008 = recode_values(core_intd_02, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Only police/military should have guns
      # addt_soim_03: 1=Strongly disagree 2=Somewhat disagree 3=Somewhat agree 4=Strongly agree 9999=Don't know
      bri_soim_013 = recode_values(addt_soim_03, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Parties: half of candidates women
      # addt_soim_06: 1=Strongly disagree 2=Somewhat disagree 3=Somewhat agree 4=Strongly agree 9999=Don't know
      bri_soim_009 = recode_values(addt_soim_06, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Feminism: equal treatment vs men down
      # addt_soim_04: 1=Just tries to get equal treatment for women 2=Puts men down 9999=Don't know
      bri_soim_010 = recode_values(addt_soim_04, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Abortion legal in all/some/no cases
      # core_soim_01: 1=Legal under any circumstances 2=Legal only under certain circumstances 3=Illegal in all circumstances 9999=Don't know
      bri_soim_005 = recode_values(core_soim_01, 1 ~ 2, 2 ~ 1, 3 ~ 0, 9999 ~ 9999),

      # Vote for reinstating death penalty
      # addt_soim_02: 1=For 2=Against 9999=Don't know
      bri_soim_004 = recode_values(addt_soim_02, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Doctors may end life: mercy killing
      # addt_soim_01: 1=Yes, should be allowed 2=No, should not be allowed 9999=Don't know
      bri_soim_003 = recode_values(addt_soim_01, 1 ~ 1, 2 ~ -1, 9999 ~ 9999),

      # General public allowed to own gun
      # core_soim_02: 1=Yes 2=No 9999=Don't know
      bri_soim_012 = recode_values(core_soim_02, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Support gay/lesbian couples marrying
      # core_soim_03: 1=Strongly oppose 2=Somewhat oppose 3=Somewhat support 4=Strongly support 9999=Don't know
      bri_soim_014 = recode_values(core_soim_03, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Personal rights protected or in danger
      # addt_soim_05: 1=Yes, protected 2=No, in danger 9999=Don't know
      bri_soim_001 = recode_values(addt_soim_05, 1 ~ 1, 2 ~ 0, 9999 ~ 9999),

      # Small marijuana possession an offence
      # core_soim_04: 1=Criminal offense 2=Offense subject only to a fine 3=Not an offense at all 9999=Don't know
      bri_soim_006 = recode_values(core_soim_04, 1 ~ 2, 2 ~ 1, 3 ~ 0, 9999 ~ 9999),

      # Economy vs environment priority
      # addt_ener_05: 1=Economic development should have priority 2=Environmental concerns should have priority 9999=Don't know
      bri_ener_005 = recode_values(addt_ener_05, 1 ~ 1, 2 ~ -1, 9999 ~ 9999),

      # Fed spending poorer regions: up/down
      # addt_hwps_03: 1=Increase 2=Stay the same 3=Decrease 9999=Don't know
      bri_hwps_005 = recode_values(addt_hwps_03, 1 ~ 1, 2 ~ 0, 3 ~ -1, 9999 ~ 9999),

      # Do more for racial minorities
      # core_idim_04: 1=Much more 2=Somewhat more 3=About the same as now 4=Much less 9999=Don't know
      bri_idim_014 = recode_values(core_idim_04, c(1, 2) ~ 1, 3 ~ 0, 4 ~ -1, 9999 ~ 9999),

      # Approve Quebec distinct society
      # addt_idim_04: 1=Strongly disapprove 2=Somewhat disapprove 3=Somewhat approve 4=Strongly approve 9999=Don't know
      bri_idim_009 = recode_values(addt_idim_04, c(1, 2) ~ 0, c(3, 4) ~ 1, 9999 ~ 9999),

      # Support reducing aid to Third World
      # core_intd_04: 1=Support 2=Do not support 9999=Don't know
      bri_intd_007 = recode_values(core_intd_04, 1 ~ 1, 2 ~ 0, 9999 ~ 9999)
    )
  }
)
