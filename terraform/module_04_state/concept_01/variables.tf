variable "environment" {
  type        = string
  description = "Terraform environment variable"
  default     = "staging"
}

variable "bucket_suffix" {
  type        = string
  description = "Service bucket suffix"
}

variable "region" {
  type        = string
  description = "Service region"
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
