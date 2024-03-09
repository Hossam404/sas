terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "kubernetes" {
  config_path    = "/config"
  config_context = "minikube"
}
