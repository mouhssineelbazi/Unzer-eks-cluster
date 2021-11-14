resource "aws_iam_role" "node_groupe_role" {
  name = "eks-node-group-role"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "rolePolicyAttachement-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_groupe_role.name
}

resource "aws_iam_role_policy_attachment" "rolePolicyAttachement-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_groupe_role.name
}

resource "aws_iam_role_policy_attachment" "rolePolicyAttachement-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_groupe_role.name
}

resource "aws_eks_node_group" "node_groupe_first" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "node_groupe_01"
  node_role_arn   = aws_iam_role.node_groupe_role.arn
  remote_access {
    ec2_ssh_key = ""
  }
  subnet_ids      = ["subnet-0c8e4195591ea17b4", "subnet-014020d1d1557aad7"]
  instance_types = var.instance_types
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.rolePolicyAttachement-AmazonEC2ContainerRegistryReadOnly,
  ]
}
