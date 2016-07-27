/* Security group for cross-vpc AD connectivity
    - http://docs.aws.amazon.com/directoryservice/latest/admin-guide/cloud_prereq.html
    - http://blogs.msmvps.com/acefekay/2011/11/01/active-directory-firewall-ports-let-s-try-to-make-this-simple/
*/

resource "aws_security_group" "ads_connection_tcp" {
  name = "${var.envname}-${var.envtype}-ads-tcp"
  description = "Security Group ${var.envname}-${var.envtype}-ads"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group" "ads_connection_udp" {
  name = "${var.envname}-${var.envtype}-ads-udp"
  description = "Security Group ${var.envname}-${var.envtype}-ads"
  vpc_id = "${var.vpc_id}"
}

/* DNS */
resource "aws_security_group_rule" "ads_tcp_53" {
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

resource "aws_security_group_rule" "ads_udp_53" {
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}

/* Kerberos authentication */
resource "aws_security_group_rule" "ads_tcp_88" {
  type              = "ingress"
  from_port         = 88
  to_port           = 88
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

resource "aws_security_group_rule" "ads_udp_88" {
  type              = "ingress"
  from_port         = 88
  to_port           = 88
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}

/* NTP */
resource "aws_security_group_rule" "ads_udp_123" {
  type              = "ingress"
  from_port         = 123
  to_port           = 123
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}

/* RPC */
resource "aws_security_group_rule" "ads_tcp_135" {
  type              = "ingress"
  from_port         = 135
  to_port           = 135
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

/* NetLogon */
resource "aws_security_group_rule" "ads_tcp_139" {
  type              = "ingress"
  from_port         = 139
  to_port           = 139
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

resource "aws_security_group_rule" "ads_udp_137" {
  type              = "ingress"
  from_port         = 137
  to_port           = 138
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}

/* LDAP */
resource "aws_security_group_rule" "ads_tcp_389" {
  type              = "ingress"
  from_port         = 389
  to_port           = 389
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

/* SMB */
resource "aws_security_group_rule" "ads_tcp_445" {
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

resource "aws_security_group_rule" "ads_udp_445" {
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}

/* FRS */
resource "aws_security_group_rule" "ads_tcp_873" {
  type              = "ingress"
  from_port         = 873
  to_port           = 873
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

/* Global Catalog */
resource "aws_security_group_rule" "ads_tcp_3268" {
  type              = "ingress"
  from_port         = 3268
  to_port           = 3268
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

/* Ephemeral ports for RPC */
resource "aws_security_group_rule" "ads_tcp_ephemeral_ports" {
  type              = "ingress"
  from_port         = 1024
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_tcp.id}"
}

resource "aws_security_group_rule" "ads_udp_ephemeral_ports" {
  type              = "ingress"
  from_port         = 1024
  to_port           = 65535
  protocol          = "udp"
  cidr_blocks       = ["${split(",",var.ad_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ads_connection_udp.id}"
}
