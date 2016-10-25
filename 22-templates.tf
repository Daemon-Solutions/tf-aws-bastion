data "template_file" "linux_bastion_userdata" {
  template = "${path.module}/include/linux_bastion_userdata.tmpl"

  vars {
    envname  = "${var.envname}"
    envtype  = "${var.envtype}"
    region   = "${var.aws_region}"
    domain   = "${var.domain}"
    profile  = "bastion"
    r53_zone = "${var.domain_zone_id}"
  }
}

data "template_file" "bastion_domain_join_ps1" {
  template = "${path.module}/include/domain_join.ps1.tmpl"

  vars {
    domain_name     = "${var.domain}"
    domain_password = "${var.domain_password}"
    dns_servers     = "${var.dns_servers}"
  }
}

data "template_file" "bastion_r53_register_ps1" {
  template = "${path.module}/include/r53_register.ps1.tmpl"

  vars {
    r53_zone = "${var.domain_zone_id}"
    profile  = "bastion"
    domain   = "${var.domain}"
  }
}
