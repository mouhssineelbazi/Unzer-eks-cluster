variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "company" {
  default = "unzer"
}
variable "availability_zone_A" {
  default = "eu-west-3a"
}
variable "availability_zone_B" {
  default = "eu-west-3b"
}
variable "public_subnet_A_cidr" {
  default = "10.0.0.0/19"
}
variable "public_subnet_B_cidr" {
  default = "10.0.32.0/19"
}
variable "private_subnet_A_cidr" {
  default = "10.0.64.0/19"
}
variable "private_subnet_B_cidr" {
  default = "10.0.128.0/20"
}
variable "env" {
  default = "dev"
}


