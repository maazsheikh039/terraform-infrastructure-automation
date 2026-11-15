output "bucket_name" {
  value = aws_s3_bucket.imported_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.imported_bucket.arn
}

output "versioning_status" {
  value = aws_s3_bucket_versioning.imported_bucket_versioning.versioning_configuration[0].status
}
