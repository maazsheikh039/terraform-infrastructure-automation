#!/bin/bash
set -e

echo "=== CI/CD Pipeline Policy Integration Demo ==="

run_security_checks() {
    local exit_code=0
    cd terraform
    terraform validate || { echo "❌ Terraform validation failed"; exit_code=1; }
    terraform plan -out=tfplan -input=false > /dev/null 2>&1
    terraform show -json tfplan > plan.json
    cd ..

    echo "Running Conftest policy checks..."
    if conftest test --policy ./policies terraform/plan.json --output table; then
        echo "✅ All security policies passed"
    else
        echo "❌ Security policy violations found"
        exit_code=1
    fi
    return $exit_code
}

run_security_checks || echo "Pipeline caught compliance violations successfully."
