variable "aws_profile" {
  description = "Perfil AWS a ser usado na conexao"
  type        = string

  validation {
    condition     = length(trimspace(var.aws_profile)) > 0
    error_message = "O perfil AWS deve ser informado"
  }
}

variable "aws_region" {
  type        = string
  description = "Região simulada da AWS"
  default     = "us-east-1"
}

variable "floci_endpoint" {
  type        = string
  description = "URL do endpoint do Floci local"
  default     = "http://127.0.0.1:4566"
}

variable "kubeconfig_path" {
  type        = string
  description = "Caminho do arquivo kubeconfig"
  default     = "~/.kube/config"
}

variable "hub_cluster_name" {
  type        = string
  description = "Nome do cluster Hub no kubeconfig"
  default     = "eks-hub"
}

variable "spoke_cluster_name" {
  type        = string
  description = "Nome do cluster Spoke no kubeconfig"
  default     = "eks-spoke"
}

variable "argocd_namespace" {
  type        = string
  description = "Namespace para instalação do ArgoCD"
  default     = "argocd"
}

variable "spoke_internal_endpoint" {
  type = string
  description = "Endpoint interno (rede docker) da API do cluster spoke"
  
}