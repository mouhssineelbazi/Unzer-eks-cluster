resource "aws_eks_cluster" "eks_cluster" {
  name                      = var.cluster_name
  role_arn                  = aws_iam_role.eks_cluster_role.arn
  version                   = var.cluster_version
  vpc_config {
    security_group_ids      = [aws_security_group.cluster_sg.id]
    subnet_ids              = ["subnet-07757debec7abc429", "subnet-08527a2968582c62e"]
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
  }

  tags = merge(
    var.tags,
    var.cluster_tags,
  )

  depends_on = [
    aws_security_group_rule.cluster_egress_internet,
    aws_security_group_rule.cluster_https_worker_ingress,
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEKSVPCResourceController,
  ]
}
