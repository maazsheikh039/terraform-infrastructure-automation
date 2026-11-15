#!/bin/bash
echo "=== Lab Verification ==="
terraform version
opa version
conftest --version

cd terraform
terraform init -input=false > /dev/null 2>&1
terraform plan -out=tfplan -input=false > /dev/null 2>&1
terraform show -json tfplan > plan.json
cd ..

conftest test --policy ./policies terraform/plan.json --output table || true
echo "=== Verification Complete ==="
