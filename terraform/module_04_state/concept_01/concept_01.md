# Module 4 — Concept 1: What the State File Is

## The Concept

After every successful apply, Terraform writes `terraform.tfstate`. This file is JSON and contains a complete record of every resource Terraform manages.

This is how Terraform knows what already exists when you run `terraform plan` — it compares your `.tf` files against the state file.

---

## What the State File Contains

For every resource, the state file stores:

- The resource type (`aws_s3_bucket`)
- The local name (`learning`)
- All attributes AWS returned after creation (id, arn, region, hosted_zone_id, etc.)

Example from a real state file:

```
"id":  "terraform-lab-staging-cj"
"arn": "arn:aws:s3:::terraform-lab-staging-cj"
```

The `id` is what AWS uses as the unique identifier for the resource. For S3, it is the bucket name. For EC2, it is the instance ID (`i-0abc123`).

---

## How Terraform Uses State

When you run `terraform plan`, Terraform:

1. Reads your `.tf` files (desired state)
2. Reads `terraform.tfstate` (known current state)
3. Optionally refreshes from AWS to detect drift
4. Computes the diff and prints the plan

Without the state file, Terraform cannot make safe decisions — it would not know what it already created.

---

## Beginner Trap: Committing terraform.tfstate to Git

State files contain sensitive information — resource IDs, ARNs, and sometimes plaintext secrets (database passwords, access keys). They also cause constant merge conflicts on teams.

```
# Always add these to .gitignore
*.tfstate
*.tfstate.backup
```

Use remote state (Concept 2) from day one on any team project.

---

## Key Terms

- **`terraform.tfstate`** — JSON file recording every resource Terraform manages
- **`id`** — The unique AWS identifier for a resource (bucket name, instance ID, etc.)
- **`arn`** — Amazon Resource Name — the globally unique identifier for any AWS resource
- **State refresh** — Terraform querying AWS directly to update the state file before planning
