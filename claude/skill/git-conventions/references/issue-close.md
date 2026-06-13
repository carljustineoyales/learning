# Issue Close Reasons

```bash
gh api repos/{owner}/{repo}/issues/{number} -X PATCH -f state=closed -f state_reason=completed
# state_reason: completed | not_planned | duplicate
```
