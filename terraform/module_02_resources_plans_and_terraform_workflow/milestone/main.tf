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

resource "aws_s3_bucket" "learning-2" {
  bucket = "terraform-lab-cj-2026-module-2-milestone-learning-2"
}
