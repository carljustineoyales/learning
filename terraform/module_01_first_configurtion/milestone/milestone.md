# Module 1 — Milestone & Check Questions

## Milestone

A working Terraform project directory with:

- `main.tf` containing a provider block pointing at `ap-southeast-1`, using the `default` named profile
- `terraform validate` passing
- `.gitignore` excluding `.terraform/`, `*.tfstate`, `*.tfstate.backup`
- Committed to Git

---

## Check Question 1

**Q: What is the difference between Terraform and the AWS Console? Why not just click through the Console?**

**A:** Terraform is the source of truth — the `.tf` files describe exactly what infrastructure should exist, can be version controlled, and double as documentation. The Console, by contrast, requires manually filling out forms and clicking through wizards every time. This is tedious and error-prone — typos, missed settings, and forgotten steps creep in, especially when trying to reproduce the same setup a second time (e.g. a second EC2 instance with identical Nginx config and security group rules). Terraform replays the same file exactly, every time.

---

## Check Question 2

**Q: Add a second provider block with an alias. Run `terraform validate`. Explain what `alias` does.**

**What happened first (without alias):**

```hcl
provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  region = "ap-east-1"
}
```

```
Error: Duplicate provider configuration
A default (non-aliased) provider configuration for "aws" was already given.
```

**Fixed with alias:**

```hcl
provider "aws" {
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "secondary"
  region = "ap-east-1"
}
```

```
Success! The configuration is valid.
```

**What `alias` does:** Terraform only allows one unlabelled (default) provider block per service. `alias` labels a second provider block so Terraform can tell the two apart. A resource then opts into the aliased provider explicitly with `provider = aws.secondary`.

**Why it exists:** Multi-region or multi-account setups. Example: an S3 bucket replicated to a second region for disaster recovery would use the default provider for the primary bucket and the aliased provider for the replica.

---

## Module 1 Status: Complete

Concepts covered:
1. What Terraform is and why it exists (declarative vs imperative)
2. Providers (version constraints, the lock file)
3. Authentication (credential search order, named profiles)

Next: Module 2 — Resources, Plans, and the Terraform Workflow