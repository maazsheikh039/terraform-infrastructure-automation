# Secure AWS Provider Configuration & S3 Infrastructure Provisioning

## Objectives
- Configure the Terraform AWS provider using environment variables for secure, credential-free code storage.
- Provision a production-grade AWS S3 bucket adhering to strict security and compliance standards.
- Implement S3 bucket versioning, AES-256 server-side encryption, and complete public access blocking.
- Structure modular HCL manifests utilizing providers, variables, tfvars overrides, and output attributes.

## Tools Used
- **Terraform (v1.6+)**: Infrastructure as Code orchestration engine.
- **AWS CLI / IAM**: Cloud credential management and verification.
- **Amazon Web Services (AWS)**: S3 Buckets, Versioning, Encryption, and Access Controls.

## Key Skills Demonstrated
- **Secure Credential Isolation**: Decoupling sensitive API keys from static code by leveraging runtime environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
- **Cloud Security Hardening**: Mandating encryption-at-rest and blocking accidental public exposure on cloud storage objects.
- **Lifecycle Management**: Executing robust init, validate, plan, apply, and destroy workflows.

## Troubleshooting Log
- **Global S3 Naming Conflicts**: Adjusted bucket names in `terraform.tfvars` to guarantee global uniqueness across AWS regions.
- **Provider Plugin Caching**: Initialized local provider backends cleanly using `terraform init` to resolve missing registry dependencies.
