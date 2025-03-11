variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS node group."
  type        = list(string)
}

variable "node_count" {
  description = "The desired number of nodes in the EKS node group."
  type        = number
}