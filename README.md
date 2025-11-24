# Personal Website - Clean Build

This is a cleaned and reorganized version of ssp3nc3r.github.io.

## Structure

- `content/post/` - All blog posts in Hugo page bundle format (each post in its own directory with index.Rmd)
- `content/` - Static pages (about.md, publications.md, teaching.md)
- `static/` - Static assets
- `themes/` - Hugo theme (hugo-theme-hello-friend-ng)
- `config.toml` - Site configuration

## Building the Site

### Using blogdown in RStudio:

```r
# Install blogdown if needed
install.packages("blogdown")

# Serve the site locally
blogdown::serve_site()

# Build the site
blogdown::build_site()
```

### Using Hugo directly:

```bash
# Serve locally
hugo serve

# Build
hugo
```

## Publishing

The site builds to `public/` directory. For GitHub Pages:

1. Build the site
2. Copy contents of `public/` to your GitHub Pages repository
3. Commit and push

## Notes

- All posts are now in standard Hugo page bundle format
- Build artifacts are excluded via .gitignore
- No duplicate content or build files tracked in git
- Configuration updated to build to `public/` directory
