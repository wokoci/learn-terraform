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
  count   = 2
  length  = 4
  upper   = false
  special = false
}

resource "docker_container" "docker_nodered_image" {
  count = 2
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    #external = 1880
  }
}

output "container-name" {
  description = "output about container 1"
  value       = docker_container.docker_nodered_image[*].name
}


output "ip-address" {
  description = "details about external ip address to running node-red "
  value       =  [for i in docker_container.docker_nodered_image[*]: join(":",[i.ip_address],[i.ports[0].external])]
}
