###########################################################
# Retrieves AWS Managed IAM Policy for EKS Cluster Access #
###########################################################

data "aws_iam_policy" "eks_cluster" {
  name = "AmazonEKSClusterPolicy"
}

########################################################################################
# Creates AWS Identity and Access Management (IAM) Assume Role Policy for EKS Clusters #
########################################################################################

data "aws_iam_policy_document" "assume_role_eks" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = ["eks.amazonaws.com"]
      type        = "Service"
    }
  }
}

############################################################################
# Creates AWS Identity and Access Management (IAM) Role for EKS Cluster(s) #
############################################################################

resource "aws_iam_role" "eks_cluster" {
  assume_role_policy   = data.aws_iam_policy_document.assume_role_eks.json
  description          = "AWS IAM Role for Granting Access Permissions to EKS Clusters"
  name                 = "${var.iam_role_prefix}${var.iam_role_name}"
  permissions_boundary = var.iam_role_permissions_boundary
  tags                 = var.resource_tags
}

############################################################
# Attaches Policies to the AWS IAM Role for EKS Cluster(s) #
############################################################

resource "aws_iam_role_policy_attachment" "eks_cluster" {
  policy_arn = data.aws_iam_policy.eks_cluster.arn
  role       = aws_iam_role.eks_cluster.name
}
