#!/bin/bash
source ../bucket_info.env
BACKUP_DIR="$HOME/terraform-state-backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR

echo "Downloading state file snapshot from S3..."
aws s3 cp s3://$S3_BUCKET_NAME/infrastructure/terraform.tfstate $BACKUP_DIR/terraform.tfstate.$TIMESTAMP
echo "Backup saved to: $BACKUP_DIR"
