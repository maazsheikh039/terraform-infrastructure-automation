#!/bin/bash
set -e

FAILED_CHECKS=0

echo "🔍 Starting Terraform Quality Gate..."

echo "📝 Checking Terraform formatting..."
if ! terraform fmt -check -diff; then
    echo "❌ Terraform formatting check failed"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
else
    echo "✅ Terraform formatting check passed"
fi

echo "🔧 Validating Terraform configuration..."
if ! terraform validate; then
    echo "❌ Terraform validation failed"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
else
    echo "✅ Terraform validation passed"
fi

echo "🔍 Running tflint analysis..."
if ! tflint; then
    echo "❌ tflint analysis failed"
    FAILED_CHECKS=$((FAILED_CHECKS + 1))
else
    echo "✅ tflint analysis passed"
fi

echo "🔒 Running security scan with tfsec..."
if ! tfsec --soft-fail .; then
    echo "⚠️  Security issues found (soft fail)"
else
    echo "✅ Security scan passed"
fi

echo ""
if [ $FAILED_CHECKS -eq 0 ]; then
    echo "🎉 All quality gates passed! Configuration is ready for deployment."
    exit 0
else
    echo "💥 $FAILED_CHECKS quality gate(s) failed. Please fix the issues before proceeding."
    exit 1
fi
