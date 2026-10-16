# Draws the figures at the top of the home page: one small chart per item in
# site/assets/images/home-trends/. Issue charts show the weighted share of
# Canadians giving one response over the years the question was asked; vote
# charts show one party's weighted share of decided vote intention. The
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

# What to draw, in display order: the question (vote_intention for parties),
# the response or party to plot, and the chart title. The file name slug is
# built from the title. Issue and vote charts alternate.
panels <- tribble(
  ~question,        ~response,                  ~title,
  "bri_idim_004",   "Decrease",                 "Want less immigration",
  "vote_intention", "Liberal",                  "Would vote Liberal",
  "bri_soim_002",   "Favour",                   "Favour the death penalty",
  "vote_intention", "PC/Conservative",          "Would vote Conservative",
  "bri_intd_005",   "Closer",                   "Want closer ties with the US",
  "vote_intention", "CCF/NDP",                  "Would vote NDP",
  "bri_soim_005",   "Always legal",             "Abortion should always be legal",
  "bri_idim_002",   "In favour",                "Favour Quebec separation",
  "vote_intention", "Bloc Quebecois",           "Would vote Bloc Qu\u00e9b\u00e9cois",
  "bri_idim_001",   "Larger",                   "Want a larger population",
  "bri_soim_011",   "Favour",                   "Favour same-sex marriage",
  "vote_intention", "Reform/Alliance",          "Would vote Reform / Alliance",
  "bri_ener_001",   "Increase",                 "Want more nuclear power",
  "env_intd_003",   "Favourable",               "Favourable view of the US",
  "vote_intention", "Green",                    "Would vote Green",
  "bri_econ_003",   "Too much",                 "Unions are too powerful",
  "gal_soim_004",   "Not harsh enough",         "Courts not harsh enough",
  "vote_intention", "Social Credit/Creditiste", "Would vote Social Credit",
  "bri_soim_003",   "Should",                   "Doctors may end a patient's life",
  "bri_hwps_002",   "Should",                   "Workers should be able to strike",
  "bri_intd_008",   "Continue",                 "Keep the monarchy"
)

# Weighted shares by year. Vote intention is the share of decided respondents,
# so Undecided is dropped and the remaining parties renormalised; years where a
# party is below one percent (a stray early or late mention) are dropped.
share_by_year <- function(question) {
  w <- wtd_response(question_data(question))
  if (question == "vote_intention") {
    w <- w %>%
      filter(response != "Undecided") %>%
      group_by(year) %>%
      mutate(response_share = count / sum(count)) %>%
      ungroup() %>%
      filter(response_share >= 0.01)
  }
  w
}
shares <- lapply(unique(panels$question), share_by_year)
names(shares) <- unique(panels$question)

trends <- panels %>%
  rowwise() %>%
  reframe({
    shares[[question]] %>%
      filter(response == .env$response, count > 0) %>%
      transmute(title = .env$title, year, share = response_share)
  })

blue  <- "#0b3d91"   # the site's link colour (site/assets/css/custom.css)
ink   <- "#272727"   # the site's heading colour
muted <- "#6b6b6b"

draw_one <- function(dat, title, vote = FALSE) {
  # First and last values are labelled beside the point. A series that starts
  # at the left edge (1945) gets its first label above and to the right of the
  # point instead, so it doesn't run into the axis labels.
  ends <- dat %>%
    filter(year == min(year) | year == max(year)) %>%
    mutate(
      first = year == min(year),
      hjust = case_when(!first ~ -0.25, year <= 1948 ~ 0, TRUE ~ 1.25),
      vjust = if_else(first & year <= 1948, -1.1, -0.7),
      label = scales::percent(share, accuracy = 1)
    )
  span <- range(dat$year)
  ggplot(dat, aes(year, share)) +
    geom_line(colour = blue, linewidth = 0.8) +
    geom_point(colour = blue, size = if (nrow(dat) > 30) 1.3 else 2) +
    geom_text(
      data = ends, aes(label = label, hjust = hjust, vjust = vjust),
      colour = muted, size = 3.6, family = font
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
      subtitle = sprintf(
        if (vote) "%% of decided voters, %d–%d (weighted)" else "%% of Canadians, %d–%d (weighted)",
        span[1], span[2]
      )
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
  slug <- gsub("[^a-z0-9]+", "-", gsub("['`^]", "", tolower(iconv(title, to = "ASCII//TRANSLIT"))))
  slug <- gsub("^-|-$", "", slug)
  file <- file.path(out_dir, sprintf("%02d-%s.svg", i, slug))
  p <- draw_one(filter(trends, title == .env$title), title, vote = panels$question[i] == "vote_intention")
  # 3.6in x 2.7in at 96 dpi is about 346 x 259 CSS px; the page scales it.
  # fix_text_size = FALSE leaves glyph spacing to the browser instead of
  # forcing R's measured widths with textLength, which would distort the type.
  svglite::svglite(file, width = 3.6, height = 2.7, bg = "white", fix_text_size = FALSE, id = slug)
  print(p)
  invisible(dev.off())
  prefix_ids(file, slug)
  message("Wrote ", file)
}
