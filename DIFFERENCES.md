# Differences Between Old and New Website Directories

## Size Reduction

**Old site:** 1.6 GB (1,600 MB)
**New site:** 131 MB

**Reduction:** 92% smaller (1,469 MB removed)

## File Count

**Old site:** 2,538 files
**New site:** 925 files

**Reduction:** 1,613 fewer files (64% reduction)

---

## Major Structural Changes

### 1. **Post Organization**

#### Old Site (`/Volumes/WORK_A/Projects/sas/ssp3nc3r.github.io`):
- **Inconsistent structure:**
  - 17 posts as flat `.Rmd` files in `content/post/`
  - Some posts in bundle format (`content/post/YYYY-MM-DD-slug/`)
  - Duplicate posts in both `/post/` and `/content/post/`
  - Generated HTML scattered throughout repo

#### New Site (`/Volumes/WORK_A/Projects/website`):
- **Consistent structure:**
  - ALL 40 posts in Hugo page bundle format
  - Each in `content/post/YYYY-MM-DD-slug/index.Rmd`
  - Assets co-located with their posts
  - Zero flat `.Rmd` files at root level
  - No duplicate content

### 2. **Build Artifacts**

#### Old Site:
- ❌ ~10 HTML/CSS/JS files at root (committed to git)
- ❌ Entire built site in root directory
- ❌ Multiple versions of CSS/JS bundles
- ❌ Generated directories like `/post/`, `/categories/`, `/tags/` committed
- ❌ Total built content: ~1.3 GB

#### New Site:
- ✅ No build artifacts at root
- ✅ Clean source-only repository
- ✅ Builds to `public/` directory (gitignored)
- ✅ Source files only: 131 MB

### 3. **Git Configuration**

#### Old Site:
```gitignore
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
.Rproj.user
.csv
.rds
.Rhistory
```
- Mixed Jekyll/blogdown ignore rules
- Does NOT exclude HTML files
- Does NOT exclude build directories
- Allows build artifacts to be committed

#### New Site:
```gitignore
# Hugo build artifacts
/public/
/resources/_gen/
.hugo_build.lock

# R and blogdown
.Rproj.user
.Rhistory
.RData
*.rds
*.csv

# Blogdown/RMarkdown cache and output
*_cache/
# Keep index.html in post bundles (pre-rendered posts)
/*.html

# macOS
.DS_Store
```
- Proper Hugo/blogdown ignore rules
- Excludes build directories
- Keeps pre-rendered post HTML (intentional)
- Excludes cache directories

### 4. **Configuration**

#### Old Site (`config.toml`):
```toml
publishDir = "../ssp3nc3r.github.io"
```
- Builds to SIBLING directory
- Confusing deployment structure
- Same repo name as build output

#### New Site (`config.toml`):
```toml
publishDir = "public"
```
- Standard Hugo convention
- Builds to local `public/` directory
- Clear separation of source and build

### 5. **Post Assets**

#### Old Site:
- Images scattered in multiple locations:
  - `/post/YYYY-MM-DD-slug_files/`
  - `/images/YYYY-MM-DD-slug/`
  - `/static/post/YYYY-MM-DD-slug_files/`
- Duplicate copies of same images
- Inconsistent naming conventions

#### New Site:
- Assets co-located with posts:
  - `content/post/YYYY-MM-DD-slug/YYYY-MM-DD-slug_files/`
  - `content/post/YYYY-MM-DD-slug/images/`
- Global static assets in `/static/` only when necessary
- Single source of truth for each asset

### 6. **Duplicate Content Removed**

#### Old Site Had:
- Duplicate posts in `/post/` AND `/content/post/`
- Same `.Rmd` files in multiple locations
- Old HTML files from previous builds
- Test posts and drafts committed

#### New Site:
- Single location for all posts: `content/post/`
- Test posts excluded (like `2021-05-12-test-me`)
- Only production content

### 7. **System Files**

#### Old Site:
- 31 `.DS_Store` files (macOS metadata)
- Committed throughout repo

#### New Site:
- 8 `.DS_Store` files (some copied with content)
- Gitignored going forward
- Will be cleaned on next commit

---

## What Was Preserved

✅ **All 40 blog posts** with full content
✅ **All post assets** (images, data files, etc.)
✅ **All pre-rendered HTML** for older posts
✅ **Static pages** (About, Publications, Teaching)
✅ **Theme and customizations**
✅ **Site configuration** (with fixes)
✅ **Data files** in `/data/`
✅ **Custom layouts** and shortcodes

---

## What Was Removed

❌ **Build artifacts** (~1.3 GB)
❌ **Duplicate content** (~100 MB)
❌ **Old rendered HTML** at root
❌ **CSS/JS bundles** at root
❌ **Jekyll artifacts**
❌ **Multiple copies of posts**
❌ **Test/draft posts**
❌ **Metadata files** (.DS_Store in most places)
❌ **Cache directories** from old builds

---

## Summary of Improvements

| Aspect | Old Site | New Site |
|--------|----------|----------|
| **Size** | 1.6 GB | 131 MB |
| **Files** | 2,538 | 925 |
| **Structure** | Inconsistent | Standardized |
| **Duplicates** | Many | None |
| **Build artifacts tracked** | Yes (bad) | No (good) |
| **Hugo compliance** | Partial | Full |
| **Post format** | Mixed | 100% bundles |
| **Ready to deploy** | No (messy) | Yes (clean) |
| **Git hygiene** | Poor | Excellent |
| **Maintainability** | Difficult | Easy |

---

## Technical Details

### Post Conversion Summary:
- **17 posts** converted from flat `.Rmd` to page bundles
- **6 posts** copied from old site (2020-2021 posts)
- **2 posts** (2024-10, 2025-01) were missing entirely
- **1 post** (2019-05) was missing
- **16 posts** needed pre-rendered HTML copied
- **9 posts** needed figure directories copied
- **1 post** needed images moved to `/static/`

### Directory Structure:
```
Old: Flat and scattered
/content/post/2017-08-04-slug.Rmd  ❌
/post/2017-08-04-slug/index.html   ❌
/content/post/2017-08-04-slug/     ❌

New: Consistent bundles
/content/post/2017-08-04-slug/
  ├── index.Rmd                     ✅
  ├── index.html                    ✅
  └── 2017-08-04-slug_files/        ✅
      └── figure-html/
```

---

## Migration Was Successful

The new website directory is:
- ✅ **92% smaller** (from 1.6 GB to 131 MB)
- ✅ **Properly structured** (100% Hugo page bundles)
- ✅ **Git-friendly** (source files only)
- ✅ **Complete** (all 40 posts, all assets)
- ✅ **Maintainable** (clear organization)
- ✅ **Deployable** (ready to build and publish)

The old directory can be safely archived or deleted after verification.
