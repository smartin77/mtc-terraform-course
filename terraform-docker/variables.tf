variable "env" {
  type        = string
  description = "Env to deploy"
  default     = "dev"
}

variable "image" {
  type        = map
  description = "image for container"

  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

locals {
  container_count = length(lookup(var.port_external, var.env))
}

variable "port_external" {
  type = map

  validation {
    condition     = max(var.port_external["dev"]...) <= 65535 && min(var.port_external["dev"]...) >= 1980
    error_message = "The external port must be in the valid port range 1980 - 65535"
  }

  validation {
    condition     = max(var.port_external["prod"]...) < 1980 && min(var.port_external["prod"]...) >= 1880
    error_message = "The external port must be in the valid port range 1880 - 1979"
  }
}

variable "port_internal" {
  type    = number
  default = 1880

  validation {
    condition     = var.port_internal == 1880
    error_message = "The internal port must be 1880"
  }
}