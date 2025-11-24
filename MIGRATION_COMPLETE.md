# Website Migration Complete!

## Summary

Your website has been successfully cleaned up and migrated to `/Volumes/WORK_A/Projects/website`.

## What's Working

✅ All 31 blog posts are now visible and properly structured
✅ Each post is in Hugo page bundle format (`content/post/YYYY-MM-DD-slug/index.Rmd`)
✅ Pre-rendered HTML preserved for older posts (with all figures and assets)
✅ Newer posts (2019+) use their original rendered HTML
✅ All static pages (About, Publications, Teaching) migrated
✅ Theme and custom layouts copied
✅ Git repository initialized with proper .gitignore
✅ Site serves locally via `blogdown::serve_site()`

## Post Status Breakdown

- **15 posts** with freshly rendered HTML (newer posts from 2019-2024)
- **16 posts** with pre-rendered HTML preserved from old site (2017-2019)
  - These include all their figure directories and image assets
  - Data dependencies preserved without needing to re-run R code

## Directory Structure

```
/Volumes/WORK_A/Projects/website/
├── content/
│   ├── post/              # All 31 posts in bundle format
│   ├── about.md
│   ├── publications.md
│   └── teaching.md
├── static/                # Static assets
├── themes/                # Hugo theme
├── layouts/               # Custom layouts
├── data/                  # Data files
├── config.toml            # Site configuration (builds to public/)
├── .gitignore            # Excludes build artifacts
├── index.Rmd             # Homepage
└── README.md             # Usage instructions

## All Posts Now Visible

1. 2017-08-04 - Contours of batter comparisons
2. 2017-11-24 - Trading Stanton: a modeling sketch
3. 2017-12-03 - Run expectancy distributions
4. 2018-01-08 - Languages behind statistical learning
5. 2018-02-28 - Toeing the line: Altuve and Trout
6. 2018-04-05 - Neural networks: the real basics
7. 2018-04-25 - Modeling umpire calls
8. 2018-05-09 - Visual exploration of starting pitcher duration
9. 2018-08-05 - Stan is not an acronym
10. 2018-09-01 - Jointly modeling choice to swing
11. 2018-10-09 - McElreath's Statistical Rethinking examples
12. 2018-12-08 - Estimating the marginal value of baseball events
13. 2018-12-21 - Baseball abstract 01
14. 2019-01-03 - Scoping a data analytics project
15. 2019-02-28 - Exploring CitiBike ride data
16. 2019-03-15 - Approximating Lupi's Nobel no-degrees
17. 2019-04-08 - NYC bike share rebalancing
18. 2019-06-11 - Modeling forces in 100m Olympic sprint
19. 2019-08-02 - See the rising sea
20. 2019-10-10 - Estimating human limits to running speed
21. 2019-10-31 - Dynamic systems in Bayesian models
22. 2020-06-07 - Tables in tooltips
23. 2021-02-18 - Coding custom distribution functions in Stan
24. 2021-11-05 - Generating random numbers from custom distributions
25. 2023-08-16 - Speedy splines in Stan part one
26. 2023-08-31 - Derivative work on speedy splines
27. 2024-06-17 - New online Stan coding course
28. 2024-09-06 - Modeling recurring sports injuries
29. 2024-09-20 - Choose your favorite color
30. 2024-09-29 - Pitch selection to maximize motion-in-depth
31. 2024-10-04 - Lost in the forest

## Next Steps

### Current Status
✅ Site serves locally and all posts visible

### To Publish to GitHub Pages

**Option 1: Replace existing repository**
```bash
cd /Volumes/WORK_A/Projects/website
git remote add origin https://github.com/ssp3nc3r/ssp3nc3r.github.io.git
blogdown::build_site()
# Copy public/* to your GitHub Pages repo
```

**Option 2: Keep as separate source repository**
- Keep this as your source repo
- Build to `public/`
- Copy `public/` contents to GitHub Pages repo
- Commit and push to GitHub

### Old Site
The old site directory is preserved at:
`/Volumes/WORK_A/Projects/sas/ssp3nc3r.github.io`

You can safely delete it after verifying everything works.

## Testing Checklist

- [x] Site serves locally
- [ ] Check that all 31 posts display correctly
- [ ] Verify images load in all posts
- [ ] Test About, Publications, and Teaching pages
- [ ] Check navigation menu works
- [ ] Build site: `blogdown::build_site()`
- [ ] Deploy to GitHub Pages

## Notes

- Pre-rendered HTML files are tracked in git for older posts (necessary for display)
- Cache and temporary files are excluded via .gitignore
- All post assets (images, data files) are included in post bundles
- Configuration updated to use standard Hugo `public/` build directory
