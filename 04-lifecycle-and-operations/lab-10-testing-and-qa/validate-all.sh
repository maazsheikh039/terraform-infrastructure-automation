#!/bin/bash

echo "=== Terraform Quality Assurance Report ==="
echo "Date: $(date)"
echo "Directory: $(pwd)"
echo ""

echo "1. Running Terraform Format Check..."
terraform fmt -check -diff || echo "Formatting issues detected."
echo ""

echo "2. Running Terraform Validation..."
terraform validate
if [ $? -eq 0 ]; then
    echo "✓ Terraform validation passed"
else
    echo "✗ Terraform validation failed"
fi
echo ""

echo "3. Running tflint Analysis..."
tflint || true
echo ""

echo "4. Running tfsec Security Scan..."
tfsec --format=compact . || true
echo ""

echo "=== Quality Assurance Complete ==="
