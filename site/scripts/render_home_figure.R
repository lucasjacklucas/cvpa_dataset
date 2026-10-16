# Draws the figures at the top of the home page: one small chart per question
# in site/assets/images/home-trends/, each showing the weighted share of
# Canadians giving one response over the years the question was asked. The
# home-figure shortcode (layouts/shortcodes/home-figure.html) inlines them all
# and cycles through them.
#
# Rerun from the repository root whenever the data change, then commit the SVGs:
#   Rscript site/scripts/render_home_figure.R
# Needs the cvpa package and its data cache (cvpa::update_cvpa_data()), plus
# ggplot2, svglite and systemfonts.
#
# The output is SVG rather than PNG so the browser draws the text in the site's
# own web font (Inconsolata) and the lines stay crisp at any size.
# scripts/fonts/ holds static Inconsolata TTFs (googlefonts/Inconsolata, OFL
# licence) so that R measures text with the same metrics the browser will use
# when it lays out the labels.

suppressPackageStartupMessages({
  library(cvpa)
  library(dplyr)
  library(ggplot2)
})

out_dir <- "site/assets/images/home-trends"

systemfonts::register_font(
  "Inconsolata",
  plain = "site/scripts/fonts/Inconsolata-Regular.ttf",
  bold = "site/scripts/fonts/Inconsolata-Medium.ttf"
)
font <- "Inconsolata"

# question, the response to plot, and the chart title, in display order.
# The file name slug is built from the title.
panels <- tribble(
  ~question,      ~response,      ~title,
  "bri_idim_004", "Decrease",     "Want less immigration",
  "bri_soim_002", "Favour",       "Favour the death penalty",
  "bri_intd_005", "Closer",       "Want closer ties with the US",
  "bri_soim_005", "Always legal", "Abortion should always be legal",
  "bri_idim_001", "Larger",       "Want a larger population",
  "bri_ener_001", "Increase",     "Want more nuclear power",
  "bri_econ_003", "Too much",     "Unions are too powerful",
  "bri_soim_003", "Should",       "Doctors may end a patient's life"
)

trends <- panels %>%
  rowwise() %>%
  reframe({
    w <- wtd_response(question_data(question))
    w %>%
      filter(response == .env$response) %>%
      transmute(title = .env$title, year, share = response_share)
  })

blue  <- "#0b3d91"   # the site's link colour (site/assets/css/custom.css)
ink   <- "#272727"   # the site's heading colour
muted <- "#6b6b6b"

draw_one <- function(dat, title) {
  ends <- dat %>%
    filter(year == min(year) | year == max(year)) %>%
    mutate(
      hjust = if_else(year == min(year), 1.25, -0.25),
      label = scales::percent(share, accuracy = 1)
    )
  span <- range(dat$year)
  ggplot(dat, aes(year, share)) +
    geom_line(colour = blue, linewidth = 0.8) +
    geom_point(colour = blue, size = 2) +
    geom_text(
      data = ends, aes(label = label, hjust = hjust),
      colour = muted, size = 3.6, family = font, vjust = -0.7
    ) +
    coord_cartesian(clip = "off") +
    scale_x_continuous(
      limits = c(1943, 2028), breaks = seq(1960, 2020, 20), expand = c(0, 0)
    ) +
    scale_y_continuous(
      limits = c(0, 1), breaks = seq(0, 1, 0.25),
      labels = scales::percent, expand = c(0, 0)
    ) +
    labs(
      x = NULL, y = NULL, title = title,
      subtitle = sprintf("%% of Canadians, %d–%d (weighted)", span[1], span[2])
    ) +
    theme_minimal(base_size = 12, base_family = font) +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(colour = "#e6e6e6", linewidth = 0.3),
      plot.title = element_text(colour = ink, size = 12.5, face = "bold", margin = margin(b = 2)),
      plot.subtitle = element_text(colour = muted, size = 10, margin = margin(b = 10)),
      plot.title.position = "plot",
      axis.text = element_text(colour = muted, size = 10),
      axis.text.x = element_text(margin = margin(t = 4)),
      axis.ticks.x = element_line(colour = "#cccccc", linewidth = 0.3),
      axis.ticks.length.x = unit(2, "pt"),
      plot.margin = margin(6, 22, 4, 4),
      plot.background = element_rect(fill = "white", colour = NA)
    )
}

# svglite names clip paths by their coordinates, so charts with the same layout
# share ids. Prefix them per file so the inlined SVGs don't collide.
prefix_ids <- function(file, slug) {
  x <- readLines(file, warn = FALSE)
  x <- gsub("id='cp", sprintf("id='%s-cp", slug), x, fixed = TRUE)
  x <- gsub("url(#cp", sprintf("url(#%s-cp", slug), x, fixed = TRUE)
  writeLines(x, file)
}

unlink(out_dir, recursive = TRUE)
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
for (i in seq_len(nrow(panels))) {
  title <- panels$title[i]
  slug <- gsub("[^a-z0-9]+", "-", tolower(title))
  slug <- gsub("^-|-$", "", slug)
  file <- file.path(out_dir, sprintf("%02d-%s.svg", i, slug))
  p <- draw_one(filter(trends, title == .env$title), title)
  # 3.6in x 2.7in at 96 dpi is about 346 x 259 CSS px; the page scales it.
  # fix_text_size = FALSE leaves glyph spacing to the browser instead of
  # forcing R's measured widths with textLength, which would distort the type.
  svglite::svglite(file, width = 3.6, height = 2.7, bg = "white", fix_text_size = FALSE, id = slug)
  print(p)
  invisible(dev.off())
  prefix_ids(file, slug)
  message("Wrote ", file)
}
