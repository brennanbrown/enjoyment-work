<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/brennanbrown/enjoyment-work">
    <img src="/assets/img/profile.png" alt="Logo" width="120" height="120">
  </a>

  <h3 align="center">Enjoyment Work: Theme for Jekyll</h3>

  <p align="center">
    An extensive Jekyll theme designed to have similar functionality to Roam Research.
    <br />
    <a href="https://github.com/brennanbrown/enjoyment-work"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <strong><a href="https://enjoyment-work.netlify.app">View Demo</a></strong>
    ·
    <a href="https://github.com/brennanbrown/enjoyment-work/issues">Report Bug</a>
    ·
    <a href="https://github.com/brennanbrown/enjoyment-work/issues">Request Feature</a>
  </p>
</p>

<!-- BADGES -->
<p align="center">
<img alt="Netlify Status" src="https://api.netlify.com/api/v1/badges/3cc0e6e6-1ec8-4af8-ad0e-aced073231c4/deploy-status">
<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/brennanbrown/enjoyment-work"> 
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/brennanbrown/enjoyment-work"> 
<a href="https://github.com/brennanbrown/enjoyment-work/search?l=html"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/brennanbrown/enjoyment-work"></a>
<a href="https://github.com/brennanbrown/enjoyment-work/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/brennanbrown/enjoyment-work"></a> 
<a href="https://github.com/brennanbrown/enjoyment-work/commits/main"><img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/brennanbrown/enjoyment-work"></a>
<a href="https://github.com/brennanbrown/enjoyment-work/blob/main/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/brennanbrown/enjoyment-work"></a> 
<br />
<a href="https://github.com/brennanbrown?tab=followers"><img alt="GitHub followers" src="https://img.shields.io/github/followers/brennanbrown?label=Follow%20Me%21&style=social"></a>
<a href="https://github.com/brennanbrown/enjoyment-work/watchers"><img alt="GitHub watchers" src="https://img.shields.io/github/watchers/brennanbrown/enjoyment-work?label=Watch%21&style=social"></a>
<a href="https://github.com/brennanbrown/enjoyment-work/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/brennanbrown/enjoyment-work?label=Star%21&style=social"> </a>
<a href="https://github.com/brennanbrown/enjoyment-work/network/members"><img alt="GitHub forks"src="https://img.shields.io/github/forks/brennanbrown/enjoyment-work?label=Fork%21&style=social"></a>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

