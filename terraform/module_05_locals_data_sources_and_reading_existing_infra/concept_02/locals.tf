locals {
  name_prefix = "cj-terraform-learning-${var.environment}"
  common_tags = {
    Project     = "cj-terraform-learning"
    Owner       = "cj"
    Environment = var.environment
  }
}
