# Module 2 — Concept 1: The Resource Block

## The Concept

The `resource` block is the core unit of Terraform. It describes one real thing you want to exist in AWS.

```hcl
resource "aws_s3_bucket" "learning" {
  bucket = "terraform-lab-cj-2026"
}
```

Every resource block has three parts:

| Part | Example | What it is |
|---|---|---|
| Type | `aws_s3_bucket` | What kind of AWS resource to create |
| Local name | `learning` | How you refer to it inside your configuration |
| Body | `bucket = "..."` | Arguments that configure the resource |

The combination of **type + local name** must be unique within your configuration.

---

## Beginner Trap: Local Name vs AWS Name

The local name is NOT the name in AWS.

```hcl
resource "aws_s3_bucket" "learning" {
  bucket = "terraform-lab-cj-2026"
}
```

- `learning` — only exists inside Terraform; how you reference this resource elsewhere in your config
- `terraform-lab-cj-2026` — the actual bucket name created in AWS

---

## Referencing a Resource

To reference this resource elsewhere in your configuration, use the format `resource_type.local_name.attribute`:

```hcl
aws_s3_bucket.learning.arn
aws_s3_bucket.learning.bucket
aws_s3_bucket.learning.id
```

---

## Key Terms

- **Resource block** — Declares one piece of infrastructure you want Terraform to manage
- **Resource type** — The kind of AWS resource (e.g. `aws_s3_bucket`, `aws_instance`)
- **Local name** — The label you give this resource inside your configuration
- **Arguments** — The settings inside the resource block that configure the resource