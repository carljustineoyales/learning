# Git Conventions

Enforces consistent git and GitHub workflow across all projects: Conventional Commits v1.0.0, GitFlow branching, PR and issue body templates, label setup, subagent isolation, force push guardrails, and release/tagging conventions. All rules are non-negotiable and applied without exception.

---

## How to Use

### Trigger phrases

You don't need special syntax. The skill fires on intent:

| Say something like... | What it does |
|---|---|
| "Create a commit" | Formats and commits with Conventional Commits |
| "Open a PR" | Creates PR with correct body, label, and assignee |
| "Create an issue" | Creates issue with correct body, label, and assignee |
| "Push a branch" | Pulls latest develop, pushes, updates PR body |
| "Create a release" | Tags and creates GitHub release with generated notes |
| "Set up a new repo" | Runs new repo checklist - labels, gitignore, release.yml |
| "What branch should I use?" | Returns correct GitFlow branch name and base |
| "What's the commit format?" | Returns Conventional Commits format with examples |

---

### Input options

**Option 1 - Describe the task (recommended)**
Just tell Claude what you want to do:

```
"Create a commit for the auth changes"
"Open a PR for this feature targeting develop"
"Create an issue for the login bug"
```

**Option 2 - Reference a file or diff**
Point to a file or paste a diff and Claude will derive the commit scope and type:

```
"Commit the changes in src/auth/"
"Open a PR for this diff"  +  [pasted diff]
```

**Option 3 - Ask a conventions question**
Ask about format, branch names, or workflow:

```
"What's the branch name for a hotfix to the nav?"
"How do I format a breaking change commit?"
"What labels should this repo have?"
```

---

### Scoping the output

By default, the full workflow runs - commit format, PR body, label, and assignee. You can narrow it:

> "Just give me the branch name."

> "Only create the commit, I'll open the PR myself."

> "What labels do I need for a new repo?"

---

## What it Enforces

| Rule | Detail |
|---|---|
| Conventional Commits v1.0.0 | `<type>(<scope>): <description>`, max 50 chars, imperative mood |
| GitFlow branching | `feature/<issue-id>-<scope>` or `feature/<scope>` (no issue), `fix/<issue-id>-<scope>` or `fix/<scope>` (no issue), `hotfix/*`, `release/*` - never direct to `main`/`develop` |
| PR body template | Summary + Table of Changes, hyphens only (no en/em dashes), single-quoted heredoc |
| PR body updates | Use `gh api .../pulls/{num} -X PATCH` after every push - not `gh pr edit` |
| Labels and assignees | Set via `gh api .../issues/{num}/labels` and `.../assignees` after PR creation |
| No Co-authored-by trailers | Omitted unless the user explicitly requests it |
| Force push approval | Required every time - prior approval never carries over |
| Subagent isolation | `isolation: "worktree"` on all parallel Agent calls |
| Pull before push | `git fetch origin && git merge origin/develop` before every push |

---

## Example

**Input:**
> "Open a PR for the changes on this branch."

**Output includes:**
- Commit message: `feat(auth): add Google SSO support`
- PR title: `feat(auth): add Google SSO support`
- PR body with Summary and Table of Changes sections
- `docs` label set via `gh api`
- Assignee set to current git user

