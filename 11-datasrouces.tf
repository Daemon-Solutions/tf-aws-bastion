
data "aws_vpc" "cidr" {
  id = "${data.aws_subnet.vpc.vpc_id}"
}

data "aws_subnet" "vpc" {
 id = "${element(var.public_subnets,0)}"
}
