terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-west-2"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

resource "aws_iam_policy" "good_policy" {
  name = "least-privilege-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:GetObject"]
      Resource = "arn:aws:s3:::my-specific-bucket/*"
    }]
  })
  tags = {
    Environment = "prod"
    Owner       = "secops"
    Project     = "governance"
    CostCenter  = "IT-100"
  }
}

resource "aws_security_group" "good_sg" {
  name_prefix = "secure-sg"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
    description = "Internal HTTPS"
  }
  tags = {
    Environment = "prod"
    Owner       = "netops"
    Project     = "governance"
    CostCenter  = "IT-100"
  }
}
