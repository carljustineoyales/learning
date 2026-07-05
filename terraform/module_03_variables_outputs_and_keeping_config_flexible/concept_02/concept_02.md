# Module 3 — Concept 2: Variable Definition Files (.tfvars)

## The Concept

Passing every variable on the command line with `-var` gets unmanageable fast. Instead, put your variable values in a `.tfvars` file and Terraform loads them automatically.

---

## terraform.tfvars

Create a file called `terraform.tfvars` in the same directory as your `main.tf`:

```hcl
environment   = "staging"
bucket_suffix = "cj"
```

Terraform loads `terraform.tfvars` automatically — no flags needed:

```bash
terraform plan
```

---

## Other .tfvars Files

Any other `.tfvars` file must be passed explicitly:

```bash
terraform plan -var-file="production.tfvars"
```

This is how you manage multiple environments from one codebase:

```bash
# Staging
terraform plan -var-file="staging.tfvars"

# Production
terraform plan -var-file="production.tfvars"
```

---

## What to Commit

| File | Commit? |
|---|---|
| `terraform.tfvars` | Yes, if it contains no secrets |
| `production.tfvars` | Yes, if it contains no secrets |
| Any `.tfvars` with passwords or keys | Never |

---

## Beginner Trap: Secrets in .tfvars

Never put secrets in `.tfvars` files that get committed to Git.

```hcl
# WRONG — this ends up in Git history permanently
db_password = "MySecret123"

# CORRECT — use an environment variable instead
# export TF_VAR_db_password="MySecret123"
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Know that `terraform.tfvars` is loaded automatically, but any other `.tfvars` filename requires `-var-file`. Also know the full variable precedence order from Concept 1.

---

## Key Terms

- **`terraform.tfvars`** — Automatically loaded variable values file
- **`.tfvars`** — File extension for variable definition files
- **`-var-file`** — Flag to load a non-default `.tfvars` file
- **`TF_VAR_name`** — Environment variable format for supplying sensitive variable values
