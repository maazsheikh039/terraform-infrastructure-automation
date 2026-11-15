# Brownfield Infrastructure Adoption with Terraform Import & LocalStack

## Objectives
- Emulate enterprise cloud services locally using **LocalStack** S3 endpoints.
- Provision pre-existing out-of-band AWS resources (`my-existing-bucket`, `another-existing-bucket`) using the AWS CLI.
- Map existing cloud infrastructure into Terraform state using `terraform import`.
- Reconcile configuration drift, enforce server-side encryption, and attach bucket policies to imported assets.
- Perform advanced state surgery (`state rm` and re-import workflows).

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code engine.
- **LocalStack**: Local AWS cloud stack emulator.
- **AWS CLI v2**: Out-of-band resource provisioning.

## Key Skills Demonstrated
- **Brownfield Integration**: Adopting legacy or manually created infrastructure into declarative code without downtime.
- **State Binding**: Aligning remote resource IDs with local HCL resource addresses via `terraform import`.
- **Drift Reconciliation**: Resolving differences between manual cloud configurations and desired HCL specifications.

## Troubleshooting Log
- **LocalStack Endpoint Routing**: Configured explicit S3 service endpoints in provider definitions (`endpoints { s3 = "http://localhost:4566" }`) alongside mock credentials to route AWS API calls locally.
