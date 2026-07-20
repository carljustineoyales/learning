terraform {
  backend "s3" {
    bucket       = "cj-terraform-state-2026"
    key          = "milestone/terraform.tfstate"
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
  bucket = "${local.name_prefix}-bucket"
  tags   = local.common_tags
}

data "aws_caller_identity" "current" {

}

data "aws_vpc" "main" {
  default = true
}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "The current AWS account ID"
}

output "vpc_id" {
  value       = data.aws_vpc.main.id
  description = "The ID of the default VPC"
}
