data "template_file" "bastion_userdata" {
  template = "${file("${path.module}/include/${var.bastion_userdata_template}.tmpl")}"

  vars {
    userdata = "${var.bastion_userdata}"
    customer = "${var.customer}"
    envname  = "${var.envname}"
    envtype  = "${var.envtype}"
    region   = "${var.aws_region}"
    domain   = "${var.domain}"
    profile  = "bastion"
  }
}
