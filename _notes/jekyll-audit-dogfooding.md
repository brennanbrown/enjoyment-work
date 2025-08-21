---
title: Shipping jekyll-audit — Dogfooding a Jekyll QA CLI on a production site
tags: jekyll tooling accessibility performance seo links audit
date: 2025-08-21
curated: true
---

For over a decade, I’ve shipped sites with Jekyll. It’s simple, battle‑tested, and it fits my writing workflow. But every time I wanted a single CLI to check accessibility, links, HTML validity, and Lighthouse in one go, nothing quite fit. So I built one.

Meet `jekyll-audit` — an npm CLI that builds/serves your Jekyll site, crawls it, and runs a stack of audits (Lighthouse, Pa11y, Linkinator, HTML validator), then writes a consolidated summary.

I didn’t want another “sample demo.” I ate my own dogfood on a real site: my Jekyll project `enjoyment-work` (100+ GitHub ⭐), and used the findings to make concrete HTML and accessibility fixes.

Links:
- jekyll-audit repo: https://github.com/brennanbrown/jekyll-audit
- enjoyment-work repo: https://github.com/brennanbrown/enjoyment-work

## What jekyll-audit does

- Builds your site with Jekyll (`JEKYLL_ENV=production`).
- Serves locally and auto-detects `baseurl` from `_config.yml`.
- Discovers pages via `sitemap.xml` (or falls back to specified paths).
- Runs:
  - Lighthouse (performance, SEO, best-practices)
  - Pa11y (accessibility)
  - Linkinator (broken links)
  - HTML validation (WHATWG)
- Writes JSON (and optionally MD/HTML) reports to a dir (default `reports/`).
- Emits a consolidated `summary.json` and exits non-zero if thresholds fail.

## Quick start

Requirements: Node 18+, Ruby/Jekyll.

- Local (from a clone of jekyll-audit):
```bash
npm install
npm run build
node bin/jekyll-audit --help
node bin/jekyll-audit audit
```

- npx (recommended):
```bash
npx @brennanbrown/jekyll-audit audit
```

- Target a running server:
```bash
npx @brennanbrown/jekyll-audit --baseUrl http://127.0.0.1:4000 audit
```

- Useful flags:
```bash
# Faster link checks (internal only)
npx @brennanbrown/jekyll-audit audit --linksInternalOnly --linksConcurrency 200 --linksTimeout 15000

# Limit to fewer pages and disable sitemap
npx @brennanbrown/jekyll-audit audit --maxPages 20 --noSitemap

# Heavier Lighthouse output
npx @brennanbrown/jekyll-audit audit --output full --includeDetails --includeScreenshots
```

Optional config file `jekyll-audit.config.js`:
```js
/** @type {import('./dist/config/schema.js').AuditConfig} */
export default {
  jekyll: { buildDir: '_site', buildCommand: 'bundle exec jekyll build' },
  crawl:  { useSitemap: true, maxPages: 50, paths: ['/'] },
  thresholds: {
    lighthouse: { performance: 0.8, seo: 0.9, 'best-practices': 0.9 },
    accessibility: { maxIssues: 0 },
    links: { maxBroken: 0 },
    html: { maxErrors: 0 },
  },
  reports: { formats: ['json'], outDir: 'reports' },
};
```

## CI usage (GitHub Actions)

```yaml
name: Jekyll Audit
on: [push, pull_request]
jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Ruby
        if: hashFiles('**/Gemfile') != ''
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true
      - name: Install Jekyll deps
        if: hashFiles('**/Gemfile') != ''
        run: |
          bundle config set --local path 'vendor/bundle'
          bundle install
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm run build
      - name: Run jekyll-audit
        run: node bin/jekyll-audit audit
      - name: Upload reports
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: jekyll-audit-reports
          path: reports/
```

## Dogfooding on enjoyment-work

I ran the CLI against my real site and triaged the results. Representative run (summary):

- Lighthouse: performance 0.90, best-practices 1.00, SEO 1.00
- Accessibility (Pa11y): 39 issues across 39 pages
- Links (Linkinator): 33 broken links
- HTML validator: 464 total errors across 39 pages

Performance/SEO were great. The biggest wins were in markup correctness and link hygiene.

