# Terraform Cloud Cost Estimation & Optimization Pipeline (Infracost)

## Objectives
- Implement infrastructure cost estimation and analysis using **Infracost** on AWS resources.
- Author multi-tier Terraform architectures representing Development, Production, and Cost-Optimized tiers.
- Apply structural cost-reduction techniques (Spot instances, instance sizing, single-AZ RDS, and reduced ElastiCache node counts) with explicit inline documentation (`# COST-OPT:`).
- Build an automated comparison script using `jq` to calculate absolute monthly dollar savings.

## Tools Used
- **Terraform (v1.8.5)**: Infrastructure as Code engine.
- **Infracost**: Cloud cost estimation and FinOps CLI.
- **AWS CLI v2 & jq**: Credential management and JSON stream parsing.

## Directory Structure
- `dev/`: Development environment (single EC2, RDS, and S3 bucket).
- `prod/`: Production environment (Multi-AZ RDS, ALB, ASG, ElastiCache).
- `optimized/`: Cost-optimized environment implementing 4 distinct FinOps strategies.
- `reports/`: Infracost JSON and table breakdown reports plus summary comparison.
