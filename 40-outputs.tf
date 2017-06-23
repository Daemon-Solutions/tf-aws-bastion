output "bastion_sg" {
  value = "${aws_security_group.bastion_sg.id}"
}

output "asg_name" {
  value = "${var.envname}-${var.envtype}-bastion"
}
