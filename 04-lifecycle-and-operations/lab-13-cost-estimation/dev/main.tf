terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

# Development EC2 Instance
resource "aws_instance" "dev_server" {
  ami           = "ami-0c7217cdde317cfec" # Amazon Linux 2023
  instance_type = var.instance_type
  tags = {
    Environment = "dev"
  }
}

# Development RDS Instance
resource "aws_db_instance" "dev_db" {
  identifier        = "dev-database"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.db_instance_class
  allocated_storage = 20
  username          = "admin"
  password          = "Password1234!"
  skip_final_snapshot = true
  tags = {
    Environment = "dev"
  }
}

# Development S3 Bucket
resource "aws_s3_bucket" "dev_bucket" {
  bucket        = "cost-lab-dev-bucket-unique-12345"
  force_destroy = true
  tags = {
    Environment = "dev"
  }
}
