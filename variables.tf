###############################################################
# AWS Identity and Access Management (IAM) Role Configuration #
###############################################################

variable "iam_role_name" {
  default     = "eks-cluster"
  description = "Name to Assign to the Created AWS IAM Role"
  type        = string
}

variable "iam_role_permissions_boundary" {
  default     = null
  description = "Permissions Boundary to Assign to the Created AWS IAM Role (Optional)"
  type        = string
}

variable "iam_role_prefix" {
  default     = null
  description = "Name Prefix to Assign to the Created AWS IAM Role"
  type        = string
}

##################################
# Created Resource Configuration #
##################################

variable "resource_tags" {
  default     = {}
  description = "Map of AWS Resource Tags to Assign to All Created Resources"
  type        = map(string)
}
