# Module 5 — Concept 1: Local Values

## The Concept

A local value is an intermediate expression you compute once and reuse across your configuration. It is not a variable — it cannot be set from outside. It is internal shorthand.

Locals solve a problem variables cannot: deriving values from other variables.

---

## Declaring Locals

```hcl
locals {
  name_prefix = "cj-terraform-learning-${var.environment}"
  common_tags = {
    Project     = "cj-terraform-learning"
    Owner       = "cj"
    Environment = var.environment
  }
}
```

- Locals can reference variables (`var.environment`)
- Variables cannot reference other variables
- Locals cannot be overridden from outside the configuration

---

## Referencing Locals

Use `local.name` (singular, not `locals`):

```hcl
resource "aws_s3_bucket" "learning" {
  bucket = "${local.name_prefix}-bucket"
  tags   = local.common_tags
}
```

---

## Why Locals Over Variables for Derived Values

In Module 3, `Environment` in `common_tags` was hard-coded to `"staging"` because variable defaults cannot reference other variables:

```hcl
# WRONG — variables cannot reference other variables
variable "common_tags" {
  default = {
    Environment = var.environment  # invalid
  }
}

# CORRECT — locals can reference variables
locals {
  common_tags = {
    Environment = var.environment  # valid
  }
}
```

---

## Locals vs Variables

| | Locals | Variables |
|---|---|---|
| Set from outside? | No | Yes |
| Can reference variables? | Yes | No |
| Use for | Derived/computed values | External inputs |

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Know the distinction between locals (internal, computed, cannot be overridden) and variables (external inputs). Know that locals can reference variables but variables cannot reference other variables.

---

## Key Terms

- **`locals` block** — Declares one or more local values
- **`local.name`** — How you reference a local value (singular)
- **Derived value** — A value computed from other values, not supplied directly from outside