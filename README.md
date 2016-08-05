# tf-aws-bastion

Creating Linux and Windows bastion instances

## Usage

```
module "bastions" {
  source                  = "../localmodules//tf-aws-bastion"

  envname                 = "example"
  envtype                 = "nonprod"

  domain                  = "example.corp.com"
  domain_password         = "somethingBetter1"
  domain_zone_id          = "${aws_route53_zone.domain.zone_id}"
  dns_servers             = "172.20.52.7,172.20.52.199"
  ad_cidr_blocks          = "172.20.52.7/32,172.20.52.199/32"

  linux_ami               = "ami-fc64078"
  windows_ami             = "ami-ec680b9f"

  allowed_bastion_cidrs   = "88.97.72.136/32,54.76.122.23/32,195.102.251.16/28,195.8.68.130/32"

  linux_bastion_asg_min   = "1"
  linux_bastion_asg_max   = "1"
  windows_bastion_asg_min = "1"
  windows_bastion_asg_max = "3"
}
```

## Variables

* `envname` - The name of the environemt or vpc that the bastions are being deployed into
* `envtype` - The type of environemt e.g. nonprod, prod
* `domain` - The domain name with which the bastions will reqister
* `domain_password` - The password for that domain for windows bastions to connect with
* `domain_zone_id` - The zone_id of the route53 zone
* `dns_servers` - The pair of dns server ipaddresses that the windows bastions use to connect to the domain
* `ad_cidr_blocks` - The CIDR blocks for the ADS instance that the windows bastions connect to
* `vpc_id` - The indentifier of the vpc
* `vpc_cidr` - The CIDR blocks for the vpc in which the bastions will be deployed
* `vpc_public_subnets` - The public subnets with to build the bastion ASGs
* `linux_ami` - The ami indentifier to be used to build linux bastions
* `windows_amu` - The ami indentifier to be used to build windows bastions
* `allowed_bastion_cidrs` - The cidr ranges allowed to connect to the bastions
* `linux_bastion_asg_min` - The minimum number of linux bastions to create
* `linux_bastion_asg_max` - The maximum number of linux bastions to create
* `windows_bastion_asg_min` - The minimum number of windows bastions to create
* `windows_bastion_asg_max` - The maximum number of windows bastions to create
* `windows_userdata` - Pass custom userdata to the windows bastion
* `linux_userdata` - Pass custom userdata to the linux bastion


## Dependencies

* [tf-aws-asg](https://git.bashton.net/Bashton/tf-aws-asg)
* [tf-aws-iam-instance-profile](https://git.bashton.net/Bashton/tf-aws-iam-instance-profile)
