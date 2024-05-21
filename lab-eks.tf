terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_node_group" "example" {
  cluster_name    = "ClusterRobson"
  node_group_name = "clusterrobson-nodegroup"
  node_role_arn   = "arn:aws:iam::730335476126:role/AmazonEKSNodeRoleClusterPrincipal"
  subnet_ids      = ["subnet-00f6bf36a8f4cd789", "subnet-06d1001b44718ef5a", "subnet-0de41a36ed12b2ff8"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_type = "t3.medium"
  disk_size     = 20
}
