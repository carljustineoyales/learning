# Module 2 — Concept 2: terraform plan

## The Concept

`terraform plan` reads your configuration, reads the current state of your infrastructure, and prints a diff showing exactly what it would do if you applied. It never changes anything — it is a dry run.

---

## Plan Symbols

| Symbol | Meaning | When it appears |
|---|---|---|
| `+` | Create | New resource in config, not in state |
| `-` | Destroy | Resource in state, removed from config |
| `~` | Update in place | Resource exists, arguments changed |
| `-/+` | Destroy and recreate | Change requires replacement, cannot update in place |

The `-/+` symbol is the most important to recognise. It means the old resource is destroyed first, then a new one is created. For a production database, this means downtime.

---

## Reading a Plan

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

Read the summary line first — it tells you the shape of what's about to happen. Then read the details.

---

## (known after apply)

Many attributes show `(known after apply)` in the plan. This means AWS hasn't created the resource yet, so Terraform doesn't know those values. ARNs, IDs, hosted zone IDs — these only exist after AWS creates the resource.

This is Terraform being honest about what it doesn't know yet. It resolves correctly after apply.

---

## Beginner Trap

Never run `terraform apply` without reading the plan first.

```bash
# WRONG
terraform apply

# CORRECT
terraform plan   # read every line
terraform apply  # only when plan matches what you intended
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Know all four plan symbols and what each means. The `-/+` symbol is frequently tested — know that it means destroy-and-recreate, not update in place.

---

## Key Terms

- **`terraform plan`** — Dry run; shows what Terraform would do without making any changes
- **`(known after apply)`** — Attribute value not known until the resource is created
- **`-/+`** — Resource must be destroyed and recreated; cannot be updated in place