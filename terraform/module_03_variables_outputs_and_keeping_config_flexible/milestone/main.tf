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
  region  = var.region
}

resource "aws_s3_bucket" "learning" {
  bucket = "terraform-lab-${var.environment}-${var.bucket_suffix}"
  tags   = var.common_tags
}
