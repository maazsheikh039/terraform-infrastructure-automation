terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {
  # Local provider configuration
}

# 1. Create one configuration file per service-region pair using for_each
resource "local_file" "service_config" {
  for_each = { for sr in local.service_regions : sr.key => sr }

  filename = "${path.module}/output/${each.value.region}/${each.value.service_name}.json"
  content = jsonencode({
    service_name = each.value.service_name
    region       = each.value.region
    port         = each.value.port
    replicas     = each.value.replicas
    health_check = each.value.health_check
    tags         = local.common_tags
  })
}

# 2. Create one deployment script per region using count
resource "local_file" "deployment_script" {
  count = length(var.regions)

  filename = "${path.module}/output/scripts/deploy-${var.regions[count.index]}.sh"
  content = templatefile("${path.module}/deploy.sh.tpl", {
    region       = var.regions[count.index]
    project_name = var.project_name
    environment  = var.environment
    services     = [for s_name, s_config in var.services : s_name]
  })
}

# 3. Create consolidated monitoring scrape configuration
resource "local_file" "monitoring_config" {
  filename = "${path.module}/output/monitoring/scrape-config.json"
  content = jsonencode({
    scraper_project = var.project_name
    environment     = var.environment
    targets = [
      for s_name, s_config in var.services : {
        service_name = s_name
        port         = s_config.port
        path         = s_config.health_check
        addresses    = [for reg in var.regions : "${s_name}.${reg}.internal"]
      }
    ]
  })
}
