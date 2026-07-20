# Module 4 — Concept 3: terraform state Commands

## The Concept

Sometimes you need to interact with state directly without applying a full configuration change. The `terraform state` subcommands let you do this safely.

Never edit the state file directly with a text editor — always use these commands.

---

## Key Commands

### terraform state list
Shows every resource Terraform is tracking in the current state:

```bash
terraform state list
# aws_s3_bucket.learning
```

### terraform state show
Shows all stored attributes of one resource:

```bash
terraform state show aws_s3_bucket.learning
```

### terraform state rm
Removes a resource from state **without touching the real AWS resource**. The bucket keeps running in AWS — Terraform simply forgets it ever managed it.

```bash
terraform state rm aws_s3_bucket.learning
```

When to use it legitimately:
- Handing a resource over to another team who will manage it with their own Terraform config
- Undoing an accidental `terraform import`

What to do immediately afterwards:
- Either `terraform import` to re-add it correctly, or clearly document that the resource is now unmanaged — otherwise the next `terraform apply` may try to create a duplicate and fail with a name collision

### terraform import
Pulls an existing AWS resource into Terraform state so you can manage it going forward:

```bash
terraform import aws_s3_bucket.learning my-existing-bucket-name
```

---

## Beginner Traps

**Using terraform state rm as a shortcut to "fix" things**
Removing a resource from state does not delete it from AWS. The resource still exists — Terraform just no longer knows about it.

```
Wrong:   terraform state rm to "start fresh"
Correct: terraform destroy to remove from both AWS and state
         terraform import to re-add a resource Terraform lost track of
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — `terraform import` is tested. Know that it pulls an existing AWS resource into state so Terraform can manage it going forward. Know that `terraform state rm` removes from state only — not from AWS.

---

## Key Terms

- **`terraform state list`** — Lists all resources tracked in current state
- **`terraform state show`** — Prints all stored attributes of one resource
- **`terraform state rm`** — Removes a resource from state without destroying it in AWS
- **`terraform import`** — Imports an existing AWS resource into Terraform state