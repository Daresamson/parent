variable "aws_region" {
  description = "The AWS region to deploy the EKS cluster."
  type        = string
  default     = "us-west-2"  # Example region: Oregon
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"  # Example cluster name
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster will be deployed."
  type        = list(string)
  default     = [
    "subnet-0123456789abcdef0", # Example public subnet ID 1
    "subnet-0123456789abcdef1", # Example public subnet ID 2
    "subnet-0123456789abcdef2"  # Example private subnet ID 3
  ]
}

variable "node_count" {
  description = "The desired number of nodes in the EKS node group."
  type        = number
  default     = 3  # Example initial node count
}