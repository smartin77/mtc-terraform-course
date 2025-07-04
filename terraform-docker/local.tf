locals {
  deployment = {
    nodered = {
      container_count = length(var.port_external["nodered"][terraform.workspace])
      image           = var.image["nodered"][terraform.workspace]
      internal        = 1880
      external        = var.port_external["nodered"][terraform.workspace]
      container_path  = "/data"
    }
    influxdb = {
      container_count = length(var.port_external["influxdb"][terraform.workspace])
      image           = var.image["influxdb"][terraform.workspace]
      internal        = 8086
      external        = var.port_external["influxdb"][terraform.workspace]
      container_path  = "/var/lib/influxdb"
    }
    grafana = {
      container_count = length(var.port_external["grafana"][terraform.workspace])
      image           = var.image["grafana"][terraform.workspace]
      internal        = 3000
      external        = var.port_external["grafana"][terraform.workspace]
      container_path  = "/var/lib/grafana"
    }
  }
}