# Module 4 — Concept 2: Remote State

## The Concept

Storing state locally works for solo learning but breaks immediately when a team is involved — two people applying at the same time will corrupt the state file. The solution is remote state: storing `terraform.tfstate` in a shared backend that supports locking.

---

## The Standard AWS Backend

- **S3 bucket** — stores the state file
- **State locking** — prevents two applies from running simultaneously

On Terraform v1.15+, locking uses a native lock file in S3 (`use_lockfile = true`). On older versions, a DynamoDB table was required (`dynamodb_table`).

---

## Backend Configuration

```hcl
terraform {
  backend "s3" {
    bucket       = "cj-terraform-state-2026"
    key          = "learning/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
    encrypt      = true
    profile      = "terraform-lab"
  }
}
```

- **`bucket`** — the S3 bucket storing the state file
- **`key`** — the path inside the bucket (acts like a folder structure)
- **`use_lockfile`** — enables state locking (v1.15+)
- **`encrypt`** — encrypts the state file at rest in S3

---

## Bootstrapping Rule

The state bucket must be created manually before Terraform can use it as a backend. You cannot use Terraform to create its own state bucket — circular dependency.

Create it once via AWS CLI or Console, then never touch it with Terraform.

---

## Migrating Local State to Remote

After adding a backend block, run:

```bash
terraform init -migrate-state
```

Terraform moves your local `terraform.tfstate` to S3 automatically.

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Remote state, state locking, and backend configuration are heavily tested. The exam was written against older Terraform versions where DynamoDB was required for locking. Know both approaches:
> - v1.15+: `use_lockfile = true`
> - Older: `dynamodb_table = "table-name"`

---

## Key Terms

- **Remote state** — State stored in a shared backend (S3) instead of locally
- **State locking** — Prevents concurrent applies from corrupting state
- **`terraform init -migrate-state`** — Moves existing local state to the configured remote backend
- **`key`** — The S3 object path where the state file is stored
