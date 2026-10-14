variable "namespace" {
  type        = string
  description = "Namespace onde o ArgoCD será instalado"
  default     = "argocd"
}

variable "chart_version" {
  type        = string
  description = "Versão do Helm chart do ArgoCD"
  default     = "6.7.18" # ArgoCD v2.10.x
}

variable "create_namespace" {
  type        = bool
  description = "Indica se o namespace deve ser criado pelo Helm release"
  default     = true
}

variable "custom_values" {
  type        = list(string)
  description = "Lista de blocos YAML customizados para sobrescrever valores"
  default     = []
}