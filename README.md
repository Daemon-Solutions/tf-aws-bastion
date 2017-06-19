# tf-aws-bastion

Creating Linux and Windows bastion instances

## Usage

```
module "bastions" {
  source                  = "../localmodules//tf-aws-bastion"

  customer                = "example_corp"
  envname                 = "example"
  envtype                 = "nonprod"

  domain                  = "example.corp.com"
  dns_servers             = "172.20.52.7,172.20.52.199"

  bastion_ami             = "ami-fc64078"

  allowed_bastion_cidrs   = "88.97.72.136/32,54.76.122.23/32,195.102.251.16/28,195.8.68.130/32"

  bastion_asg_min   = "1"
  bastion_asg_max   = "1"
}
```

## Variables

* `envname` - The name of the environemt or vpc that the bastions are being deployed into
* `envtype` - The type of environemt e.g. nonprod, prod
* `domain` - The domain name with which the bastions will reqister
* `dns_servers` - The pair of dns server ipaddresses that the windows bastions use to connect to the domain
* `public_subnets` - The public subnets with to build the bastion ASGs
* `instance_type` - The instance type to use for the bastions (defaults to t2.micro)
* `bastion_ami` - The ami indentifier to be used to build linux bastions
* `allowed_bastion_cidrs` - The cidr ranges allowed to connect to the bastions
* `bastion_asg_min` - The minimum number of linux bastions to create
* `bastion_asg_max` - The maximum number of linux bastions to create
* `bastion_userdata` - Pass custom userdata to the windows bastion
* `key_name` - Pass the EC2 keypair name (defaults to bashton)


## Dependencies

* [tf-aws-asg](https://git.bashton.net/Bashton/tf-aws-asg)
* [tf-aws-iam-instance-profile](https://git.bashton.net/Bashton/tf-aws-iam-instance-profile)
