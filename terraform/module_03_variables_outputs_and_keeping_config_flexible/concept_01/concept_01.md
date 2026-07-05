# Module 3 — Concept 1: Input Variables

## The Concept

An input variable is a named slot that holds a value your configuration needs but that you want to change without editing the resource blocks themselves.

```hcl
variable "environment" {
  type        = string
  description = "The deployment environment: staging or production"
  default     = "staging"
}

variable "bucket_suffix" {
  type        = string
  description = "A unique suffix to make the bucket name globally unique"
}
```

Reference a variable with `var.variable_name`:

```hcl
resource "aws_s3_bucket" "learning" {
  bucket = "terraform-lab-${var.environment}-${var.bucket_suffix}"
}
```

---

## Variable Types

| Type | Example |
|---|---|
| `string` | `"staging"` |
| `number` | `3` |
| `bool` | `true` |
| `list(string)` | `["a", "b", "c"]` |
| `map(string)` | `{ key = "value" }` |
| `object` | Complex nested structure |

---

## Variable Precedence (highest to lowest)

1. `-var` flag on the command line
2. `-var-file` flag on the command line
3. `terraform.tfvars` file
4. Environment variables (`TF_VAR_name`)
5. `default` value in the variable block

---

## Passing Variables on the Command Line

```bash
terraform plan -var="bucket_suffix=cj"
terraform plan -var="environment=production" -var="bucket_suffix=cj"
```

---

## Beginner Trap: Missing Required Variables

A variable with no `default` is required. If you forget to supply it, Terraform will prompt you interactively or error on non-interactive runs.

```hcl
# This variable has no default — it must be supplied
variable "bucket_suffix" {
  type = string
}
```

```bash
# WRONG — bucket_suffix not supplied
terraform plan

# CORRECT
terraform plan -var="bucket_suffix=cj"
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Variable types and precedence order are tested. Know all primitive types (`string`, `number`, `bool`) and collection types (`list`, `map`, `set`, `object`, `tuple`). Know which source wins when a variable is set in multiple places.

---

## Key Terms

- **Input variable** — A named slot for an external value your configuration needs
- **`default`** — The value used when no other value is supplied
- **`var.name`** — How you reference a variable inside your configuration
- **`-var`** — Command-line flag to supply a variable value
