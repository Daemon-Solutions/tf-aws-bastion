
output "linux_bastion_sg" {
  value = "${aws_security_group.linux_bastion_sg.id}"
}

output "windows_bastion_sg" {
  value = "${aws_security_group.windows_bastion_sg.id}"
}
