# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-08-20
### Added
- `.ruby-version` pinned to `3.2.2` for local development.
- Netlify build environment in `netlify.toml`: `RUBY_VERSION=3.2.2`, `JEKYLL_ENV=production`.
- Obsidian-style `[[wikilinks]]` support across collections via `_plugins/wikilinks.rb` (aliases and header anchors supported).
- SCSS pipeline with `assets/css/main.scss` and partials (`_variables.scss`, `_base.scss`, `_components.scss`, `_utilities.scss`).
- Dark mode support with `data-theme` overrides, early theme setter in `_includes/head.html`, and toggle in `_includes/header.html` (`assets/js/theme-toggle.js`).
- Global `excerpt_separator: <!--more-->` to prevent Liquid excerpt warnings. (`_config.yml`, `_BLANK_config.yml`)

### Changed
- `Gemfile`:
  - Bump `jekyll` to `~> 4.3`.
  - Bump `jekyll-feed` to `~> 0.17`.
  - Add `webrick` for Ruby 3 compatibility.
- `netlify.toml`:
  - Use `bundle exec jekyll build`.
  - Fix publish path to `_site` (relative).
- Dependencies updated (see `Gemfile.lock`):
  - `jekyll` 4.4.1, `liquid` 4.0.4, `jekyll-feed` 0.17.0, and other transitive gems.
- `_includes/backlinks.html` now detects both legacy `[[...]]` references and resolved Markdown links (by matching `page.url`).
- UI/UX: Search input now full-width within header column; icon vertically centered. (`assets/css/_components.scss`, `_includes/header.html`)
- UI/UX: Search results dropdown anchored below input, full-width, correct z-index, and light legacy styling regardless of theme. (`assets/css/_components.scss`)
- UI/UX: Theme toggle aligned inline with nav items and styled to match. (`assets/css/_components.scss`, `_includes/header.html`)

### Removed
- `JEKYLL_ENV` key from `_config.yml` (now set via environment variable).

### Fixed
- Liquid `tainted?` error on Ruby 3 by updating `liquid`.
- Verified local build and detached dev server start (`bundle exec jekyll serve --detach`).
- Malformed closing tag in `_includes/head.html` and broken anchor attributes in `_includes/header.html`.
- Explicit excerpt on archive page to avoid auto-excerpt modification warning. (`_pages/archive.md`)

