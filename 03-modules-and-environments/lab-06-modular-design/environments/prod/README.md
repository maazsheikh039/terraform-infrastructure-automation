# Modular Infrastructure Composition with Terraform & AWS EC2

## Objectives
- Design and implement a reusable, modular Terraform component (`modules/ec2`) abstracting EC2 instance provisioning, dynamic AMIs, and security group creation.
- Compose isolated environment root configurations (`dev`, `test`, `prod`) consuming the shared module with varying input parameters.
- Enforce enterprise security compliance by mandating encrypted EBS root volumes (`encrypted = true`) across all deployments.
- Scale production tiers by instantiating high-capacity instances with detailed CloudWatch monitoring enabled.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code composition engine.
- **Amazon Web Services (AWS)**: EC2, VPC, Security Groups, and EBS Block Devices.

## Key Skills Demonstrated
- **DRY Architecture (Don't Repeat Yourself)**: Eliminating infrastructure code duplication by centralizing resource logic inside parameterized modules.
- **Environment Isolation**: Managing distinct resource sizing, storage volumes (8GB to 50GB), and monitoring profiles across dev/test/prod stages.
- **Structured Outputs**: Surfacing composite instance summaries and IP allocations cleanly per environment.

## Troubleshooting Log
- **Relative Module Source Resolution**: Utilized explicit relative paths (`../../modules/ec2`) in environment root configurations to ensure seamless local module loading during `terraform init`.
