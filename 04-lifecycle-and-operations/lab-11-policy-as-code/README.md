# Infrastructure Security & Compliance with Policy as Code (OPA & Conftest)

## Objectives
- Install and configure **Open Policy Agent (OPA)** and **Conftest** for automated IaC governance.
- Author modular Rego policies enforcing IAM least privilege access, network security group restrictions, and mandatory tagging.
- Integrate OPA evaluation with Terraform execution plans (`plan.json`) to catch compliance violations pre-deployment.
- Implement CI/CD security gate pipelines to block non-compliant infrastructure code automatically.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code engine.
- **Open Policy Agent (OPA v0.58.0)**: Policy-as-code engine using Rego.
- **Conftest (v0.46.0)**: Structured configuration testing utility.

## Key Skills Demonstrated
- **Shift-Left Compliance**: Evaluating cloud governance rules against Terraform plans before resource creation.
- **Rego Rule Authoring**: Writing precise deny/warn statements for wildcards, open security group ports, and missing resource tags.
- **CI/CD Gating**: Automating policy validation exit codes to prevent insecure deployments in pipelines.

## Troubleshooting Log
- **Terraform Plan JSON Versioning**: Ensured `terraform show -json` output schemas align correctly with OPA resource path structures (`input.planned_values.root_module.resources`).
