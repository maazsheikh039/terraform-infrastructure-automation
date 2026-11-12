locals {
  # Common tag map merged from project, environment, and timestamp
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Timestamp   = timestamp()
  }

  # Flattened cartesian product pairing every service with every region
  service_regions = flatten([
    for s_name, s_config in var.services : [
      for reg in var.regions : {
        key          = "${reg}-${s_name}"
        service_name = s_name
        region       = reg
        port         = s_config.port
        # Scale replicas by 3x in production, otherwise leave unchanged
        replicas     = var.environment == "production" ? s_config.replicas * 3 : s_config.replicas
        health_check = s_config.health_check
      }
    ]
  ])
}