**Enjoyment Work** is an academic / research-focused theme that provides extensive features for note-taking and personal growth. It is based off of the [Digital Garden](https://github.com/MaggieAppleton/digital-gardeners) philosophy, which you can read more about on the [**demo site**](https://enjoyment-work.netlify.app)

The next step for Enjoyment Work is to properly configure the syntax required to work with [**Obsidian**](https://obsidian.md/), a powerful knowledge base that works on top of a local folder of plain text Markdown files. Which would ultimately allow somebody to turn their Obsidian notes into an online blog by simply using the `_notes` directory.

There are several other planned features in the [Roadmap](#roadmap) ahead, as the project is far from perfect. It is currently using the Bootstrap 4 framework, which although is powerful and extensive, does slow thing down, along with the rather large `style.css` file which needs to be trimmed down and converted into SASS.

If you like the idea of being able to use Jekyll as a free alternative to Roam Research, Notion, etc. then please feel free to [**use this template**](https://github.com/brennanbrown/enjoyment-work/generate), or even better, contribute to this project by [submitting a pull request](https://github.com/brennanbrown/enjoyment-work/pulls) or [creating an issue](https://github.com/brennanbrown/enjoyment-work/issues)! First-time contributors are definitely welcomed!

In addition, I have created three other free Jekyll themes that you might be interested in:

- :potable_water: [**Watery**](https://github.com/brennanbrown/watery): A minimalist, bare-bones theme for Jekyll only using the Water.css framework while still following the best practices for accessibility and search-engine optimization.
- :notebook_with_decorative_cover: [**Purelog**](https://github.com/brennanbrown/purelog): A responsive sidebar Jekyll theme using the Pure.css framework, designed for writers and bloggers of all kinds.
- [**Classic Spirits**](https://github.com/brennanbrown/classic-spirit): A classic sidebar Jekyll theme for old-school blogging, created with the Bulma framework. Built on Soot Spirits by Abhishek Nagekar.

![Enjoyment-Work Screen Shot](/assets/img/end_result.jpg)

### Features

Here are a few interesting features of this Jekyll theme:

- A fully customizable and empty `_BLANK_config.yml` to make getting up-and-running easy.
- A speedy, on-site search function using [Simply Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search).
- Custom collections for different types of material (note-taking, journal writing, etc.)
- An auto-generating `/archive` page that displays all entries from _all_ collections.
- Auto-generating `/tags` and `/categories` pages.
- Breadcrumbs for improved navigation and SEO.
- Having a `_pages` collection for easier organization.
- An author bio at the end of each post. (Located in `_inclues/author.html`)
- Full Rouge support for [syntax highlighting](https://spsarolkar.github.io/rouge-theme-preview/). (Currently using `base16.dark`)
- Auto-generated RSS feed, sitemap, accessibility features, and search-engine optimization.
- Creates backlinks to other notes automatically
- Context menu on feed to instantly see related posts and backlinks
- Supports Roam-style double bracket link syntax to other notes
- On hover page previews
- Features a simple and responsive design
- Supports Markdown or HTML notes

## Installation

### Prerequisites

Jekyll requires the following:

- Ruby version **2.5.0** or higher
- RubyGems
- GCC and Make

See [Requirements](https://jekyllrb.com/docs/installation/#requirements) for guides and details.

### Instructions

1. Install all [prerequisites](https://jekyllrb.com/docs/installation/).
2. Install the jekyll and bundler [gems](https://jekyllrb.com/docs/ruby-101/#gems).

```
gem install jekyll bundler
```

3. Clone this repository.

```
git clone https://github.com/brennanbrown/enjoyment-work.git
```

4. Change into your new directory.

```
cd enjoyment-work
```

5. Install gems from the `Gemfile`.

```
bundle install
```

6. Build the site and make it available on a local server.

```
bundle exec jekyll serve
```

7. Browse to [http://localhost:4000](http://localhost:4000)

If you encounter any errors during this process, check that you have installed all the prerequisites in [Requirements](https://jekyllrb.com/docs/installation/#requirements).

If you still have issues, see [Troubleshooting](https://jekyllrb.com/docs/troubleshooting/#configuration-problems).

## Getting Started

Once you have Jekyll up-and-running, there are only a few steps needed to make this theme your own:

1. Fill out the `_BLANK_config.yml` configuration file and replace the current `_config.yml`
2. Remove the `example_posts` folder in `_posts`, `_notes`, `_journals` and start writing your own!
3. Modify or remove the pages in `_pages` to however you see fit.
4. _(Optional)_ Modify or remove this `README.md` with information about your own project or blog.
5. _(Optional)_ Modify the CSS files in the `assets` folder to customize the site.

<!-- ROADMAP -->

## Roadmap

There are several features that I'm still planning to create and integrate, including:

- Optimize and minify the stylesheets and design.
- Configure to work with Obsidian out-of-the-box.
- Create a [Theme Gem](https://jekyllrb.com/docs/themes/#publishing-your-theme)
- Add easy and automatic buttons to ["Deploy to Netlify"](https://docs.netlify.com/site-deploys/create-deploys/#deploy-to-netlify-button), Heroku, etc.
- Add Travis continious integration checks
- Add additional documentation for creating custom collections and auto generated pages
- Add more example posts and articles

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->

## License

Distributed under the MIT License. You can use this project however you see fit without needing to give attribution.

See `LICENSE` for more information.

## Resources

While creating this theme, I came across a lot of helpful and hard-to-find resources. If you'd like to dive deeper into Jekyll, check them out:

- Jumping Into Jekyll: https://dev.to/brennan/jumping-into-jekyll-4o9h
- Jekyll Cheatsheet: https://devhints.io/jekyll
- Course on Jekyll: https://learn-the-web.algonquindesign.ca/topics/jekyll/
- Jekyll for Designers: http://simpleprimate.com/jekyll-for-designers/index.html
- Dynamic Copyright on Jekyll: https://michaelsoolee.com/jekyll-copyright/
- Creating breadcrumbs in Jekyll: https://jekyllcodex.org/without-plugin/breadcrumbs/
- Display all items from ALL collections: https://stackoverflow.com/questions/31171041/listing-all-collections-in-jekyll

### Other Resources

- For markdown previews: https://jaspervdj.be/lorem-markdownum/
- Case Study on webfont performance: https://www.keycdn.com/blog/web-font-performance
- An extensive `.gitignore`: https://miguelmota.com/bytes/extensive-gitignore/

## Credit

[**Simply Jekyll**](https://github.com/raghuveerdotnet/simply-jekyll) was created by [Raghuveer S.](https://github.com/raghuveerdotnet)

[**Simple Jekyll Search**](https://github.com/christian-fei/Simple-Jekyll-Search) was created by [Christian Fei](https://github.com/christian-fei).
