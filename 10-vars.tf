
variable "envtype"               {}
variable "envname"               {}

variable "domain"                {}
variable "domain_password"       {}
variable "domain_zone_id"        {}
variable "dns_servers"           {}
variable "ad_cidr_blocks"        {}

variable "linux_ami"             { default = "" }
variable "windows_ami"           { default = "" }

variable "allowed_bastion_cidrs" {}

variable "linux_bastion_asg_min" { default = 0 }
variable "linux_bastion_asg_max" { default = 0 }
variable "windows_bastion_asg_min" { default = 0 }
variable "windows_bastion_asg_max" { default = 0 }

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_zones" {
  default = {
    eu-west-1 = "eu-west-1a,eu-west-1b,eu-west-1c"
  }
}
