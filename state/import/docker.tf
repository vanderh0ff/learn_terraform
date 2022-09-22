# Terraform configuration

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "web" {
  image = docker_image.nginx.latest
  name  = "hashicorp-learn"
  env   = []
  ports {
    external = 8081
    internal = 80
  }
}
