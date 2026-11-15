#!/bin/bash
set -e

echo "=== Policy as Code Security Testing ==="
cd terraform
terraform init -input=false > /dev/null 2>&1
terraform plan -out=tfplan -input=false > /dev/null 2>&1
terraform show -json tfplan > plan.json
cd ..

echo "Running Conftest evaluation against policies..."
conftest test --policy ./policies terraform/plan.json --output table || echo "Policy violations detected (Expected for non-compliant config)."
