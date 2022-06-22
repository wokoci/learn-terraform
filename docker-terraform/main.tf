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

resource "random_string" "random" {
  length  = 4
  upper   = false
  special = false
}

resource "random_string" "random1" {
  length  = 5
  special = false
  upper   = false
}

resource "docker_container" "docker_nodered_image" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    #external = 1880
  }
}

resource "docker_container" "docker_nodered_image1" {
  name  = join("nodered1", [random_string.random.result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    #external = 1880
  }
}

output "container-name" {
  description = "Output aboput docker container"
  value       = docker_container.docker_nodered_image.name
}

output "container-name1" {
  description = "output about container 1"
  value       = docker_container.docker_nodered_image1.name
}


output "ip-address" {
  description = "details about external ip address to running node-red "
  value       = join(":", [docker_container.docker_nodered_image.ip_address, docker_container.docker_nodered_image.ports[0].external])
}

output "ip-address1" {
  description = "IP address details for cotainer 1"
  value       = join(":", [docker_container.docker_nodered_image1.ip_address, docker_container.docker_nodered_image1.ports[0].external])
}