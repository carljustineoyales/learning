# PR Body Template

Pass via `<<'EOF'` heredoc. Set label and assignee via `gh api` after creation.

```markdown
## Summary

- Bullet points describing what changed and why

## Table of Changes

| File           | Change                |
| -------------- | --------------------- |
| `path/to/file` | Description of change |

## Issues

- Closes #<num>
```

Omit `## Issues` entirely if there is no related issue.

```bash
# After gh pr create:
gh api repos/{owner}/{repo}/issues/{pr_number}/labels -X POST -f 'labels[]=<label>'
gh api repos/{owner}/{repo}/issues/{pr_number}/assignees -X POST -f 'assignees[]=<user>'
```
