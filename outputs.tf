####################################################################
# Provides Information About Role Resources Created by this Module #
####################################################################

output "id" {
  description = "ARN Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.eks_cluster.arn
}

output "info" {
  description = "General Information About Resources Created by this Module (Unstable)"

  value = {
    unique_id = aws_iam_role.eks_cluster.arn

    attached_policies = [
      aws_iam_role_policy_attachment.eks_cluster.policy_arn,
    ]
  }
}

output "name" {
  description = "Name Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.eks_cluster.name
}

output "tags" {
  description = "Map of Tags Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.eks_cluster.tags_all
}
