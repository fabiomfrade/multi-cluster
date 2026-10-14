output "argocd_namespace" {
  description = "Namespace onde o ArgoCD está em execução"
  value       = module.argocd.namespace
}

output "spoke_cluster_registered" {
  description = "Nome do cluster spoke registrado no ArgoCD"
  value       = var.spoke_cluster_name
}

output "argocd_initial_admin_password_cmd" {
  description = "Comando para recuperar a senha inicial do admin"
  value       = "kubectl --context=${var.hub_cluster_name} -n ${module.argocd.namespace} get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d && echo"
}

output "argocd_port_forward_cmd" {
  description = "Comando para expor a UI do ArgoCD via port-forward"
  value       = "kubectl --context=${var.hub_cluster_name} -n ${module.argocd.namespace} port-forward svc/argocd-server 8080:443"
}