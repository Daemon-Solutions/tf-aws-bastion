module "iam_profile_bastion" {
  source        = "../tf-aws-iam-instance-profile"
  name          = "${var.envname}-${var.envtype}-iam-profile-bastion"
  ec2_describe  = "1"
  ec2_attach    = "1"
  rds_readonly  = "1"
  r53_update    = "1"
  cw_readonly   = "1"
  s3_readonly   = "1"
}
