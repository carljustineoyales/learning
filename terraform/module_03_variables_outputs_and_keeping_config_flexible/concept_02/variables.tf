variable "environment" {
  type        = string
  description = "The deployment environment: staging or production"
  default     = "staging"
}

variable "bucket_suffix" {
  type        = string
  description = "A unique suffix to make the bucket name globally unique"
}
