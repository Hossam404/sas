resource "kubernetes_namespace" "node" {
  metadata {
    name = "node"
  }
}

resource "kubernetes_deployment" "node-app-deployment" {
  metadata {
    name      = "node-app-deployment"
    namespace = kubernetes_namespace.node.id
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "node-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-app"
        }
      }

      spec {
        container {
          image = docker_image.node-img.name
          name  = "node-app-container"


        }
      }
    }
  }
}

resource "kubernetes_service" "node-app-service" {
  metadata {
    name      = "node-app-service"
    namespace = kubernetes_namespace.node.id
  }

  spec {
    selector = {
      app = "node-app"
    }

    type = "NodePort"

    port {
      port        = var.external_port
      target_port = var.internal_port
    }
  }
}
