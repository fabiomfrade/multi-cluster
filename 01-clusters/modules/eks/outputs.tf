output "cluster_name" {
  description = "Nome do cluster EKS provisionado"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Endpoint da API do Kubernetes do cluster"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Certificado CA (base64) para comunicacao com a API do cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_arn" {
  description = "ARN do cluster EKS provisionado"
  value       = aws_eks_cluster.this.arn
}

output "cluster_status" {
  description = "Status do cluster EKS"
  value       = aws_eks_cluster.this.status
}