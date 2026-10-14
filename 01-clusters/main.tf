module "eks_hub" {
  source = "./modules/eks"

  cluster_name = "eks-hub"
  subnet_ids   = local.default_subnets

  tags = merge(local.common_tags, { Role = "hub" })
}

module "eks_spoke" {
  source = "./modules/eks"

  cluster_name = "eks-spoke"
  subnet_ids   = local.default_subnets

  tags = merge(local.common_tags, { Role = "spoke" })
}
