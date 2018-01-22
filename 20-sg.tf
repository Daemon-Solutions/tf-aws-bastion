resource "aws_security_group" "bastion_sg" {
  name   = "${var.envname}-${var.envtype}-bastion-sg"
  vpc_id = "${data.aws_subnet.vpc.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  // Allow all traffic from VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${data.aws_vpc.cidr.cidr_block}"]
  }

  // Allow SSH traffic from whitelist
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_bastion_cidrs}"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.allowed_icmp_cidrs}"]
  }
}

resource "aws_security_group" "bastion_egress" {
  name   = "${var.envname}-${var.envtype}-bastion-egress-sg"
  vpc_id = "${data.aws_subnet.vpc.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
