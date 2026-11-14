# Configure Terraform settings and required providers
terraform {
  required_version = ">= 1.0"

  # Configure local backend for state storage
  backend "local" {
    path = "./state-files/terraform.tfstate"
  }

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
}

# Configure providers
provider "local" {}
provider "random" {}

# Create a random string resource
resource "random_string" "lab_id" {
  length  = 8
  special = false
  upper   = false
}

# Create a local file resource
resource "local_file" "lab_info" {
  filename = "./configs/lab-${random_string.lab_id.result}.txt"
  content  = <<-EOT
    Lab 4: State Management with Local Backends
    Lab ID: ${random_string.lab_id.result}
    Created: ${timestamp()}
    Backend Type: Local
    State File Location: ./state-files/terraform.tfstate
  EOT
}

# Create a sensitive file with restricted permissions
resource "local_sensitive_file" "credentials" {
  filename        = "./configs/credentials-${random_string.lab_id.result}.txt"
  content         = <<-EOT
    # Sensitive Configuration File
    api_key: secret-key-${random_string.lab_id.result}
    database_password: db-pass-${random_string.lab_id.result}
  EOT
  file_permission = "0600"
}

# Output values for verification
output "lab_id" {
  value       = random_string.lab_id.result
  description = "Unique identifier for this lab session"
}

output "state_file_path" {
  value       = "./state-files/terraform.tfstate"
  description = "Path to the Terraform state file"
}

output "created_files" {
  value = [
    local_file.lab_info.filename,
    local_sensitive_file.credentials.filename
  ]
  description = "List of files created by Terraform"
}

# Add another local file resource
resource "local_file" "additional_config" {
  filename = "./configs/additional-${random_string.lab_id.result}.json"
  content = jsonencode({
    lab_name    = "State Management Lab"
    lab_number  = 4
    backend     = "local"
    timestamp   = timestamp()
    lab_id      = random_string.lab_id.result
  })
}

# Add output for the new resource
output "additional_file" {
  value       = local_file.moved_config.filename
  description = "Path to additional configuration file"
}
