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

## Why terraform.tfstate Must Never Go in Git

State files are JSON. Terraform stores everything AWS returns after creation — including sensitive values:

1. **Database credentials** — usernames, passwords, and connection strings appear in plaintext in state when you create an RDS instance
2. **IAM access keys** — key IDs and secret keys for service accounts appear in state when Terraform creates them

Git history is permanent. A secret committed once stays in history forever, even after deletion. Even in a private repository, anyone with repo access can read the full history.

```
# Always add these to .gitignore
*.tfstate
*.tfstate.backup
```

The correct solution is remote state in S3 with `encrypt = true` — the file never touches your filesystem or Git.

---

## How Terraform Uses State

When you run `terraform plan`, Terraform:

1. Reads your `.tf` files (desired state)
2. Reads `terraform.tfstate` (known current state)
3. Optionally refreshes from AWS to detect drift
4. Computes the diff and prints the plan

Without the state file, Terraform cannot make safe decisions — it would not know what it already created.

---

## Key Terms

- **`terraform.tfstate`** — JSON file recording every resource Terraform manages
- **`id`** — The unique AWS identifier for a resource (bucket name, instance ID, etc.)
- **`arn`** — Amazon Resource Name — the globally unique identifier for any AWS resource
- **State refresh** — Terraform querying AWS directly to update the state file before planning