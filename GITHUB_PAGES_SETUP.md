# GitHub Pages Setup Instructions

## The Problem
GitHub Pages is trying to use Jekyll to build your Hugo site, which fails.

## Solution: Configure GitHub Pages Settings

### Step 1: Push the .nojekyll file
In GitHub Desktop, push the latest commit (already created).

### Step 2: Configure GitHub Pages to serve from /public folder

Go to your repository settings:
1. Visit: https://github.com/ssp3nc3r/ssp3nc3r.github.io/settings/pages
2. Under "Build and deployment":
   - **Source:** Select "Deploy from a branch"
   - **Branch:** Select "master"
   - **Folder:** Select "/public" (NOT "/ (root)")
3. Click "Save"

### Alternative: Use GitHub Actions to Deploy

If the /public folder option doesn't work, here's a better approach:

1. Go to: https://github.com/ssp3nc3r/ssp3nc3r.github.io/settings/pages
2. Under "Build and deployment":
   - **Source:** Select "GitHub Actions"
3. Create `.github/workflows/deploy.yml` with this content:

```yaml
name: Deploy Hugo site to Pages

on:
  push:
    branches: ["master"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v4

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: './public'

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

This will deploy the pre-built `public/` folder directly.

## After Configuration

1. Push your changes
2. Wait 1-2 minutes
3. Visit https://ssp3nc3r.github.io
4. All images should work!

## Why This is Needed

- Hugo builds to `public/`
- GitHub Pages defaults to Jekyll (wrong!)
- `.nojekyll` tells GitHub to skip Jekyll
- Settings tell GitHub where the built files are
