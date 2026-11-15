terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Fetch latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Fetch default VPC
data "aws_vpc" "default" {
  default = true
}

# Create security group per module instance
resource "aws_security_group" "instance_sg" {
  name_prefix = "${var.name_prefix}-${var.environment}-sg-"
  description = "Security group for ${var.environment} EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name_prefix}-${var.environment}-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Provision EC2 Instance with encrypted root volume
resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  monitoring             = var.enable_monitoring
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  root_block_device {
    volume_size           = var.root_volume_size
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.name_prefix}-${var.environment}-node"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
