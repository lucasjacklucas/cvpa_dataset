# Adding Variables from the Original Surveys
# Code from https://policyattitudes.ca/resources/adding-variables/

# Step 1: Load packages ---------------------------------------------------

library(tidyverse)
library(haven)
library(nanoparquet)

# The downloads below can take more than R's default of 60 seconds
options(timeout = 600)

# Step 2: Download the original survey ------------------------------------

download.file(
  "https://borealisdata.ca/api/access/datafile/81942?format=original",
  "cipo-E-2000-03_F1.sav", mode = "wb"
)

# Step 3: Read the file and check the codes -------------------------------

gallup_2000 <- read_sav("cipo-E-2000-03_F1.sav", user_na = TRUE)

print_labels(gallup_2000$mp)

gallup_2000 %>%
  count(mp = as.numeric(mp))

# Step 4: Build the IDs and recode ----------------------------------------

mp_2000 <- gallup_2000 %>%
  mutate(
    response_id = paste0("cipo-E-2000-03_F1_", str_pad(row_number(), 5, pad = "0")),
    mp_rating = if_else(as.numeric(mp) %in% 1:5, as.numeric(mp), NA),
    weight = as.numeric(wtvar)
  ) %>%
  select(response_id, mp_rating, weight)

mp_2000

# Step 5: Join to the CVPA dataset ----------------------------------------

download.file(
  "https://github.com/lucasjacklucas/cvpa_dataset/raw/main/dataset.parquet",
  "dataset.parquet", mode = "wb"
)

respondents <- read_parquet(
  "dataset.parquet",
  col_select = c("response_id", "year", "gender", "age_cats", "degree", "language")
) %>%
  distinct(response_id, .keep_all = TRUE)

linked_2000 <- mp_2000 %>%
  left_join(respondents, by = "response_id")

sum(is.na(linked_2000$year))

# Step 6: Analyze ---------------------------------------------------------

linked_2000 %>%
  filter(!is.na(mp_rating)) %>%
  summarise(low_share = weighted.mean(mp_rating >= 4, weight))

linked_2000 %>%
  filter(!is.na(mp_rating), language %in% 1:2) %>%
  mutate(language = if_else(language == 1, "French", "English")) %>%
  group_by(language) %>%
  summarise(low_share = weighted.mean(mp_rating >= 4, weight), respondents = n())

# Adding the question from several surveys --------------------------------

mp_files <- tribble(
  ~file,                         ~var,    ~file_id,
  "cipo-391-E-1976-08_F1.sav",   "q2i",   82679,
  "cipo-464-1-E-1982-08_F1.sav", "q4i",   82938,
  "cipo-526-1-E-1987-10_F1.sav", "q10i",  83154,
  "cipo-910-1-E-1989-10_F1.sav", "qq14i", 83250,
  "cipo-E-1994-09_F1.sav",       "q5#i",  83456,
  "cipo-E-1995-03_F1.sav",       "q6_i",  83474,
  "cipo-E-1996-03_F1.sav",       "hmop",  83508,
  "cipo-E-1997-03_F1.sav",       "mop",   83546,
  "cipo-E-1998-03_F1.sav",       "q8i",   83584,
  "cipo-E-1999-03_F1.sav",       "q6i",   83620,
  "cipo-E-2000-03_F1.sav",       "mp",    81942
)

for (i in seq_len(nrow(mp_files))) {
  if (!file.exists(mp_files$file[i])) {
    download.file(
      paste0("https://borealisdata.ca/api/access/datafile/",
             mp_files$file_id[i], "?format=original"),
      mp_files$file[i], mode = "wb"
    )
  }
}

raw_codes <- map2_dfr(mp_files$file, mp_files$var, function(file, var) {
  raw <- read_sav(file, user_na = TRUE)
  tibble(file = file, code = as.numeric(raw[[var]]))
})

raw_codes %>%
  filter(!code %in% 1:5) %>%
  count(file, code)

build_mp <- function(file, var) {
  read_sav(file, user_na = TRUE) %>%
    mutate(
      response_id = paste0(tools::file_path_sans_ext(file), "_",
                           str_pad(row_number(), 5, pad = "0")),
      mp_rating = if_else(as.numeric(.data[[var]]) %in% 1:5, as.numeric(.data[[var]]), NA),
      weight = if ("wtvar" %in% names(.)) as.numeric(wtvar) else 1
    ) %>%
    select(response_id, mp_rating, weight)
}

