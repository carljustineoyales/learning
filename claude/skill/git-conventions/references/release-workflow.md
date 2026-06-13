# Releases & Tagging

If `.github/release.yml` doesn't exist yet, copy `templates/release.yml` first.

## Release branch workflow (GitFlow)

**ALWAYS ask the user to confirm the version number before creating the release branch.** Never auto-determine it from the last tag — patch/minor/major is a human decision based on what shipped.

**Branch from `develop`, not `main`.** Make release-specific commits (version bump, last-minute fixes) directly on the release branch - do NOT create a separate PR to develop for these commits first.

**Never use `--squash` when merging release → main.** Squash creates new SHAs that diverge from develop, requiring a force push to resync. Use a regular merge instead.

```bash
# 1. Branch from develop
git fetch origin && git checkout develop && git pull origin develop
git checkout -b release/x.x.x

# 2. Commit release-specific changes directly on the branch
git commit -m "chore(theme): bump version to x.x.x"
git push origin release/x.x.x

# 3. PR release/x.x.x -> main
```

After merging to `main`, tag and release:

```bash
git fetch origin main && git checkout main && git pull origin main
git tag v1.0.0
git push origin v1.0.0
gh release create v1.0.0 --title "v1.0.0" --generate-notes --target main
```

After tagging, merge `main` back into `develop` to pick up the release commits:

```bash
git fetch origin
git checkout develop
git pull origin develop
git merge origin/main
git push origin develop
```

## Hotfix workflow

**Branch from `main`, not `develop`.** Use a descriptive slug (not a version number) for the branch name.

```bash
# 1. Branch from main
git fetch origin && git checkout main && git pull origin main
git checkout -b hotfix/<descriptive-slug>

# 2. Commit the fix directly on the branch
git commit -m "hotfix(<scope>): <description>"
git push origin hotfix/<descriptive-slug>

# 3. PR hotfix/<descriptive-slug> -> main (label: hotfix)
```

After merging to `main`, tag and release:

```bash
git fetch origin main && git checkout main && git pull origin main
git tag v1.0.0
git push origin v1.0.0
gh release create v1.0.0 --title "v1.0.0" --generate-notes --target main
```

After tagging, merge `main` back into `develop` to pick up the hotfix:

```bash
git fetch origin
git checkout develop
git pull origin develop
git merge origin/main
git push origin develop
```
