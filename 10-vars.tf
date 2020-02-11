variable "envtype" {}
variable "envname" {}
variable "customer" {}

variable "name" {
  default = ""
}

variable "domain" {
  default = "eu-west-1.compute.internal"
}

variable "public_subnets" {
  type = list(string)
}

variable "iam_instance_profile_id" {
  type = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "bastion_ami" {
  default = ""
}

variable "allowed_bastion_cidrs" {
  type = list(string)
}

variable "allowed_icmp_cidrs" {
  description = "A list of CIDRs that are allowed to send ICMP traffic to the bastion."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "bastion_asg_min" {
  default = 1
}

variable "bastion_asg_max" {
  default = 1
}

variable "bastion_userdata" {
  description = "Custom userdata for the bastion server."
  default     = ""
}

variable "bastion_userdata_template" {
  description = "Userdata template for the bastion server. Allowed: custom, puppet_masterless_mco"
  default     = "custom"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "key_name" {
  default = "bashton"
}

variable "extra_tags" {
  description = "Extra tags for the ASG"
  default     = []
}
