
resource "aws_security_group" "cluster_sg" {
  name_prefix = var.cluster_name
  description = "EKS cluster security group."
  vpc_id      = "vpc-0f4548f17f8a408be"
  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-eks_cluster_sg"
    },
  )
}

resource "aws_security_group" "node_group_sg" {
  name_prefix = var.cluster_name
  description = "node group security group."
  vpc_id      = "vpc-0f4548f17f8a408be"
  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_name}-node_group_sg"
    },
  )
}


resource "aws_security_group_rule" "cluster_egress_internet" {
  description       = "Allow cluster egress access to the Internet."
  protocol          = "-1"
  security_group_id = aws_security_group.cluster_sg.id
  cidr_blocks       = var.cluster_egress_cidrs
  from_port         = 0
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "cluster_https_worker_ingress" {
  description              = "Allow pods to communicate with the EKS cluster API."
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cluster_sg.id
  source_security_group_id = aws_security_group.node_group_sg.id
  from_port                = 443
  to_port                  = 443
  type                     = "ingress"
}
resource "aws_security_group_rule" "ssh" {
  description              = "Allow pods to communicate with the EKS cluster API."
  protocol                 = "tcp"
  security_group_id        = aws_security_group.node_group_sg.id
  cidr_blocks = ["0.0.0.0/0"]
  from_port                = 22
  to_port                  = 22
  type                     = "ingress"
}

