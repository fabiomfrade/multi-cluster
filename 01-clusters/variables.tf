variable "aws_region" {
  description = "Regiao a ser usada na AWS"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil AWS a ser usado na conexao"
  type        = string

  validation {
    condition     = length(trimspace(var.aws_profile)) > 0
    error_message = "O perfil AWS deve ser informado"
  }
}

variable "floci_endpoint" {
  description = "Endpoint do Floci instalado"
  type        = string
  default     = "http://127.0.0.1:4566"
}