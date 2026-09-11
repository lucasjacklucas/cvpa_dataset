# cvpa_dataset
Canadian Voting and Policy Attitudes Dataset

## Project website

The source for the project website (https://lucasjacklucas.github.io/cvpa_dataset/) lives in `site/`. It's built with [Hugo](https://gohugo.io) (extended) and the [Researcher](https://github.com/ojroques/hugo-researcher) theme.

- Pages are Markdown files in `site/content/`.
- The theme is a git submodule in `site/themes/researcher`. Clone with `git clone --recurse-submodules`, or run `git submodule update --init` in an existing clone.
- Style changes go in `site/assets/css/custom.css`, not in the theme's files.
- To preview locally, run `hugo server` from `site/`.
- Pushing changes under `site/` to `main` rebuilds and deploys the site (`.github/workflows/hugo.yml`).
