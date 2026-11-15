output "aws_instance_public_ip" { value = module.aws_infra.public_ip }
output "azure_public_ip" { value = module.azure_infra.public_ip }
output "gcp_instance_external_ip" { value = module.gcp_infra.external_ip }
