# Module 2 — Milestone & Check Questions

## Milestone

A Terraform configuration that creates a real S3 bucket, with a reviewed plan before apply.

### Plan output summary (before apply)

The plan showed one S3 bucket (`terraform-lab-cj-2026-module-2-milestone`) to be created. Most attributes showed `(known after apply)` because AWS had not created the resource yet — values like ARN, region, and hosted zone ID only exist after creation. The summary line `Plan: 1 to add, 0 to change, 0 to destroy` confirmed only one resource would be affected. Running `terraform plan` before `terraform apply` allowed reviewing the changes before committing to them.

---

## Check Question 1

**Q: What does `-/+` mean in a plan output, and why does it matter more than `~` for a production database?**

**A:** `~` means Terraform updates the resource in place — the resource keeps running, data intact, just a configuration change. `-/+` means Terraform must destroy the existing resource and recreate it from scratch because the change cannot be applied in place. For a production RDS database, `-/+` means the database is deleted before the new one is created — that is data loss, not just downtime. `~` is routine. `-/+` on a database is catastrophic.

---

## Check Question 2

**Q: Add a second S3 bucket. Run `terraform plan`. What does it show?**

**A:** With two resource blocks, the plan shows `Plan: 2 to add, 0 to change, 0 to destroy` — one entry per resource block. Each bucket has its own unique local name (`learning`, `learning-2`) and a unique bucket name.

---

## Check Question 3

**Q: Remove one bucket from the config. Run `terraform plan` again. What does it show and why?**

**A:** With one resource block removed, the plan shows `Plan: 1 to add, 0 to change, 0 to destroy` — only the remaining resource block is planned. Terraform compares the config against state: what is in the config gets created, what is removed from the config gets scheduled for destruction (if it was previously applied).

---

## Module 2 Status: Complete

Concepts covered:
1. The resource block (type, local name, body — local name is not the AWS name)
2. terraform plan (symbols: `+`, `-`, `~`, `-/+` and `(known after apply)`)
3. terraform apply and terraform destroy (state file, `-auto-approve`)

Next: Module 3 — Variables, Outputs, and Keeping Configuration Flexible
