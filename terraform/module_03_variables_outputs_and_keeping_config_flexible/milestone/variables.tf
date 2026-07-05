variable "environment" {
  type        = string
  description = "The deployment environment: staging or production"
  default     = "staging"
}

variable "bucket_suffix" {
  type        = string
  description = "A unique suffix to make the bucket name globally unique"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "common_tags" {
  type = map(string)
  default = {
    "Project"     = "cj-terraform-learning"
    "Owner"       = "cj"
    "Environment" = "staging"
  }
}
