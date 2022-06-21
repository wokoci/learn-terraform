terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_container" "docker_nodered_image" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "container-name" {
  description = "Output aboput docjer container"
  value       = docker_container.docker_nodered_image.name
}


output "ip-address" {
  description = "details about external ip address to running node-red "
  value       = join(":", [docker_container.docker_nodered_image.ip_address, docker_container.docker_nodered_image.ports[0].external])
}