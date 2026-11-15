#!/bin/bash

echo "=== Terraform Lab Cleanup ==="
echo "Date: $(date)"
echo "=============================="

echo "1. Creating final backup..."
cp terraform.tfstate backups/terraform.tfstate.final-backup-$(date +%Y%m%d-%H%M%S)

echo -e "\n2. Planning destruction..."
terraform plan -destroy

echo -e "\n3. Confirmation required:"
read -p "Do you want to destroy all resources? (yes/no): " CONFIRM

if [ "$CONFIRM" = "yes" ]; then
    echo "Destroying resources..."
    terraform destroy -auto-approve
    
    echo -e "\n4. Cleanup verification:"
    if [ $(terraform state list | wc -l) -eq 0 ]; then
        echo "✓ All resources destroyed successfully"
    else
        echo "✗ Some resources may still exist"
        terraform state list
    fi
    
    echo -e "\n5. File cleanup:"
    rm -f welcome.txt README.md
    rm -f configs/app.conf configs/settings.json
    echo "✓ Generated files removed"
else
    echo "Cleanup cancelled by user"
fi

echo -e "\nCleanup completed at: $(date)"
