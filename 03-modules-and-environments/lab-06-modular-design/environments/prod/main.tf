terraform {
  required_version = ">= 1.0"
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

module "prod_web_1" {
  source            = "../../modules/ec2"
  environment       = "prod"
  instance_type     = "t3.medium"
  root_volume_size  = 30
  enable_monitoring = true
  name_prefix       = "prod-web-1"
}

module "prod_web_2" {
  source            = "../../modules/ec2"
  environment       = "prod"
  instance_type     = "t3.medium"
  root_volume_size  = 30
  enable_monitoring = true
  name_prefix       = "prod-web-2"
}

module "prod_db" {
  source            = "../../modules/ec2"
  environment       = "prod"
  instance_type     = "t3.large"
  root_volume_size  = 50
  enable_monitoring = true
  name_prefix       = "prod-db"
}

output "prod_cluster_summary" {
  value = {
    web_1 = { id = module.prod_web_1.instance_id, ip = module.prod_web_1.instance_public_ip }
    web_2 = { id = module.prod_web_2.instance_id, ip = module.prod_web_2.instance_public_ip }
    db    = { id = module.prod_db.instance_id, ip = module.prod_db.instance_private_ip }
  }
}
