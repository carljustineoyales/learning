# Module 3 — Milestone & Check Questions

## Milestone

Refactored configuration using variables for all environment-specific values, separate .tfvars files for staging and production, and outputs for bucket ARN and name.

### variables.tf
```hcl
variable "environment" {
  type        = string
  description = "The deployment environment: staging or production"
  default     = "staging"
}

variable "bucket_suffix" {
  type        = string
  description = "A unique suffix to make the bucket name globally unique"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "common_tags" {
  type = map(string)
  default = {
    Project     = "cj-terraform-learning"
    Owner       = "cj"
    Environment = "staging"
  }
}
```

### terraform.tfvars (staging)
```hcl
environment   = "staging"
bucket_suffix = "cj"
region        = "ap-southeast-1"
```

### production.tfvars
```hcl
environment   = "production"
bucket_suffix = "cj-prod"
region        = "ap-northeast-1"
```

### Plan output (production)
Bucket name resolved to `terraform-lab-production-cj-prod` — production values loaded correctly via `-var-file="production.tfvars"`.

---

## Check Question 1

**Q: What is the difference between a variable default and a value set in terraform.tfvars? If both are present, which wins? What about -var on the command line?**

**A:** The `default` is used only when no other value is supplied. If a value exists in `terraform.tfvars`, it overrides the default. If a value is passed with `-var` on the command line, it overrides everything.

Variable precedence (highest to lowest):
1. `-var` flag on the command line
2. `-var-file` flag on the command line
3. `terraform.tfvars` (auto-loaded)
4. `TF_VAR_name` environment variables
5. `default` in the variable block

---

## Check Question 2

**Q: Add a variable of type map(string) called common_tags with at least three key-value pairs. Apply those tags to your S3 bucket.**

```hcl
variable "common_tags" {
  type = map(string)
  default = {
    Project     = "cj-terraform-learning"
    Owner       = "cj"
    Environment = "staging"
  }
}

resource "aws_s3_bucket" "learning" {
  bucket = "terraform-lab-${var.environment}-${var.bucket_suffix}"
  tags   = var.common_tags
}
```

Plan output confirmed tags applied:
```
+ tags = {
    + "Environment" = "staging"
    + "Owner"       = "cj"
    + "Project"     = "cj-terraform-learning"
  }
```

Note: Variable defaults cannot reference other variables. Static strings are correct here. In Module 5 (locals), you will learn how to compute derived values like `Environment = var.environment` correctly.

---

## Module 3 Status: Complete

Concepts covered:
1. Input variables (types, defaults, var.name syntax)
2. Variable definition files (terraform.tfvars auto-loaded, -var-file for others)
3. Output values (terraform output, referencing resource attributes)

Next: Module 4 — State
