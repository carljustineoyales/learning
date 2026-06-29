# Module 1 — Concept 3: Authentication

## The Concept

Terraform needs AWS credentials to make any API calls. It searches for them in this exact order:

1. **Environment variables** — `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
2. **Shared credentials file** — `~/.aws/credentials` (named profiles via `aws configure`)
3. **IAM instance profile** — when Terraform is running on an EC2 instance

The first match wins. For local development, a named profile in `~/.aws/credentials` is the correct approach.

---

## The Right Way

Reference a named profile in your provider block:

```hcl
provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}
```

## The Wrong Way

Never hard-code credentials in your `.tf` files — they will end up in Git:

```hcl
# WRONG — never do this
provider "aws" {
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI..."
  region     = "ap-southeast-1"
}
```

---

## Beginner Traps

**Wrong region in the provider block**
Your AWS CLI default profile may point at a different region than your actual resources. Always set the region explicitly in the provider block.

```hcl
# WRONG — CLI default may be a different region
provider "aws" {
  profile = "default"
}

# CORRECT — region is explicit
provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}
```

**Forgetting to re-run init after changing providers**
Any change to `required_providers` requires `terraform init` to be re-run before `terraform plan` will work.

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — The credential search order is tested. Know all three levels in order:
> 1. Environment variables
> 2. Shared credentials file
> 3. IAM instance profile

---

## Key Terms

- **Named profile** — A set of AWS credentials stored in `~/.aws/credentials` under a label (e.g. `default`)
- **IAM instance profile** — Credentials automatically provided to an EC2 instance via its attached IAM role; no static keys required
- **`terraform validate`** — Checks your configuration for syntax errors without connecting to AWS