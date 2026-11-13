# Create an S3 bucket
resource "aws_s3_bucket" "lab_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Purpose     = "Terraform Lab"
    CreatedBy   = "Terraform"
  }
}

# Configure S3 bucket versioning
resource "aws_s3_bucket_versioning" "lab_bucket_versioning" {
  bucket = aws_s3_bucket.lab_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Configure S3 bucket server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "lab_bucket_encryption" {
  bucket = aws_s3_bucket.lab_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to the bucket
resource "aws_s3_bucket_public_access_block" "lab_bucket_pab" {
  bucket = aws_s3_bucket.lab_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
