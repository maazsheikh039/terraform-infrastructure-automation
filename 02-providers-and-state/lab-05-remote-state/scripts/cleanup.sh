#!/bin/bash
source ../bucket_info.env

echo "Destroying main infrastructure..."
cd ~/terraform-remote-state-lab/main-infrastructure
terraform destroy -auto-approve

echo "Emptying and deleting S3 backend bucket versions..."
cd ~/terraform-remote-state-lab/backend-setup

aws s3 rm s3://$S3_BUCKET_NAME --recursive
aws s3api list-object-versions --bucket $S3_BUCKET_NAME --query 'Versions[].{Key:Key,VersionId:VersionId}' --output text | while read key version; do
    [ "$key" != "None" ] && [ "$version" != "None" ] && aws s3api delete-object --bucket $S3_BUCKET_NAME --key "$key" --version-id "$version"
done
aws s3api list-object-versions --bucket $S3_BUCKET_NAME --query 'DeleteMarkers[].{Key:Key,VersionId:VersionId}' --output text | while read key version; do
    [ "$key" != "None" ] && [ "$version" != "None" ] && aws s3api delete-object --bucket $S3_BUCKET_NAME --key "$key" --version-id "$version"
done

echo "Destroying backend infrastructure..."
terraform destroy -auto-approve
rm -rf ~/terraform-remote-state-lab/terraform-state-backups/ ~/terraform-remote-state-lab/bucket_info.env
echo "Cleanup completed successfully."