mp_honesty <- map2_dfr(mp_files$file, mp_files$var, build_mp)

linked <- mp_honesty %>%
  left_join(respondents, by = "response_id")

sum(is.na(linked$year))

mp_by_year <- linked %>%
  filter(!is.na(mp_rating)) %>%
  group_by(year) %>%
  summarise(low_share = weighted.mean(mp_rating >= 4, weight))

mp_by_year

ggplot(mp_by_year, aes(x = year, y = low_share)) +
  geom_line(linewidth = 0.8, colour = "#2a78d6") +
  geom_point(size = 2, colour = "#2a78d6") +
  scale_y_continuous(labels = scales::percent, limits = c(0, NA)) +
  labs(
    title = "Rating the honesty of MPs as low or very low",
    x = NULL, y = "Weighted share of respondents"
  ) +
  theme_minimal(base_size = 12) +
  theme(panel.grid.minor = element_blank())

mp_by_language <- linked %>%
  filter(!is.na(mp_rating), language %in% 1:2) %>%
  mutate(language = if_else(language == 1, "French", "English")) %>%
  group_by(year, language) %>%
  summarise(low_share = weighted.mean(mp_rating >= 4, weight), .groups = "drop")

language_colours <- c("French" = "#2a78d6", "English" = "#eb6834")

ggplot(mp_by_language, aes(x = year, y = low_share, colour = language)) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 2) +
  scale_colour_manual(values = language_colours) +
  scale_y_continuous(labels = scales::percent, limits = c(0, NA)) +
  labs(
    title = "Rating the honesty of MPs as low or very low, by language",
    x = NULL, y = "Weighted share of respondents", colour = NULL
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "top", panel.grid.minor = element_blank())

# Special case: Canadian Election Study panels ----------------------------

download.file("https://borealisdata.ca/api/access/datafile/880910",
              "ces2004-6-8_STATA.zip", mode = "wb")
unzip("ces2004-6-8_STATA.zip", files = "ces2004-6-8.dta")

panel <- read_dta("ces2004-6-8.dta")
nrow(panel)

print_labels(panel$ces06_pes_a1)

swd_2006 <- panel %>%
  mutate(
    response_id = paste0("ces2004-6-8_2006wave_", str_pad(row_number(), 5, pad = "0")),
    satisfied = case_when(
      as.numeric(ces06_pes_a1) %in% c(1, 3) ~ 1,
      as.numeric(ces06_pes_a1) %in% c(5, 7) ~ 0
    )
  ) %>%
  select(response_id, satisfied)

respondents_2006 <- respondents %>%
  filter(str_starts(response_id, "ces2004-6-8_2006wave_"))

sum(!respondents_2006$response_id %in% swd_2006$response_id)

linked_2006 <- respondents_2006 %>%
  left_join(swd_2006, by = "response_id")

linked_2006 %>%
  summarise(respondents = n(), answered = sum(!is.na(satisfied)))

swd_vars <- tribble(
  ~wave, ~var,
  2004,  "ces04_pes_a11",
  2006,  "ces06_pes_a1",
  2008,  "ces08_pes_a1"
)

build_swd <- function(wave, var) {
  panel %>%
    mutate(
      row = str_pad(row_number(), 5, pad = "0"),
      response_id = paste0("ces2004-6-8_", wave, "wave_", row),
      wave = wave,
      satisfied = case_when(
        as.numeric(.data[[var]]) %in% c(1, 3) ~ 1,
        as.numeric(.data[[var]]) %in% c(5, 7) ~ 0
      )
    ) %>%
    select(response_id, row, wave, satisfied)
}

swd <- map2_dfr(swd_vars$wave, swd_vars$var, build_swd)

panel_respondents <- respondents %>%
  filter(str_starts(response_id, "ces2004-6-8_"))

sum(!panel_respondents$response_id %in% swd$response_id)

panel_linked <- panel_respondents %>%
  left_join(swd, by = "response_id")

panel_linked %>%
  filter(!is.na(satisfied)) %>%
  count(row, name = "waves_answered") %>%
  count(waves_answered, name = "respondents")

panel_wide <- panel_linked %>%
  filter(!is.na(satisfied)) %>%
  select(row, wave, satisfied) %>%
  pivot_wider(names_from = wave, values_from = satisfied, names_prefix = "satisfied_")

panel_wide

