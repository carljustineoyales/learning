output "bucket_name" {
  value       = aws_s3_bucket.learning.bucket
  description = "Service bucket name"
}

output "bucket_arn" {
  value       = aws_s3_bucket.learning.arn
  description = "Servicec bucket ARN"
}
