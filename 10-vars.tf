
variable "envtype"                 {}
variable "envname"                 {}
variable "customer"                {}
variable "domain"                  {}
variable "domain_password"         {}
variable "domain_zone_id"          {}
variable "dns_servers"             {}
variable "ad_cidr_blocks"          {}

variable "vpc_id"                  {}
variable "vpc_cidr"                {}
variable "vpc_public_subnets"      {}

variable "linux_ami"               { default = "" }
variable "windows_ami"             { default = "" }

variable "allowed_bastion_cidrs"   {}

variable "linux_bastion_asg_min"   { default = 0 }
variable "linux_bastion_asg_max"   { default = 0 }
variable "windows_bastion_asg_min" { default = 0 }
variable "windows_bastion_asg_max" { default = 0 }

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_zones" {
  default = "eu-west-1a,eu-west-1b,eu-west-1c"
}
