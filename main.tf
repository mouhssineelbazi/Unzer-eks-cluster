resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

#Public subnets
resource "aws_subnet" "public" {

  availability_zone       = "eu-west-3a"
  cidr_block              = ""
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
}

resource "aws_subnet" "public" {

  availability_zone       = "eu-west-3b"
  cidr_block              = ""
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id


}

resource "aws_subnet" "public" {

  availability_zone       = "eu-west-3c"
  cidr_block              = 
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id

}

#Private subnet
resource "aws_subnet" "private" {

  availability_zone       = "eu-west-3a"
  cidr_block              = ""
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
}
resource "aws_subnet" "private" {

  availability_zone       = "eu-west-3b"
  cidr_block              = ""
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
}
resource "aws_subnet" "private" {

  availability_zone       = "eu-west-3c"
  cidr_block              = ""
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main.id
}
