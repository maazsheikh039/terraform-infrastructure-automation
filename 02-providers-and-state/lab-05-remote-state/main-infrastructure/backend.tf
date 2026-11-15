terraform {
  backend "s3" {
    bucket         = "YOUR_ACTUAL_BUCKET_NAME"
    key            = "infrastructure/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-lab"
    encrypt        = true
  }
}
