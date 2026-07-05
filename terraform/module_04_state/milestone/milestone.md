# Module 4 — Milestone & Check Questions

## Milestone

Full remote state workflow completed from scratch in a dedicated milestone directory.

### Backend configuration
```hcl
terraform {
  backend "s3" {
    bucket       = "cj-terraform-state-2026"
    key          = "milestone/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
    encrypt      = true
    profile      = "terraform-lab"
  }
}
```

### Steps completed
1. Fresh directory with remote backend, provider, and S3 bucket resource
2. `terraform init` and `terraform apply` — bucket created
3. `terraform state list` — confirmed `aws_s3_bucket.learning` tracked
4. `terraform state show` — printed all stored attributes (arn, id, region, encryption config)
5. `terraform state rm aws_s3_bucket.learning` — removed from state, AWS resource untouched
6. `terraform state list` — returned nothing, Terraform no longer tracking it
7. `terraform import aws_s3_bucket.learning cj-terraform-learning-state-demo` — restored to state
8. `terraform state list` — confirmed `aws_s3_bucket.learning` tracked again

---

## Check Question 1

**Q: Why is it dangerous to store terraform.tfstate in Git, even in a private repository? Name two specific types of sensitive data.**

**A:** State files store everything Terraform receives back from AWS after resource creation — including sensitive data in plaintext. Two types that appear in state:
1. **Database credentials** — usernames, passwords, connection strings from RDS instances
2. **IAM access keys** — key IDs and secret keys created for service accounts

Git history is permanent. A secret committed once stays forever even after deletion. The correct solution is remote state in S3 with `encrypt = true`.

---

## Check Question 2

**Q: What happens to the real AWS resource if you run terraform state rm? When would you legitimately use it, and what would you do immediately afterwards?**

**A:** Nothing happens to the real AWS resource — it keeps running untouched. Terraform simply forgets it exists.

Legitimate uses:
- Handing a resource to another team who will manage it with their own Terraform config
- Undoing an accidental `terraform import`

Immediately afterwards: run `terraform import` to re-add it correctly, or clearly document that the resource is now unmanaged — otherwise the next `terraform apply` may try to create a duplicate and fail.

---

## Module 4 Status: Complete

Concepts covered:
1. What the state file is (JSON record of all managed resources, sensitive data risk)
2. Remote state (S3 backend, use_lockfile, bootstrapping, terraform init -migrate-state)
3. terraform state commands (list, show, rm, import)

Next: Module 5 — Locals, Data Sources, and Reading Existing Infrastructure
