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

module "dev_server" {
  source            = "../../modules/ec2"
  environment       = "dev"
  instance_type     = "t3.micro"
  root_volume_size  = 8
  enable_monitoring = false
  name_prefix       = "dev-app"
}

output "dev_instance_summary" {
  value = {
    id         = module.dev_server.instance_id
    public_ip  = module.dev_server.instance_public_ip
    private_ip = module.dev_server.instance_private_ip
  }
}
