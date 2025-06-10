variable "container_count" {
  type    = number
  default = 1
}

variable "port_external" {
  type    = number
  default = 1880

  validation {
    condition     = var.port_external <= 65535 && var.port_external > 0
    error_message = "The external port must be in the valid port range 0 - 65535"
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