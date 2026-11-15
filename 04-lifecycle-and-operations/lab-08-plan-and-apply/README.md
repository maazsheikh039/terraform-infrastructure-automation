# Terraform Lifecycle Management: Plan, Apply, and Drift Remediation

## Objectives
- Implement deterministic execution workflows using binary plan files (`terraform plan -out`) and exit-code monitoring (`-detailed-exitcode`).
- Detect and remediate out-of-band manual configuration drift automatically via state reconciliation.
- Execute targeted resource updates (`-target`) and variable-driven configuration overrides (`terraform.tfvars`).
- Build automated Bash auditing, state backup, and safe teardown pipelines.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code lifecycle engine.
- **Local Provider (`hashicorp/local ~> 2.4`)**: File system resource state tracking.
- **Bash**: Plan log parsing, drift monitoring, and safe teardown automation.

## Key Skills Demonstrated
- **Deterministic Change Control**: Generating and applying binary plan files to guarantee zero variance between previewed and applied states.
- **Drift Detection & Self-Healing**: Identifying unauthorized file modifications and restoring desired state declaratively.
- **Operational Observability**: Automating syntax validation, formatting enforcement, and resource count auditing.

## Troubleshooting Log
- **ANSI Color Escape Stripping**: Added `-no-color` flags when redirecting `terraform plan` output to log files so `grep` pattern counters parse accurately.
- **Heredoc Variable Expansion**: Fixed single-quoted heredoc delimiters in documentation scripts to allow runtime `$(date)` timestamp evaluation.
