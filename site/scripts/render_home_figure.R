# Draws the figure at the top of the home page, site/static/images/home-trends.png:
# six long-running questions, each as the weighted share giving one response,
# on a common 1945-2026 axis.
#
# Rerun from the repository root whenever the data change, then commit the PNG:
#   Rscript site/scripts/render_home_figure.R
# Needs the cvpa package and its data cache (cvpa::update_cvpa_data()), plus
# ggplot2, ragg and systemfonts. The figure is set in Inconsolata, the site's
# font; scripts/fonts/ holds the TTF (from google/fonts, OFL licence) so the
# render doesn't depend on it being installed.

suppressPackageStartupMessages({
  library(cvpa)
  library(dplyr)
  library(ggplot2)
})

out <- "site/static/images/home-trends.png"

systemfonts::register_font("Inconsolata", plain = "site/scripts/fonts/Inconsolata.ttf")
font <- "Inconsolata"

# question, the response to plot, and the panel title (ordered by first year)
panels <- tribble(
  ~question,      ~response,      ~title,
  "bri_idim_001", "Larger",       "Want larger population",
  "bri_soim_002", "Favour",       "Favour death penalty",
  "bri_idim_004", "Decrease",     "Want less immigration",
  "bri_soim_005", "Always legal", "Abortion always legal",
  "bri_ener_001", "Increase",     "Favour nuclear power",
  "bri_econ_003", "Too much",     "Unions too powerful"
)

trends <- panels %>%
  rowwise() %>%
  reframe({
    w <- wtd_response(question_data(question))
    w %>%
      filter(response == .env$response) %>%
      transmute(title = .env$title, year, share = response_share)
  }) %>%
  mutate(title = factor(title, levels = panels$title))

# first and last point of each series carry a value label
ends <- trends %>%
  group_by(title) %>%
  filter(year == min(year) | year == max(year)) %>%
  mutate(
    end = if_else(year == min(year), "first", "last"),
    hjust = if_else(end == "first", 1.2, -0.2),
    label = scales::percent(share, accuracy = 1)
  ) %>%
  ungroup()

blue <- "#0b3d91"   # the site's link colour (site/assets/css/custom.css)
ink  <- "#272727"   # the site's heading colour
muted <- "#6b6b6b"

p <- ggplot(trends, aes(year, share)) +
  geom_line(colour = blue, linewidth = 0.7) +
  geom_point(colour = blue, size = 1.5) +
  geom_text(
    data = ends, aes(label = label, hjust = hjust),
    colour = muted, size = 3.3, family = font, vjust = -0.6
  ) +
  facet_wrap(~title, ncol = 3) +
  coord_cartesian(clip = "off") +
  scale_x_continuous(
    limits = c(1943, 2028), breaks = seq(1960, 2020, 20),
    expand = c(0, 0)
  ) +
  scale_y_continuous(
    limits = c(0, 1), breaks = seq(0, 1, 0.25),
    labels = scales::percent, expand = c(0, 0)
  ) +
  labs(
    x = NULL, y = NULL,
    caption = "Weighted share of Canadians giving each response, 1945–2026.\nSix of the 629 questions in the CVPA dataset."
  ) +
  theme_minimal(base_size = 13, base_family = font) +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(colour = "#e6e6e6", linewidth = 0.3),
    panel.spacing.x = unit(26, "pt"),
    panel.spacing.y = unit(14, "pt"),
    strip.text = element_text(hjust = 0, colour = ink, size = 12, margin = margin(b = 4)),
    axis.text = element_text(colour = muted, size = 10),
    axis.text.x = element_text(margin = margin(t = 3)),
    axis.ticks.x = element_line(colour = "#cccccc", linewidth = 0.3),
    axis.ticks.length.x = unit(2, "pt"),
    plot.caption = element_text(colour = muted, size = 10, hjust = 0, lineheight = 1.15, margin = margin(t = 10)),
    plot.margin = margin(4, 24, 2, 4),
    plot.background = element_rect(fill = "white", colour = NA)
  )

dir.create(dirname(out), showWarnings = FALSE, recursive = TRUE)
# 700 CSS px wide (the text column), rendered at 2x for sharp display
ragg::agg_png(out, width = 1400, height = 780, units = "px", res = 192, background = "white")
print(p)
invisible(dev.off())
message("Wrote ", out)
