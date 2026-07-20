# Module 5 — Concept 2: Data Sources

## The Concept

A data source reads information about an existing resource without managing it. Terraform fetches the data during the plan phase — it never creates, modifies, or destroys the resource.

Use data sources to bridge manually-created or externally-managed resources with your Terraform-managed ones.

---

## Declaring a Data Source

```hcl
data "aws_caller_identity" "current" {}

data "aws_vpc" "main" {
  default = true
}
```

- First argument — the data source type (`aws_caller_identity`, `aws_vpc`)
- Second argument — the local name (`current`, `main`)
- Body — filter arguments to identify the specific resource

---

## Referencing a Data Source

Use `data.type.name.attribute`:

```hcl
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "vpc_id" {
  value = data.aws_vpc.main.id
}
```

---

## Common AWS Data Sources

| Data Source | What it reads |
|---|---|
| `aws_caller_identity` | Current AWS account ID, user ARN |
| `aws_vpc` | Existing VPC by ID, name, or default flag |
| `aws_subnets` | Subnets filtered by VPC ID or tags |
| `aws_ami` | Latest AMI matching filters |
| `aws_route53_zone` | Existing Route 53 hosted zone |

---

## Data Source vs Resource Block

| | `data` block | `resource` block |
|---|---|---|
| Creates infrastructure? | No | Yes |
| Modifies infrastructure? | No | Yes |
| Destroys infrastructure? | No | Yes |
| When to use | Reading existing resources | Managing new resources |

---

## Beginner Trap: Using a resource block for existing infrastructure

If you define a `resource` block for something that already exists in AWS without running `terraform import` first, Terraform will try to create a duplicate and fail.

```hcl
# WRONG — tries to create a new VPC
resource "aws_vpc" "main" { ... }

# CORRECT — reads the existing VPC
data "aws_vpc" "main" {
  default = true
}
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — The exam distinguishes between managed resources (`resource` blocks) and data sources (`data` blocks). Data sources never create, modify, or destroy infrastructure. Know the `data.type.name.attribute` reference syntax.

---

## Key Terms

- **Data source** — Reads information about an existing resource without managing it
- **`data` block** — Declares a data source
- **`data.type.name.attribute`** — How you reference a data source value
- **`aws_caller_identity`** — Data source that returns the current AWS account ID and user ARN