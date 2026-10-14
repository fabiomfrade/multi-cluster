output "hub_cluster_endpoint" {
  description = "Endpoint da API do cluster Hub"
  value       = module.eks_hub.cluster_endpoint
}

output "hub_cluster_name" {
  description = "Nome do cluster Hub"
  value       = module.eks_hub.cluster_name
}

output "spoke_cluster_endpoint" {
  description = "Endpoint da API do cluster Spoke"
  value       = module.eks_spoke.cluster_endpoint
}

output "spoke_cluster_name" {
  description = "Nome do cluster Spoke"
  value       = module.eks_spoke.cluster_name
}