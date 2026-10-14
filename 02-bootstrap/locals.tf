locals {
  common_tags = {
    Environment = "local"
    ManagedBy   = "terraform"
    Stage       = "bootstrap"
    Owner       = "seu_email@provedor.com"
    Managed-by  = "Terraform"
  }
}
