resource "local_file" "welcome_file" {
  filename = "${path.module}/welcome.txt"
  content  = "Welcome to ${var.app_name}!\nEnvironment: ${var.environment}\nDebug Mode: ${var.debug_mode}\nTimestamp: ${timestamp()}"
}

resource "local_file" "config_file" {
  filename = "${path.module}/configs/app.conf"
  content  = <<-EOT
    [application]
    name = ${var.app_name}
    environment = ${var.environment}
    
    [database]
    host = localhost
    port = 5432
    name = ${var.app_name}_db
    max_connections = ${var.max_connections}
  EOT
}

resource "local_file" "json_config" {
  filename = "${path.module}/configs/settings.json"
  content = jsonencode({
    app_name        = var.app_name
    environment     = var.environment
    debug_mode      = var.debug_mode
    max_connections = var.max_connections
    features = [
      "logging",
      "monitoring",
      "caching"
    ]
  })
}

resource "local_file" "readme_file" {
  filename = "${path.module}/README.md"
  content  = <<-EOT
    # ${var.app_name} - ${var.environment}
    
    This directory contains files managed by Terraform.
    
    ## Configuration:
    - Application: ${var.app_name}
    - Environment: ${var.environment}
    - Debug Mode: ${var.debug_mode}
    - Max Connections: ${var.max_connections}
    
    Generated on: ${timestamp()}
  EOT
}
