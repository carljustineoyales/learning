# Module 1 — Concept 1: What Terraform Is and Why It Exists

## The Analogy

Imagine you are a new sysadmin at a company and your job is to build a server room. You could walk in each day, plug in cables by hand and write nothing down — and it would work, right up until someone asks "what exactly did you do last Tuesday?" and you can't answer.

Terraform is the blueprint that replaces the guesswork. Instead of clicking through the AWS Console and hoping you remember every setting, you write down exactly what you want — in a file — and Terraform reads that file and builds it. If you want two identical environments, you hand the same file to two builders. If something breaks, you look at the file.

**The file is the truth. The Console is just a window into what the file already decided.**

---

## The Concept

Terraform is an Infrastructure as Code (IaC) tool made by HashiCorp. You write configuration files in a language called **HCL (HashiCorp Configuration Language)** that describe the infrastructure you want — EC2 instances, Route 53 records, security groups — and Terraform figures out how to create, update, or destroy those resources to match your description.

The key word is **declarative**: you say _what_ you want, not _how_ to get there. Terraform handles the how.

### Declarative vs Imperative

| Approach        | What you write            | Example                                                    |
| --------------- | ------------------------- | ---------------------------------------------------------- |
| **Imperative**  | Step-by-step instructions | A Bash script calling AWS CLI commands in a specific order |
| **Declarative** | The desired end state     | A `.tf` file describing the resources you want to exist    |

With a Bash script you are saying: "first create the VPC, then create the subnet, then create the EC2 instance."

With Terraform you are saying: "I want a VPC, a subnet, and an EC2 instance" — and Terraform works out the order itself.

---

## Exam Note

> ⚠️ **Terraform Associate Exam** — The declarative vs imperative distinction is tested directly. You need to be able to define both terms and give an example of each. Terraform is declarative. Bash/AWS CLI scripts are imperative.

---

## Activity

Open your terminal and run:

```bash
terraform version
```

**Expected result:** A version string like `Terraform v1.15.7` prints without errors.

---

## Key Terms

- **IaC (Infrastructure as Code)** — Managing infrastructure through configuration files rather than manual processes
- **HCL (HashiCorp Configuration Language)** — The language used to write Terraform configuration files
- **Declarative** — You describe the desired end state; the tool works out the steps
- **Imperative** — You describe the steps to take in a specific order
