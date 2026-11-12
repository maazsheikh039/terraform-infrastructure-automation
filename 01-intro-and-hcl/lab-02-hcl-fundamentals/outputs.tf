output "flattened_service_regions" {
  description = "Flattened list of all service and region combinations"
  sensitive   = false
  value       = local.service_regions
}

output "effective_replicas" {
  description = "Effective replica counts per service per region"
  sensitive   = false
  value       = { for sr in local.service_regions : sr.key => sr.replicas }
}

output "merged_tag_map" {
  description = "Common tag map for infrastructure resources"
  sensitive   = false
  value       = local.common_tags
}
