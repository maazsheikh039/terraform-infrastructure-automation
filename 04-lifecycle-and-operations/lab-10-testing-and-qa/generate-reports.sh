#!/bin/bash

REPORT_DIR="qa-reports"
mkdir -p $REPORT_DIR

echo "📊 Generating comprehensive QA reports..."
tflint --format=json > $REPORT_DIR/tflint-report.json
tflint --format=compact > $REPORT_DIR/tflint-report.txt
tfsec --format=json . > $REPORT_DIR/tfsec-report.json
tfsec --format=html . > $REPORT_DIR/tfsec-report.html
terraform validate -json > $REPORT_DIR/terraform-validate.json

echo "✅ Reports generated successfully in $REPORT_DIR/"
ls -la $REPORT_DIR/
