output "namespace" {
  description = "Namespace de instalação do ArgoCD"
  value       = helm_release.argocd.namespace
}

output "release_name" {
  description = "Nome da release Helm"
  value       = helm_release.argocd.name
}

output "chart_version" {
  description = "Versão do chart utilizada"
  value       = helm_release.argocd.version
}