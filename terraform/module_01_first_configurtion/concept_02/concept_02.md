# Module 1 — Concept 2: Providers

## The Analogy

Your Next.js app doesn't talk directly to the database — it goes through a driver that speaks the database's language. Terraform is the app, the AWS API is the database, and the provider is the driver sitting between them.

Every cloud platform has its own provider. You declare which one you need, and Terraform downloads it automatically when you initialise a project.

---

## The Concept

Terraform uses plugins called **providers** to communicate with external services. The AWS provider translates your HCL configuration into AWS API calls.

Providers are declared inside a `terraform` block using `required_providers`, then configured with a `provider` block.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
```

### Version Constraints

| Constraint | Meaning |
|---|---|
| `~> 5.0` | Any 5.x version — won't jump to 6.x |
| `>= 5.0` | 5.0 or any higher version |
| `= 5.0` | Exactly 5.0, nothing else |
| `>= 5.0, < 6.0` | Any 5.x version (same as `~> 5.0`) |

`~>` is the most common in real projects — it allows patch and minor updates within a major version.

---

## The Lock File

After `terraform init`, a `.terraform.lock.hcl` file is created. This locks the exact provider version so every teammate gets the same version when they run `terraform init`.

**Commit this file to version control.**

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — Provider version constraints are tested. Know what `~>`, `>=`, and `=` mean and when you would use each. Also know that `terraform init` is the command that downloads providers.

---

## Activity

Create `~/terraform-lab/main.tf`:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
```

Then run:

```bash
terraform init
```

**Expected result:** `Terraform has been successfully initialised!` and a `.terraform` directory appears.

---

## Key Terms

- **Provider** — A plugin that translates HCL into API calls for a specific platform
- **`required_providers`** — Declares which providers your configuration needs
- **`terraform init`** — Downloads the declared providers and initialises the project
- **`.terraform.lock.hcl`** — Records the exact provider versions selected; commit this file