terraform {
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
  bucket = "terraform-lab-cj-2026"
}
