# Multi-Environment State Isolation with Terraform Workspaces

## Objectives
- Isolate independent deployment stages (`dev`, `test`, `prod`) using native Terraform workspaces.
- Inject environment-specific parameters via dedicated variable files (`dev.tfvars`, `test.tfvars`, `prod.tfvars`).
- Implement dynamic file generation and conditional scaling counts based on active workspace contexts (`terraform.workspace`).
- Build CLI automation helper wrappers for seamless workspace navigation and multi-stage deployment management.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code engine with native workspace support.
- **Local Provider**: Artifact state tracking and file generation.
- **Bash**: CLI automation script wrappers.

## Key Skills Demonstrated
- **Workspace State Segmentation**: Maintaining isolated state stores within a single codebase repository.
- **Dynamic Variable Injections**: Parameterizing scale counts, naming conventions, and environment attributes per deployment context.
- **Operational Safety**: Verifying multi-workspace state segregation to prevent staging-to-production configuration drift.

## Troubleshooting Log
- **Workspace Context Validation**: Enforced pre-flight workspace verification checks in management scripts to avoid applying configurations in unintended environments.
