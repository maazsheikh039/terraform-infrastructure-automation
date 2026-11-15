#!/bin/bash
set -e

REPORTS_DIR="$HOME/cost-lab/reports"
SUMMARY_FILE="$REPORTS_DIR/comparison-summary.txt"

DEV_JSON="$REPORTS_DIR/dev-breakdown.json"
PROD_JSON="$REPORTS_DIR/prod-breakdown.json"
OPT_JSON="$REPORTS_DIR/optimized-breakdown.json"

# Validate JSON reports existence
for f in "$DEV_JSON" "$PROD_JSON" "$OPT_JSON"; do
    if [ ! -f "$f" ]; then
        echo "Error: Required JSON report file not found: $f" >&2
        exit 1
    fi
done

# Extract total monthly costs using jq
DEV_COST=$(jq -r '.totalMonthlyCost // 0' "$DEV_JSON")
PROD_COST=$(jq -r '.totalMonthlyCost // 0' "$PROD_JSON")
OPT_COST=$(jq -r '.totalMonthlyCost // 0' "$OPT_JSON")

# Calculate absolute savings of Optimized vs Production using bc
SAVINGS=$(echo "$PROD_COST - $OPT_COST" | bc)

# Format output
OUTPUT=$(cat << TABLE_EOF
======================================================
         INFRASTRUCTURE MONTHLY COST COMPARISON        
======================================================
Scenario         | Monthly Estimated Cost (USD)
------------------------------------------------------
Development      | \$$(printf "%.2f" "$DEV_COST")
Production       | \$$(printf "%.2f" "$PROD_COST")
Optimized        | \$$(printf "%.2f" "$OPT_COST")
======================================================
Optimized saves \$$(printf "%.2f" "$SAVINGS")/month vs Production
======================================================
TABLE_EOF
)

# Print to stdout and save to comparison-summary.txt
echo "$OUTPUT"
echo "$OUTPUT" > "$SUMMARY_FILE"
exit 0