### 1) Duplicate IDs in templates

- Files: `_pages/tags.md`, `_pages/categories.md`, `_pages/dates.md`
- Problem: repeated IDs on list items and containers (invalid HTML, accessibility confusion).
- Fix: convert repeated `id` usage to `class` and keep single, meaningful IDs for headings.

Before (from `_pages/tags.md`):
```html
<ul id="tag-grid">
  {% for tag in site.tags %}
    <li id="tag-content"><a href="#">{{ tag[0] }}</a></li>
  {% endfor %}
</ul>
```

After:
```html
<ul class="tag-grid">
  {% for tag in site.tags %}
    <li class="tag-content"><a href="#">{{ tag[0] }}</a></li>
  {% endfor %}
</ul>
<h3 id="{{ tag | first }}">{{ tag | first }}</h3>
```

Why this matters: duplicate IDs break document semantics and can confuse assistive tech. It also creates fragile CSS/JS selectors.

### 2) Self-closing `<br/>` → HTML5 `<br>`

- Files: `_includes/backlinks.html`, `_includes/related.html`, `_includes/footer.html`, `_notes/*.md`, `_pages/*`
- Problem: HTML5 treats `<br/>` as non-standard; validators flag it.
- Fix: `<br/>` → `<br>` in all templates and markdown content.

Examples:
- `_notes/reading-material.md`
- `_notes/serendipity-outlook.md`
- `_notes/dark-theme-adoption.md`
- `_notes/reading-fractailized.md`
- `_pages/tags.md`, `_pages/categories.md`, `_pages/dates.md`

Before:
```md
> "... quoted text ..." <br/><cite>—Source</cite>
```

After:
```md
> "... quoted text ..." <br><cite>—Source</cite>
```

### 3) Void element solidus on `<img>` and `<input>`

- Files: `_includes/content.html`, `_posts/2020-04-01-Exploring-the-features-of-enjoyment-work.md`
- Problem: trailing `/>` on void elements is unnecessary in HTML5 and often flagged alongside other markup issues.
- Fix: remove the solidus.

Before:
```html
<img src="/assets/img/feed.png" alt="Feed" width="80%" />
```

After:
```html
<img src="/assets/img/feed.png" alt="Feed" width="80%">
```

Also corrected generated HTML strings in `_includes/content.html` where `<img>` and `<input>` were assembled with a `/>` and converted those to standard HTML5 tags.

### 4) Placement and structure tweaks around loops

- File: `_pages/tags.md`
- Problem: stray `<br>` inside loops created awkward structure.
- Fix: move `<br>` outside loops to avoid repeated, stray breaks and improve flow for screen readers.

### 5) Links and 404s

The link scan surfaced 33 broken links. Typical fixes include:
- Updating moved posts/notes to current slugs.
- Replacing external dead links with archived copies (e.g., web.archive.org).
- For “nice to have” external references, gracefully removing or rewording.

I keep link checks in summary mode for CI, then dive into a full detail pass locally when I’m ready to fix.

## Takeaways

- Eat your own dogfood: A real site will surface validation and a11y issues that simple demos never hit.
- HTML correctness matters: small, systematic fixes (`<br/>`, duplicate IDs, void-element solidus) significantly clean the validator output and reduce noisy errors that hide the real problems.
- Keep audits lean for CI: default “summary” outputs are diff‑friendly and fast. When you’re ready to fix, flip on the heavier flags locally.
- Jekyll is still a great publishing surface: with a modern QA pipeline, it holds up well on performance/SEO and is easy to make accessible.

## Try it on your site

- Minimal run:
```bash
npx @brennanbrown/jekyll-audit audit
```

- Heavier local analysis:
```bash
npx @brennanbrown/jekyll-audit audit --output full --includeDetails --includeScreenshots --a11yIncludeDetails --linksIncludeDetails --htmlIncludeDetails
```

- Faster internal-only link checks:
```bash
npx @brennanbrown/jekyll-audit audit --linksInternalOnly --linksConcurrency 200 --linksTimeout 15000
```

If you ship with Jekyll and want a single CLI to answer “Is my site healthy?” across performance, accessibility, HTML, and link quality — give `jekyll-audit` a spin, and let me know what else you’d like it to check.
