# 1. Instala o ArgoCD no eks-hub
module "argocd" {
  source           = "./modules/argocd"
  namespace        = var.argocd_namespace
  create_namespace = true
}

# 2. Obtém dados de endpoint e CA do eks-spoke via Floci
data "aws_eks_cluster" "spoke" {
  name = var.spoke_cluster_name
}

# 3. Cria a ServiceAccount de gerenciamento dentro do eks-spoke
resource "kubernetes_service_account" "argocd_manager" {
  provider = kubernetes.spoke

  metadata {
    name      = "argocd-manager"
    namespace = "kube-system"
  }
}

# 4. Concede permissão de cluster-admin à ServiceAccount no eks-spoke
resource "kubernetes_cluster_role_binding" "argocd_manager" {
  provider = kubernetes.spoke

  metadata {
    name = "argocd-manager-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.argocd_manager.metadata[0].name
    namespace = kubernetes_service_account.argocd_manager.metadata[0].namespace
  }
}

# 5. Gera Secret de Token para a ServiceAccount (necessário no K8s 1.24+)
resource "kubernetes_secret" "argocd_manager_token" {
  provider = kubernetes.spoke

  metadata {
    name      = "argocd-manager-token"
    namespace = "kube-system"
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.argocd_manager.metadata[0].name
    }
  }

  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}

# 6. Registra o eks-spoke dentro do ArgoCD no eks-hub
resource "kubernetes_secret" "spoke_cluster_registration" {
  depends_on = [module.argocd]

  metadata {
    name      = "cluster-${var.spoke_cluster_name}"
    namespace = module.argocd.namespace
    labels = {
      "argocd.argoproj.io/secret-type" = "cluster"
    }
  }

  data = {
    name   = var.spoke_cluster_name
    server = var.spoke_internal_endpoint
    config = jsonencode({
      bearerToken = kubernetes_secret.argocd_manager_token.data["token"]
      tlsClientConfig = {
        insecure = true 
      }
    })
  }

  type = "Opaque"
}