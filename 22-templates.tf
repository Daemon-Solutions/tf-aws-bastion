data "template_file" "bastion_userdata" {
  template = "${path.module}/include/bastion_userdata.tmpl"

  vars {
    customer = "${var.customer}"
    envname  = "${var.envname}"
    envtype  = "${var.envtype}"
    region   = "${var.aws_region}"
    domain   = "${var.domain}"
    profile  = "bastion"
  }
}
