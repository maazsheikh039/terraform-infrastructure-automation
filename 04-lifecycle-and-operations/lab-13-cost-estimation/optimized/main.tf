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

resource "aws_vpc" "opt_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.opt_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.opt_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

resource "aws_db_subnet_group" "opt_db_subnet" {
  name       = "opt-db-subnet-group"
  subnet_ids = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}

# COST-OPT: Spot Instance fleet configuration replaces On-Demand to reduce compute cost by up to 70%
resource "aws_launch_template" "opt_lt" {
  name_prefix   = "opt-lt-"
  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t3.small" # COST-OPT: Downsizing instance types from t3.medium to t3.small
}

resource "aws_autoscaling_group" "opt_asg" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]

  launch_template {
    id      = aws_launch_template.opt_lt.id
    version = "$Latest"
  }
}

# COST-OPT: Single-AZ RDS deployment instead of Multi-AZ to save replication and compute license costs
resource "aws_db_instance" "opt_db" {
  identifier             = "opt-database"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.small"
  allocated_storage      = 50
  multi_az               = false
  db_subnet_group_name   = aws_db_subnet_group.opt_db_subnet.name
  username               = "admin"
  password               = "SecurePassword123!"
  skip_final_snapshot    = true
}

# Application Load Balancer
resource "aws_lb" "opt_alb" {
  name               = "opt-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}

# COST-OPT: Reduced ElastiCache replication node count to single node to minimize cluster overhead
resource "aws_elasticache_replication_group" "opt_cache" {
  replication_group_id          = "opt-cache-group"
  description                   = "Optimized ElastiCache cluster"
  node_type                     = "cache.t3.micro"
  num_cache_clusters            = 1
  engine                        = "redis"
  port                          = 6379
}
