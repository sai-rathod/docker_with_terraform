terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  # Configuration options
}
resource "docker_image" "my-image" {
    name = "sairathod/new-app"
}
resource "docker_container" "my-con" {
    name = "react-con"
    image = docker_image.my-image.image_id
    ports {
      internal = 3000
      external = 3000
    }
  
}
output "app-available" {
    value = "http://localhost:${docker_container.my-con.ports[0].external}"
  
}