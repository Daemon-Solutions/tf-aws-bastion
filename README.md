# tf-aws-bastion

Creating Linux and Windows bastion instances

## Usage

```
module "bastions" {
  source                  = "../localmodules/tf-aws-bastion"

  customer                = "example_corp"
  envname                 = "example"
  envtype                 = "nonprod"

  domain                  = "example.corp.com"

  iam_instance_profile_id = "${module.bastion_instance_profile.profile_id}"

  bastion_ami             = "ami-fc64078"

  allowed_bastion_cidrs   = ["88.97.72.136/32", "54.76.122.23/32", "195.102.251.16/28", "195.8.68.130/32"]

  bastion_asg_min         = 2
  bastion_asg_max         = 2
}
```

## Variables

* `envname` - The name of the environemt or vpc that the bastions are being deployed into
* `envtype` - The type of environemt e.g. nonprod, prod
* `name` - The name of the ASG and its instances (defaults to `${envname}-${envtype}-bastion`)
* `domain` - The domain name with which the bastions will reqister
* `public_subnets` - The public subnets with to build the bastion ASGs
* `iam_instance_profile_id` - The IAM instance profile ID to use for the bastions
* `instance_type` - The instance type to use for the bastions (defaults to t2.micro)
* `bastion_ami` - The ami indentifier to be used to build linux bastions
* `allowed_bastion_cidrs` - The cidr ranges allowed to connect to the bastions
* `bastion_asg_min` - The minimum number of linux bastions to create (defaults to 1)
* `bastion_asg_max` - The maximum number of linux bastions to create (defaults to 1)
* `bastion_userdata` - Pass custom userdata to the bastions
* `bastion_userdata_template` - Use a predefined userdata script on the bastions
* `key_name` - Pass the EC2 keypair name (defaults to bashton)
* `extra_tags` - Extra tags for the ASG

## Dependencies

* [tf-aws-asg](https://git.bashton.net/Bashton/tf-aws-asg)
