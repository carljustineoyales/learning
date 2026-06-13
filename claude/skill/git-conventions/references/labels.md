# Labels

Create these on every new repo. Check which already exist first.

| Label      | Color    | Description              |
| ---------- | -------- | ------------------------ |
| `feat`     | `ededed` | A new feature            |
| `fix`      | `d73a4a` | A bug fix                |
| `chore`    | `fef2c0` | Maintenance tasks        |
| `refactor` | `e4e669` | Code restructured        |
| `style`    | `c5def5` | Formatting only          |
| `docs`     | `0075ca` | Documentation only       |
| `test`     | `bfd4f2` | Adding/updating tests    |
| `perf`     | `b60205` | Performance improvements |
| `build`    | `f9d0c4` | Build system/deps        |
| `ci`       | `0e8a16` | CI/CD config             |
| `revert`   | `e11d48` | Reverts a commit         |
| `hotfix`   | `e11d48` | Hotfix branch PR         |
| `release`  | `0075ca` | Release branch PR        |

```bash
gh api repos/{owner}/{repo}/labels -X POST -f name="<name>" -f color="<hex>" -f description="<desc>"
```
