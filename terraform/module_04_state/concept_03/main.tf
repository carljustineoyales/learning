terraform {
  backend "s3" {
    bucket       = "cj-terraform-state-2026"
    key          = "learning/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
    encrypt      = true
    profile      = "terraform-lab"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "terraform-lab"
  region  = "ap-southeast-1"
}

resource "aws_s3_bucket" "learning" {
  bucket = "cj-terraform-learning-state-demo"
}
