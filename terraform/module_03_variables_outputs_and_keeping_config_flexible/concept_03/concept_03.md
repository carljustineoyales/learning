# Module 3 — Concept 3: Output Values

## The Concept

Outputs are values that Terraform prints after a successful apply and stores in state so other configurations can reference them. They are how Terraform tells you useful information about the resources it created.

```hcl
output "bucket_name" {
  value       = aws_s3_bucket.learning.bucket
  description = "The name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.learning.arn
  description = "The ARN of the S3 bucket"
}
```

---

## Viewing Outputs

After apply, outputs print automatically. To view them again at any time:

```bash
terraform output
terraform output bucket_arn   # single output
```

---

## Referencing Resource Attributes

Use dot notation to reference any attribute of a resource:

```hcl
aws_s3_bucket.learning.bucket        # bucket name
aws_s3_bucket.learning.arn           # ARN
aws_s3_bucket.learning.hosted_zone_id
aws_s3_bucket.learning.region
```

All available attributes are listed in the AWS provider documentation for each resource type.

---

## Outputs Between Modules

Outputs are also how modules pass data to each other. A child module exposes an output, and the root configuration references it as `module.module_name.output_name`. You will use this heavily in Module 6.

---

## Beginner Trap: Unnecessary Interpolation

The `${}` interpolation syntax is only needed when mixing a variable with other text in a string.

```hcl
# WRONG — unnecessary interpolation
output "arn" {
  value = "${aws_s3_bucket.learning.arn}"
}

# CORRECT — direct reference
output "arn" {
  value = aws_s3_bucket.learning.arn
}
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Know that outputs are stored in state and can be referenced by other configurations. Know the difference between `terraform output` (view all) and `terraform output name` (view one).

---

## Key Terms

- **Output** — A value Terraform prints after apply and stores in state
- **`terraform output`** — Command to view all output values
- **`value`** — The expression that produces the output's value
- **`description`** — Human-readable explanation of what the output represents
