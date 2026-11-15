resource "aws_db_instance" "database" {
  identifier        = "mydb"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  
  db_name             = "myapp"
  username            = "admin"
  password            = "password123"
  storage_encrypted   = false
  publicly_accessible = true
  skip_final_snapshot = true
}

resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "insecure-bucket-example"
}

resource "aws_s3_bucket_public_access_block" "insecure_bucket_pab" {
  bucket = aws_s3_bucket.insecure_bucket.id
  
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_iam_policy" "overly_permissive" {
  name        = "overly-permissive-policy"
  description = "Policy with too many permissions"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}
