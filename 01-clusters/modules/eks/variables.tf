variable "cluster_name" {
  description = "Nome do cluster EKS a ser criado"
  type        = string
}

variable "kubernetes_version" {
  description = "Versao do Kubernetes desejada para o cluster"
  type        = string
  default     = "1.34"
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets para a VPC do cluster"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "ARN da Role IAM associada ao cluster EKS"
  type        = string
  default     = "arn:aws:iam::000000000000:role/eks-cluster-role"
}

variable "tags" {
  description = "Tags adicionais a serem aplicadas no cluster"
  type        = map(string)
  default     = {}
}