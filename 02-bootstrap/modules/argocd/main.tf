resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace

  # Desativa TLS no server para simplificar o port-forward local
  set {
    name  = "server.extraArgs[0]"
    value = "--insecure"
  }

  # Limites leves para o ambiente local Floci/Docker
  set {
    name  = "controller.resources.limits.cpu"
    value = "500m"
  }
  set {
    name  = "controller.resources.limits.memory"
    value = "512Mi"
  }
  set {
    name  = "server.resources.limits.cpu"
    value = "250m"
  }
  set {
    name  = "server.resources.limits.memory"
    value = "256Mi"
  }

  values = var.custom_values
}