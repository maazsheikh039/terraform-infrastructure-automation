module "aws_infra" {
  source       = "./modules/aws"
  environment  = var.environment
  project_name = var.project_name
}

module "azure_infra" {
  source       = "./modules/azure"
  environment  = var.environment
  project_name = var.project_name
}

module "gcp_infra" {
  source       = "./modules/gcp"
  environment  = var.environment
  project_name = var.project_name
}
