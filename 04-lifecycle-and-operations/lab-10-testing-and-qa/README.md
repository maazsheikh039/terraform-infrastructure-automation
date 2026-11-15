# Infrastructure as Code Testing, Linting & Security QA Pipeline

## Objectives
- Integrate static analysis linters (`tflint`) to catch best-practice violations, deprecations, and unused variables.
- Enforce cloud security compliance using vulnerability scanners (`tfsec`) targeting unencrypted storage and overly permissive access.
- Validate HCL syntax correctness via `terraform validate`.
- Implement automated CI/CD quality gates (`quality-gate.sh`) and multi-format report generation (`qa-reports/`).

## Tools Used
- **Terraform (v1.6.6)**: Core IaC engine.
- **TFLint**: Modular Terraform linter for cloud providers.
- **TFSec**: Static security analysis scanner for Terraform.
- **Bash**: Automated quality gate and reporting pipeline wrappers.

## Key Skills Demonstrated
- **Shift-Left Security**: Catching misconfigurations, hardcoded credentials, and open firewalls before deployment.
- **Automated Quality Gates**: Enforcing zero-failure policies for formatting, validation, and linting checks in pipelines.
- **Compliance Reporting**: Generating machine-readable JSON and human-readable HTML security audit reports.

## Troubleshooting Log
- **Plugin Registry Caching**: Initialized `.tflint.hcl` with explicit AWS plugin ruleset versions to ensure reliable offline linter execution.
