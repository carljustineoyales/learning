---
name: git-conventions
description: This skill should be used when the user asks to "create a commit", "open a PR", "create a pull request", "create an issue", "push a branch", "create a release", "tag a version", "set up a new repo", "add labels", "create a worktree", or any task involving git or GitHub workflow. Also trigger when the user asks "what branch should I use", "how should I name this", "what's the commit format", or mentions conventional commits, GitFlow, PR templates, issue templates, force push, or subagent isolation.
context: fork
---

# Git Conventions

Apply these conventions to all git and GitHub tasks. All rules are non-negotiable - follow them
without exception, even if the user says otherwise in the moment.

## Enforcement Rules

| Rule                                                             | Detail                                                                                                                                                    |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Never commit or push to `main` or `develop` - always via PR      |                                                                                                                                                           |
| Never force push without explicit per-instance user approval     | Ask every time - prior approval never carries over                                                                                                        |
| Never create a worktree for a branch already checked out         | Run `git worktree list` first                                                                                                                             |
| Always use `isolation: "worktree"` for parallel Agent calls      | Every parallel subagent touching the codebase must use it - each agent = one branch = one PR                                                              |
| Always pull latest `develop` before pushing                      | `git fetch origin && git merge origin/develop` on the working branch                                                                                      |
| Always update the PR body after every push to a PR branch        | Use `gh api repos/{owner}/{repo}/pulls/{number} -X PATCH -f body="$body"` - do NOT use `gh pr edit` as it fails with a Projects Classic deprecation error |
| Always use `<<'EOF'` (single-quoted heredoc) for PR/issue bodies | Double-quoted heredocs break special characters                                                                                                           |
| Never escape backticks inside `<<'EOF'` heredocs                 | Single-quoted heredocs are literal — `\`` renders as `\`` not `` ` ``, breaking markdown formatting on GitHub                                             |
| Never use en dashes or em dashes in PR/issue bodies              | Use hyphens instead                                                                                                                                       |
| Never include `Co-authored-by:` trailers - only if user explicitly requests |                                                                                                                                                     |
| Never wrap `Closes #N` in backticks - breaks auto-close          |                                                                                                                                                           |
| Never use `gh api .../pulls/{num} -X PATCH` for labels/assignees | It silently drops them - use the issue endpoints instead                                                                                                  |
| Always add a label when creating an issue or PR                  | Use `gh issue edit` or `gh pr edit --add-label` immediately after creation                                                                                |

---

## Commit Format (Conventional Commits v1.0.0)

```
<type>(<scope>): <description>
```

- Title ≤ 50 characters, imperative mood, lowercase, no trailing period
- Scope is optional - describes the area affected (e.g. `nav`, `auth`, `gallery`)
- Types: `feat` `fix` `chore` `refactor` `style` `docs` `test` `perf` `build` `ci` `revert`
- Breaking change: append `!` before colon, add `BREAKING CHANGE:` footer

```
feat(gallery): add lightbox support
fix(nav): broken link on mobile
chore(deps): bump next from 14.0.0 to 14.1.0
feat(auth)!: replace JWT with session tokens

BREAKING CHANGE: clients must re-authenticate after upgrade
```

---

## Branch Strategy (GitFlow)

| Branch                        | Base      | PR target          |
| ----------------------------- | --------- | ------------------ |
| `feature/<issue-id>-<scope>`  | `develop` | `develop`          |
| `fix/<issue-id>-<scope>`      | `develop` | `develop`          |
| `chore/<scope>`               | `develop` | `develop`          |
| `hotfix/<scope>`              | `main`    | `main` + `develop` |
| `release/<version>`           | `develop` | `main` + `develop` |

When working from a GitHub issue, always include the issue number — e.g. `fix/107-delay-label`, `feature/53-extended-participants`. If there is no existing issue, omit the issue number and use scope only — e.g. `fix/delay-label`, `chore/cleanup-deps`.

Never commit directly to `main` or `develop`.

---

## Working Multiple Issues

- Default to **one PR per issue** — each issue gets its own branch, worktree, and PR
- Only combine into one PR if the user explicitly says "one combined PR" or "a single PR for all"
- When the user says "do the READY issues", first check if a GitHub project board exists — if not, ask which issues to work on before proceeding

---

## GitHub Project Updates

Always keep the project board current. Apply these steps on every GitHub action:

### When creating an issue
- Set **Priority** (`P0` / `P1` / `P2`) on the project item immediately after creation
- Assign a **Milestone** (`v0.1`, `v0.2`, `v1.0`, etc.) on the issue
- Set **Status** to `Backlog` (default) unless work is starting immediately

### When starting work on an issue
- Set **Status** → `In progress` on the project item
- Set **Start date** to today

### When a PR is opened
- Set **Status** → `In review` on the project item

### When a PR is merged / issue is closed
- Set **Status** → `Done` on the project item
- Set **Target date** to today if not already set

### Commands
```bash
# Set a single-select field (Priority, Status, Size)
gh project item-edit --id <item-id> --project-id <project-id> \
  --field-id <field-id> --single-select-option-id <option-id>

# Set a date field (Start date, Target date)
gh project item-edit --id <item-id> --project-id <project-id> \
  --field-id <field-id> --date "YYYY-MM-DD"

# Get item IDs and field IDs
gh project item-list <project-number> --owner <owner> --format json
gh project field-list <project-number> --owner <owner> --format json
```

---

## PR Body Template

See `templates/pr-body.md`.

---

## Issue Body Template

See `templates/issue-body.md`.

---

## Labels

See `references/labels.md`.

---

## Issue Close Reasons

See `references/issue-close.md`.

---

## Releases & Tagging

See `references/release-workflow.md`.

---

## New Repo Checklist

See `references/new-repo-checklist.md`.