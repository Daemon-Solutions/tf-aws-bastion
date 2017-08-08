module "bastion" {
  source = "../tf-aws-asg"

  name    = "${coalesce("${var.name}", "${var.envname}-${var.envtype}-bastion")}"
  envname = "${var.envname}"
  service = "bastion"

  extra_tags = ["${var.extra_tags}"]

  subnets = ["${var.public_subnets}"]

  key_name                    = "${var.key_name}"
  ami_id                      = "${var.bastion_ami}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_instance_profile_id}"
  security_groups             = ["${aws_security_group.bastion_sg.id}", "${aws_security_group.bastion_egress.id}"]
  user_data                   = "${data.template_file.bastion_userdata.rendered}"
  associate_public_ip_address = true

  min = "${var.bastion_asg_min}"
  max = "${var.bastion_asg_max}"
}

# Use a null resource to create an explicit dependency between the `asg_name`
# output and the ASG resource that is created within `module.bastion`. Other
# resources using the `asg_name` output (which uses this null resource) will
# then be executed AFTER the ASG is created.
resource "null_resource" bastion_asg {
  depends_on = ["module.bastion"]

  triggers = {
    name = "${coalesce("${var.name}", "${var.envname}-${var.envtype}-bastion")}"
  }
}
