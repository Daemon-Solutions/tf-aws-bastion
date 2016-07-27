resource "aws_security_group" "linux_bastion_sg" {
  name = "${var.envname}-${var.envtype}-bastion-sg"
  vpc_id = "${var.vpc_id}"

  // Allow all traffic from VPC
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${split(",", var.vpc_cidr)}"]
  }

  // Allow SSH traffic from whitelist
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${split(",", var.allowed_bastion_cidrs)}"]
  }
}

resource "aws_security_group" "windows_bastion_sg" {
  name = "${var.envname}-${var.envtype}-bastion-win-sg"
  vpc_id = "${var.vpc_id}"

  // Allow all traffic from VPC
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${split(",", var.vpc_cidr)}"]
  }

  // Allow WinRM (HTTP) traffic from whitelist
  ingress {
    from_port = 5985
    to_port = 5985
    protocol = "tcp"
    cidr_blocks = ["${split(",", var.allowed_bastion_cidrs)}"]
  }

  // Allow WinRM (HTTPS) traffic from whitelist
  ingress {
    from_port = 5986
    to_port = 5986
    protocol = "tcp"
    cidr_blocks = ["${split(",", var.allowed_bastion_cidrs)}"]
  }
}

resource "aws_security_group" "bastion_egress" {
  name        = "${var.envname}-${var.envtype}-bastion-egress-sg"
  vpc_id      = "${var.vpc_id}"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
