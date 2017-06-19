variable "envtype" {}
variable "envname" {}
variable "customer" {}

variable "domain" {
  default = "eu-west-1.compute.internal"
}

variable "dns_servers" {
  type    = "list"
  default = ["127.0.0.1", "AmazonProvidedDNS"]
}

variable "public_subnets" {
  type = "list"
}

variable "bastion_ami" {
  default = ""
}

variable "allowed_bastion_cidrs" {
  type = "list"
}

variable "bastion_asg_min" {
  default = 0
}

variable "bastion_asg_max" {
  default = 0
}

variable "bastion_userdata" {
  default = ""
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_zones" {
  default = {
    eu-west-1 = "eu-west-1a,eu-west-1b,eu-west-1c"
  }
}

variable "key_name" {
  default = "bashton"
}
