# Raw Data: Download, Open, and Use
# Code from https://policyattitudes.ca/resources/raw-data/

# Step 1: Download the file -----------------------------------------------

# Run once to install:
# download.file(
#   "https://github.com/lucasjacklucas/cvpa_dataset/raw/main/dataset.parquet",
#   "dataset.parquet", mode = "wb"
# )

# Run once to install:
# download.file(
#   "https://github.com/lucasjacklucas/cvpa_dataset/raw/main/question_codebook.csv",
#   "question_codebook.csv", mode = "wb"
# )

# Step 2: Open it in R ----------------------------------------------------

# Run once to install:
# install.packages(c("nanoparquet", "tidyverse"))

library(tidyverse)
library(nanoparquet)

cvpa <- read_parquet("dataset.parquet")

# Step 3: Look at the data ------------------------------------------------

dim(cvpa)
head(cvpa)

cvpa %>%
  group_by(source) %>%
  summarise(
    respondents = n_distinct(response_id),
    first_year = min(year),
    last_year = max(year)
  )

cvpa %>%
  distinct(policy_domain_label, question_id) %>%
  count(policy_domain_label, sort = TRUE)

# Step 4: Find a question -------------------------------------------------

cvpa %>%
  filter(policy_domain == "intd") %>%
  distinct(question_id, issue_label) %>%
  head(10)

codebook <- read_csv("question_codebook.csv", col_types = cols(.default = "c")) %>%
  distinct(issue_question_id, .keep_all = TRUE) %>%
  select(question_id = issue_question_id, question_wording, recode_type, value_labels)

codebook %>%
  filter(question_id == "bri_intd_005") %>%
  glimpse()

# Step 5: Pull out one question -------------------------------------------

ties <- cvpa %>%
  filter(question_id == "bri_intd_005")

ties %>%
  count(year, value)

# Run once to install:
# ties <- read_parquet(
#   "dataset.parquet",
#   col_select = c("response_id", "year", "gender", "language", "question_id", "value")
# ) %>%
#   filter(question_id == "bri_intd_005")

# Step 6: Summarize it ----------------------------------------------------

ties_by_year <- ties %>%
  filter(value != 9999) %>%
  group_by(year) %>%
  summarise(
    closer = mean(value == 1),
    n = n()
  )

ties_by_year

ties %>%
  filter(value != 9999, language %in% c(1, 2)) %>%
  mutate(language = if_else(language == 1, "French", "English")) %>%
  group_by(year, language) %>%
  summarise(closer = mean(value == 1), .groups = "drop") %>%
  pivot_wider(names_from = language, values_from = closer)

ggplot(ties_by_year, aes(x = year, y = closer)) +
  geom_line() +
  geom_point() +
  scale_y_continuous(labels = scales::percent, limits = c(0, NA)) +
  labs(
    x = NULL, y = NULL,
    title = "Share who want closer ties with the United States"
  ) +
  theme_minimal()

