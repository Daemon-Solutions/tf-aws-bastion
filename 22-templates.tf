resource "template_file" "linux_bastion_userdata" {
  template = "${file("./include//linux_bastion_userdata.tmpl")}"

  vars {
    envname  = "${var.envname}"
    envtype  = "${var.envtype}"
    region   = "${var.aws_region}"
    domain   = "${var.domain}"
    profile  = "bastion"
    r53_zone = "${var.domain_zone_id}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "template_file" "bastion_domain_join_ps1" {
  template = "${path.module}/include/domain_join.ps1.tmpl"

  lifecycle {
    create_before_destroy = true
  }

  vars {
    domain_name     = "${var.domain}"
    domain_password = "${var.domain_password}"
    dns_servers     = "${var.dns_servers}"
  }
}

resource "template_file" "bastion_r53_register_ps1" {
  template = "${path.module}/include/r53_register.ps1.tmpl"

  lifecycle {
    create_before_destroy = true
  }

  vars {
    r53_zone = "${var.domain_zone_id}"
    profile  = "bastion"
    domain   = "${var.domain}"
  }
}
