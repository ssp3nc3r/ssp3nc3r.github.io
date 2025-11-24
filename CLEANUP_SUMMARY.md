# Website Cleanup Summary

## What Was Done

### 1. Created Clean Directory Structure
- New site location: `/Volumes/WORK_A/Projects/website`
- Follows standard Hugo/blogdown conventions
- No build artifacts or duplicate files tracked

### 2. Migrated All Content

#### Blog Posts (31 total)
- **14 posts** already in page bundle format (folders with index.Rmd) - copied directly
- **17 posts** converted from flat .Rmd files to page bundle format
- All posts now in: `content/post/YYYY-MM-DD-slug/index.Rmd`
- Associated images and assets moved into post directories

#### Static Pages
- about.md
- publications.md
- teaching.md

#### Other Assets
- Theme: hugo-theme-hello-friend-ng (copied)
- Static files (images, PDFs, etc.)
- Data files
- Custom layouts and shortcodes

### 3. Fixed Configuration

**config.toml changes:**
- Changed `publishDir = "../ssp3nc3r.github.io"` to `publishDir = "public"`
- This ensures Hugo builds to standard `public/` directory

**New .gitignore:**
- Excludes all build artifacts (`public/`, `*_cache/`, `*_files/`, `*.html`)
- Excludes R session files
- Excludes macOS .DS_Store files
- Only source files will be tracked in git

### 4. Standardized Post Structure

**Old structure had:**
- Some posts as flat files: `content/post/YYYY-MM-DD-slug.Rmd`
- Some posts in bundles: `content/post/YYYY-MM-DD-slug/index.Rmd`
- Build files scattered throughout
- Duplicates in both `/post/` and `/content/post/`

**New structure has:**
- All posts in bundle format: `content/post/YYYY-MM-DD-slug/index.Rmd`
- Post images/assets in same directory as index.Rmd
- No build artifacts
- No duplicates

## Problems Fixed

1. **Duplicate Content** - Old site had posts in multiple locations
2. **Build Artifacts Tracked** - Old site committed generated HTML/CSS/JS files
3. **Inconsistent Structure** - Mixed flat files and page bundles
4. **Wrong Build Directory** - Config pointed to sibling directory

## Next Steps

### To Test Locally:

1. Open RStudio
2. Open the website directory as a project
3. Run:
   ```r
   blogdown::serve_site()
   ```
4. View at http://localhost:4321 or similar

### To Publish:

**Option A: Direct GitHub Pages** (if you want this repo to be your GitHub Pages)
1. Initialize git: `git init`
2. Add remote: `git remote add origin https://github.com/ssp3nc3r/ssp3nc3r.github.io.git`
3. Build site: `blogdown::build_site()`
4. Force push: `git push -f origin main`

**Option B: Separate Build Directory** (safer)
1. Build site locally: `blogdown::build_site()`
2. Copy `public/` contents to your GitHub Pages repo
3. Commit and push from there

## File Comparison

- Old site: ~527 MB (with duplicates and build artifacts)
- New site: ~40 MB (source files only)
- All 31 blog posts preserved
- All static pages preserved
- All images and assets preserved

## Important Notes

- The old site directory is untouched at `/Volumes/WORK_A/Projects/sas/ssp3nc3r.github.io`
- You can delete it once you verify the new site works
- Test thoroughly before publishing
- Consider backing up the old site before deletion
