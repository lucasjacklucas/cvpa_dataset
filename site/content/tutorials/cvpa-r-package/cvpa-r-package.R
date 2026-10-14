# CVPA R Package: Getting Started
# Code from https://policyattitudes.ca/tutorials/cvpa-r-package/

# Installing and loading the package --------------------------------------

# Run once to install:
# install.packages("remotes")
# remotes::install_github("davidaarmstrong/cvpa")

library(cvpa)
library(tidyverse)
library(ggplot2)

# Finding a question ------------------------------------------------------

update_cvpa_data(quiet = TRUE)

question_catalog(domain = "intd") %>%
  select(question, issue_label, value_labels, n_waves) %>%
  arrange(desc(n_waves)) %>%
  head(10)

question_catalog() %>%
  filter(question == "bri_intd_005") %>%
  pull(question_wording)

# Loading the data --------------------------------------------------------

update_cvpa_data(questions = "bri_intd_005", quiet = TRUE)

us_ties <- question_data("bri_intd_005")
glimpse(us_ties)

demographic_vars %>%
  select(variable, description)

# Weighted responses by year ----------------------------------------------

overall <- wtd_response(us_ties)
overall

# Weighted responses by group ---------------------------------------------

by_party <- wtd_response(us_ties, grouping_vars = "vote_intention")
by_party

cvpa_grouping_vars

# Plotting the results ----------------------------------------------------

response_colours <- c("More distant" = "#eb6834", "Same" = "#8a8a85", "Closer" = "#2a78d6")

ggplot(overall, aes(x = year, y = response_share, colour = response)) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 2) +
  scale_colour_manual(values = response_colours) +
  scale_y_continuous(labels = scales::percent, limits = c(0, NA)) +
  labs(
    title = "Should Canada's ties with the United States be closer or more distant?",
    x = NULL, y = "Weighted share of respondents", colour = NULL
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "top", panel.grid.minor = element_blank())

party_colours <- c("Liberal" = "#d71920", "PC/Conservative" = "#1a4782", "CCF/NDP" = "#f37021")

by_party %>%
  filter(
    response == "Closer",
    vote_intention %in% names(party_colours)
  ) %>%
  ggplot(aes(x = year, y = response_share, colour = vote_intention)) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 2) +
  scale_colour_manual(values = party_colours) +
  scale_y_continuous(labels = scales::percent, limits = c(0, NA)) +
  labs(
    title = "Share who want closer ties with the United States, by vote intention",
    x = NULL, y = "Weighted share of respondents", colour = NULL
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "top", panel.grid.minor = element_blank())

