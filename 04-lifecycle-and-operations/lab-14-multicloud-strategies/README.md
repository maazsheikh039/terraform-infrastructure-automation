# Multi-Cloud Infrastructure Automation with Terraform

## Objectives
- Author a modular multi-cloud Terraform architecture provisioning compute, networking, and firewall primitives simultaneously across **AWS**, **Azure**, and **GCP**.
- Enforce consistent tag/label governance across all cloud providers (`environment` and `project`).
- Validate infrastructure state reconciliation and output contracts.

## Tools Used
- **Terraform (v1.8.5)**: Multi-cloud orchestration engine.
- **AWS CLI v2, Azure CLI, Google Cloud CLI**: Provider authentication and resource verification suites.

## Architecture
- Root module orchestrates child modules located at `modules/aws`, `modules/azure`, and `modules/gcp`.
- Provisions virtual networks, subnets, ingress firewall rules (ports 22 and 80), and public IP compute instances running web servers.
