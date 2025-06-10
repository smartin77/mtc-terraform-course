output "container-name" {
  value       = [for container in docker_container.nodered_container : container.name]
  description = "The name of the container"
}

output "ip-address" {
  value = [
    for container in docker_container.nodered_container : "${container.ip_address}:${container.ports[0].external}"
  ]
  description = "The IP address of the container"
}