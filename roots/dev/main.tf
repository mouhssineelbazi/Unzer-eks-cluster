provider "aws" {
  region = "eu-west-3"
}

module "eks" {
  source          = "../../modules/eks"
  cluster_version = "1.21"
  cluster_name    = "dev-unzer"
  instance_types = ["t2.micro"]
  desired_size  = 3 
  max_size = 5
  min_size = 3
}

