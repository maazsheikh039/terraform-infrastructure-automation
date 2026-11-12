variable "project_name" {
  description = "Name of the infrastructure project"
  type        = string
  default     = "enterprise-core"
}

variable "environment" {
  description = "Target deployment environment (development, staging, production)"
  type        = string
  default     = "production"

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be exactly development, staging, or production."
  }
}

variable "services" {
  description = "Map of microservices with ports, replica counts, and health check paths"
  type = map(object({
    port         = number
    replicas     = number
    health_check = string
  }))
  default = {
    auth-api = {
      port         = 8080
      replicas     = 2
      health_check = "/healthz"
    }
    payment-svc = {
      port         = 9090
      replicas     = 3
      health_check = "/status"
    }
  }
}

variable "regions" {
  description = "List of target deployment regions"
  type        = list(string)
  default     = ["us-east-1", "eu-central-1"]
}
