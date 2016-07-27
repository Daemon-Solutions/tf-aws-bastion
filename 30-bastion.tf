
/* Linux Bastions */
module "bastion" {
  source = "../tf-aws-asg"

  name    = "${var.envname}-${var.envtype}-bastion"
  envname = "${var.envname}"
  service = "bastion"

  availability_zones = "${lookup(var.aws_zones, var.aws_region)}"
  subnets            = "${module.vpc.public_subnets}"

  key_name                    = "bashton"
  ami_id                      = "${var.linux_ami}"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${module.iam_profile_bastion.profile_id}"
  security_groups             = "${aws_security_group.linux_bastion_sg.id},${aws_security_group.bastion_egress.id}"
  user_data                   = "${template_file.linux_bastion_userdata.rendered}"
  associate_public_ip_address = true

  asg_min = "${var.linux_bastion_asg_min}"
  asg_max = "${var.linux_bastion_asg_max}"
}

/* Windows Bastions */
module "bastion-win" {
  source = "../tf-aws-asg"

  name    = "${var.envname}-${var.envtype}-bastion-win"
  envname = "${var.envname}"
  service = "bastion-win"

  availability_zones = "${lookup(var.aws_zones, var.aws_region)}"
  subnets            = "${module.vpc.public_subnets}"

  key_name                    = "bashton"
  ami_id                      = "${var.windows_ami}"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${module.iam_profile_bastion.profile_id}"
  security_groups             = "${aws_security_group.windows_bastion_sg.id},${aws_security_group.egress.id},${aws_security_group.ads_connection_tcp.id},${aws_security_group.ads_connection_udp.id}"
  user_data                   = "<powershell>${template_file.bastion_domain_join_ps1.rendered}${template_file.bastion_r53_register_ps1.rendered}</powershell><persist>true</persist>"
  associate_public_ip_address = true

  asg_min = "${var.windows_bastion_asg_min}"
  asg_max = "${var.windows_bastion_asg_max}"
}
