output "container-name" {
  #value       = [for container in docker_container.nodered_container : container.name]
  value = docker_container.nodered_container.name
  description = "The name of the container"
}

output "ip-address" {
  #value = [for container in docker_container.nodered_container : "${container.ip_address}:${container.ports[0].external}"]
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.ip_address], i.ports[*]["external"])]
  description = "The IP address of the container"
}