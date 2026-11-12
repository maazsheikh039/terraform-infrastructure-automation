# Automated AWS EC2 Provisioning with Terraform & HCL

## Objectives
- Implement Infrastructure as Code (IaC) principles using HashiCorp Terraform to manage AWS resources.
- Structure modular HCL configurations featuring separate files for providers, variables, data sources, security groups, and outputs.
- Query AWS API dynamically via `data` sources to resolve real-time AMI IDs and Default VPC/Subnet mappings across regions.
- Provision a secured EC2 compute instance bootstrapped with an Apache HTTP web server via `user_data` script execution.
- Manage full infrastructure state lifecycles including initialization, validation, execution planning, in-place updates, and teardowns.

## Tools Used
- **Terraform (v1.6+)**: Declarative Infrastructure as Code engine.
- **AWS CLI**: Cloud authentication and API execution tool.
- **Amazon Web Services (AWS)**: EC2, VPC, Subnets, Security Groups, and dynamic AMI Data Sources.
- **Bash / Linux**: System administration and deployment validation tool.

## Key Skills Demonstrated
- **Declarative Cloud Engineering**: Defining reproducible, version-controlled cloud infrastructure templates in HCL.
- **Dynamic Resource Resolution**: Eliminating hardcoded cloud IDs using dynamic API lookup filters.
- **Network & Access Management**: Configuring security group rules regulating inbound SSH and HTTP traffic while managing outbound egress.
- **State File & Lifecycle Management**: Executing non-destructive in-place updates using state tracking diff engines.

## Troubleshooting Log
- **APT Keyring Deprecation**: Refactored HashiCorp APT repository integration to adopt explicit `/usr/share/keyrings/hashicorp-archive-keyring.gpg` storage per standard Debian/Ubuntu security standards.
- **Dynamic AMI Matcher**: Refined data source filtering parameters for Amazon Linux 2 (`amzn2-ami-hvm-*-x86_64-gp2`) to ensure valid image resolution across arbitrary AWS deployment regions.
