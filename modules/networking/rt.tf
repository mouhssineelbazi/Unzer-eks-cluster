# route table
resource "aws_route_table" "route_table_internet" {
    vpc_id = aws_vpc.main_vpc.id

    route {
      cidr_block = "0.0.0.0/24"
      gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
      Name = "${var.env}-internet_gw_route_table"
    }
}


# route table association
resource "aws_route_table_association" "route_table_association_internet_public_A" {
        subnet_id = aws_subnet.public_subnet_A.id
        route_table_id = aws_route_table.route_table_internet.id
}
resource "aws_route_table_association" "route_table_association_internet_public_B" {
        subnet_id = aws_subnet.public_subnet_B.id
        route_table_id = aws_route_table.route_table_internet.id
}
resource "aws_route_table_association" "route_table_association_internet_private_A" {
        subnet_id = aws_subnet.private_subnet_A.id
        route_table_id = aws_route_table.route_table_internet.id
}
resource "aws_route_table_association" "route_table_association_internet_private_B" {
        subnet_id = aws_subnet.private_subnet_B.id
        route_table_id = aws_route_table.route_table_internet.id
}
