# Deployment Instructions

## Current Status
- Remote added: https://github.com/ssp3nc3r/ssp3nc3r.github.io.git
- Local branch: main
- Remote branch: master

## To Deploy (Run these in RStudio):

### Step 1: Build the site
```r
# This will build without re-rendering any .Rmd files
blogdown::build_site(build_rmd = FALSE)
```

This creates the `public/` directory with your complete website.

### Step 2: Push to GitHub

Back in Terminal (or RStudio Terminal):
```bash
cd /Volumes/WORK_A/Projects/website

# Force push your main branch to replace master
git push -f origin main:master
```

⚠️ **This will completely replace the old repo on GitHub!**

### Step 3: Verify
- Go to https://ssp3nc3r.github.io
- May take 1-2 minutes for GitHub Pages to rebuild
- All 40 posts should be visible

## Important Notes

1. **The old repo will be gone** - all that messy history will be replaced with your clean commits
2. **Your local old site** at `/Volumes/WORK_A/Projects/sas/ssp3nc3r.github.io` is unchanged (you can keep as backup)
3. **GitHub Pages will serve from master branch** - this is GitHub's default for user sites
4. **Future updates**: Just build and push normally:
   ```bash
   # After making changes
   git add -A
   git commit -m "Your message"
   git push origin main:master
   ```

## Troubleshooting

If the site doesn't update after pushing:
1. Check GitHub Actions/Pages settings at https://github.com/ssp3nc3r/ssp3nc3r.github.io/settings/pages
2. Make sure it's set to deploy from "master" branch, "/" (root)
3. Wait a few minutes - GitHub Pages can be slow

## Alternative: Use gh-pages branch

If you'd prefer to keep source and built site separate:
```bash
# After building to public/
cd public
git init
git add -A
git commit -m "Deploy site"
git push -f origin HEAD:gh-pages
```

Then set GitHub Pages to deploy from gh-pages branch.
