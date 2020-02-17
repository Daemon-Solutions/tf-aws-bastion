data "aws_vpc" "cidr" {
  id = data.aws_subnet.vpc.vpc_id
}

data "aws_subnet" "vpc" {
  id = var.public_subnets[0]
}
