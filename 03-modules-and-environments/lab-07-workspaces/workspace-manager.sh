#!/bin/bash
case "$1" in
    "list")
        terraform workspace list
        ;;
    "current")
        echo "Current workspace: $(terraform workspace show)"
        ;;
    "switch")
        terraform workspace select "$2"
        ;;
    "status")
        echo "Current workspace: $(terraform workspace show)"
        terraform state list
        ;;
    "deploy")
        workspace="$2"
        terraform workspace select "$workspace"
        terraform apply -var-file="${workspace}.tfvars" -auto-approve
        ;;
    *)
        echo "Usage: $0 {list|current|switch|status|deploy} [workspace-name]"
        ;;
esac
