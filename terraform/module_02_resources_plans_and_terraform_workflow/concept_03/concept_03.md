# Module 2 — Concept 3: terraform apply and terraform destroy

## The Concept

`terraform apply` executes the plan and makes real changes to AWS. After applying, Terraform writes the result to a state file (`terraform.tfstate`) that tracks what it has created.

`terraform destroy` is the inverse — it reads the state file, plans the deletion of everything it manages, and asks for confirmation before destroying.

---

## terraform apply

```bash
terraform apply
```

- Shows the plan one more time
- Asks for confirmation — type `yes` to proceed
- Makes real changes to AWS
- Writes results to `terraform.tfstate`

---

## terraform destroy

```bash
terraform destroy
```

- Reads the state file
- Plans deletion of all managed resources
- Asks for confirmation — type `yes` to proceed
- Irreversible — there is no undo

Always read the destroy plan as carefully as you read an apply plan.

---

## The State File

After every successful apply, Terraform writes `terraform.tfstate`. This file records:
- Every resource Terraform manages
- The AWS IDs of those resources
- All attributes returned by AWS after creation

Without the state file, Terraform cannot make safe decisions about what to change.

---

## Beginner Traps

**Editing resources directly in the Console after Terraform created them**
Terraform's state file no longer matches reality. The next plan will try to undo your Console changes.

```
Wrong:   Create resource with Terraform → edit it in Console → run terraform apply
Correct: All changes to Terraform-managed resources go through .tf files only
```

**Using -auto-approve in production**
The `-auto-approve` flag skips the confirmation prompt. Never use it against production infrastructure.

```bash
# Dangerous in production
terraform apply -auto-approve

# Safe — requires manual confirmation
terraform apply
```

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — The `-auto-approve` flag is tested. Know when it is appropriate (CI/CD pipelines with prior plan review) and when it is dangerous (direct production applies).

---

## Key Terms

- **`terraform apply`** — Executes the plan and makes real changes to AWS
- **`terraform destroy`** — Destroys all resources managed by the current state file
- **`terraform.tfstate`** — JSON file recording every resource Terraform manages
- **`-auto-approve`** — Skips the confirmation prompt; use with caution
