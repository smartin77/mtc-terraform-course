variable "image" {
  type        = map(any)
  description = "image for container"

  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "quay.io/influxdb/influxdb:v2.0.2"
      prod = "quay.io/influxdb/influxdb:v2.0.3"
    }
    grafana = {
      dev  = "grafana/grafana:latest"
      prod = "grafana/grafana:main"
    }
  }
}

# locals {
#   container_count = length(var.port_external[terraform.workspace])
# }

variable "port_external" {
  type = map(any)

  # validation {
  #   condition     = max(var.port_external["dev"]...) <= 65535 && min(var.port_external["dev"]...) >= 1980
  #   error_message = "The external port must be in the valid port range 1980 - 65535"
  # }

  # validation {
  #   condition     = max(var.port_external["prod"]...) < 1980 && min(var.port_external["prod"]...) >= 1880
  #   error_message = "The external port must be in the valid port range 1880 - 1979"
  # }
}

variable "port_internal" {
  type    = number
  default = 1880

  validation {
    condition     = var.port_internal == 1880
    error_message = "The internal port must be 1880"
  }
}