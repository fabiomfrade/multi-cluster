terraform {
  required_version = ">= 1.5.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.26"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile                     = var.aws_profile
  region                      = var.aws_region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    eks = var.floci_endpoint
    iam = var.floci_endpoint
    sts = var.floci_endpoint
  }
}

# Helm e Kubernetes no Hub (onde o ArgoCD é instalado)
provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig_path
    config_context = var.hub_cluster_name
  }
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.hub_cluster_name
}

# Kubernetes no Spoke (para provisionar a ServiceAccount de acesso do ArgoCD)
provider "kubernetes" {
  alias          = "spoke"
  config_path    = var.kubeconfig_path
  config_context = var.spoke_cluster_name
}