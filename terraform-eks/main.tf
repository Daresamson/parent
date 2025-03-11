provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "eks" {
  name = "${var.cluster_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_role_policy_attachment.eks_AmazonEKSClusterPolicy]
}

// Call the child module for EKS node groups
module "eks_nodes" {
  source          = "../child_module"    // Correctly reference the child module's path
  cluster_name    = var.cluster_name
  subnet_ids      = var.subnet_ids
  node_count      = var.node_count
}