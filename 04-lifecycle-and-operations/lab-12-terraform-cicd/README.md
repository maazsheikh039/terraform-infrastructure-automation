# Enterprise Terraform CI/CD Automation with GitHub Actions

## Objectives
- Configure event-driven GitHub Actions pipelines for automated Terraform provisioning.
- Implement pull request planning (`terraform-plan.yml`) with automated PR comment reporting.
- Enforce automated deployment (`terraform-apply.yml`) on merges to the `main` branch.
- Establish advanced platform capabilities including Checkov static security scanning and scheduled cron drift detection.

## Tools Used
- **Terraform (v1.6.6)**: Infrastructure as Code engine.
- **GitHub Actions**: Native CI/CD orchestration engine.
- **GitHub CLI (`gh`)**: Repository and pull request management automation.

## Key Skills Demonstrated
- **Plan/Apply Separation**: Reviewing infrastructure change sets on pull requests before applying them in production.
- **Artifact Management**: Uploading generated outputs and configuration files securely as workflow artifacts.
- **Safety Gates**: Implementing manual confirmation gates for destructive `terraform destroy` workflows.

## Troubleshooting Log
- **GitHub Actions Permissions**: Ensured repository workflow permissions are set to "Read and write" in repository settings to allow `actions/github-script` to post plan comments on pull requests.
