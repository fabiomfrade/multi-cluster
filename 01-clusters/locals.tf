locals {
  default_subnets = [
    "subnet-default-us-east-1-a",
    "subnet-default-us-east-1-b",
    "subnet-default-us-east-1-c"
  ]

  common_tags = {
    Environment = "local"
    Owner       = "seu_email@provedor.com"
    Managed-by  = "Terraform"
  }
}
