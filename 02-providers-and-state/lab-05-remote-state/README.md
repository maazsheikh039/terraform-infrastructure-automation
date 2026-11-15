# Enterprise Terraform Remote State Management with AWS S3 and DynamoDB

## Objectives
- Deploy and configure an Amazon S3 backend bucket with strict versioning, server-side encryption (`AES256`), and public access blocks.
- Implement distributed state locking via Amazon DynamoDB (`PAY_PER_REQUEST` billing mode with `LockID` hash key).
- Isolate modular backend provisioning from core cloud infrastructure workloads.
- Establish state backup, version auditing, and safe teardown automation.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code engine.
- **Amazon Web Services (AWS)**: S3, DynamoDB, VPC, Subnets, and IGW.
- **Bash / AWS CLI**: State automation and verification scripts.

## Key Skills Demonstrated
- **State Locking & Concurrency Protection**: Preventing race conditions and corrupted state files during multi-user team deployments.
- **Secure Cloud State Persistence**: Storing encrypted state files remotely with full object version history retention.
- **Modular Infrastructure Architecture**: Decoupling control-plane backend infrastructure from data-plane application resources.

## Troubleshooting Log
- **S3 Bucket Deletion Prerequisites**: Automated recursive object version cleanup scripts to handle emptying version-enabled S3 buckets prior to `terraform destroy`.
