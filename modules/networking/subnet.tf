#Public subnets
resource "aws_subnet" "public_subnet_A" {
  availability_zone       = var.availability_zone_A
  cidr_block              = var.public_subnet_A_cidr 
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.env}-public_subnet_A"
  }

}

resource "aws_subnet" "public_subnet_B" {
  availability_zone       = var.availability_zone_B
  cidr_block              = var.public_subnet_B_cidr
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.env}-public_subnet_B"
  }
}

#Private subnet
resource "aws_subnet" "private_subnet_A" {

  availability_zone       = var.availability_zone_A
  cidr_block              = var.private_subnet_A_cidr
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.env}-private_subnet_A"
    "kubernetes.io/cluster/dev-unzer" = "shared"
  }
}

resource "aws_subnet" "private_subnet_B" {

  availability_zone       = var.availability_zone_B
  cidr_block              = var.private_subnet_B_cidr
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.env}-private_subnet_B"
    "kubernetes.io/cluster/dev-unzer" = "shared"
  }
}

