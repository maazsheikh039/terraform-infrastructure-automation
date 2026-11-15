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

module "test_web" {
  source            = "../../modules/ec2"
  environment       = "test"
  instance_type     = "t3.micro"
  root_volume_size  = 12
  enable_monitoring = false
  name_prefix       = "test-web"
}

module "test_app" {
  source            = "../../modules/ec2"
  environment       = "test"
  instance_type     = "t3.small"
  root_volume_size  = 15
  enable_monitoring = false
  name_prefix       = "test-app"
}

output "test_instances_summary" {
  value = {
    web = {
      id        = module.test_web.instance_id
      public_ip = module.test_web.instance_public_ip
    }
    app = {
      id        = module.test_app.instance_id
      private_ip = module.test_app.instance_private_ip
    }
  }
}
