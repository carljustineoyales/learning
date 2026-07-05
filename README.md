# Personal Learning Repository

A structured self-study repository covering shell scripting, Python, Terraform, and Claude API development.

## Structure

```
learning/
├── bash/           # Shell scripting curriculum (12 modules)
├── python/         # Python curriculum (10 modules)
├── terraform/      # Terraform curriculum (8 modules)
├── claude/         # Claude API certification work
└── prompts/        # Learning curriculum templates
```

---

## Bash

Beginner-to-confident shell scripting curriculum. `Prompt.md` contains the full 12-module instructor prompt.

| Module | Topic | Status |
|--------|-------|--------|
| 1 | Intro to shell scripts, shebang, permissions | Done |
| 2 | Variables, arithmetic, special variables | Done |
| 3 | User input/output, pipes, heredocs, colours | Done |
| 4 | Conditionals | Done |
| 5 | Loops | In progress |
| 6 | Functions | Planned |
| 7 | Error handling and safe scripting | Planned |
| 8 | Text processing (grep, sed, awk) | Planned |
| 9 | Files, directories, and the filesystem | Planned |
| 10 | Processes and job control | Planned |
| 11 | Configuration, arguments, and script design | Planned |
| 12 | Practical project | Planned |

---

## Python

Beginner-to-confident Python curriculum. `Prompt.md` contains the full instructor prompt.

| Module | Topic | Status |
|--------|-------|--------|
| 1 | Python Basics & Setup | In progress |
| 2 | Strings and Numbers | Planned |
| 3 | Control Flow | Planned |
| 4 | Loops | Planned |
| 5 | Functions | Planned |
| 6 | Data Structures | Planned |
| 7 | Files and Error Handling | Planned |
| 8 | Modules and Libraries | Planned |
| 9 | Object-Oriented Programming | Planned |
| 10 | Practical Python (projects) | Planned |

---

## Terraform

Beginner-to-confident Terraform curriculum for AWS infrastructure, aimed at the HashiCorp Terraform Associate certification. `PROMPT.md` contains the full 8-module instructor prompt.

| Module | Topic | Status |
|--------|-------|--------|
| 1 | Your first Terraform configuration | Done |
| 2 | Resources, plans, and the Terraform workflow | Done |
| 3 | Variables, outputs, and keeping configuration flexible | Done |
| 4 | State — what Terraform remembers and why it matters | In progress |
| 5 | Locals, data sources, and reading existing infrastructure | Planned |
| 6 | Modules — packaging and reusing infrastructure | Planned |
| 7 | Meta-arguments, expressions, and production patterns | Planned |
| 8 | Guided practice project | Planned |

---

## Claude

Claude API certification work using the Anthropic Python SDK.

- **`claude/certification/domain1-agent/`** — Domain 1 agent exercises
  - `agent.py` — Basic API connection and message example
  - `requirements.txt` — Dependencies (`anthropic==0.86.0`)

Setup:
```bash
cd claude/certification/domain1-agent
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## Prompts

- **`prompts/LEARN.md`** — Template for structuring a beginner-to-confident course on any topic
