module "bastion" {
  source = "../tf-aws-asg"

  name    = "${var.envname}-${var.envtype}-bastion"
  envname = "${var.envname}"
  service = "bastion"

  subnets = ["${var.public_subnets}"]

  key_name                    = "${var.key_name}"
  ami_id                      = "${var.bastion_ami}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${module.iam_profile_bastion.profile_id}"
  security_groups             = ["${aws_security_group.bastion_sg.id}", "${aws_security_group.bastion_egress.id}"]
  user_data                   = "${var.bastion_userdata}${data.template_file.bastion_userdata.rendered}"
  associate_public_ip_address = true

  min = "${var.bastion_asg_min}"
  max = "${var.bastion_asg_max}"
}
