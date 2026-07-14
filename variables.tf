variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    "Environment" = "jcrsecluster"
    "Owner"       = "dev-collab-tools"
  }
}

variable "cluster_name" {
  description = "Name of the cluster to prepend or append to our resources"
  type        = string
  default     = "jcrsecluster"
}
