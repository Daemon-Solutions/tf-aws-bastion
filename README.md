# tf-aws-bastion

Creating Linux and Windows bastion instances

# Terraform Version Compatibility
| Module version | Terraform version |
|----------------|-------------------|
| 2.x.x          | 0.12.x            |
| <= 1.x.x       | 0.11.x            |

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
  allowed_icmp_cidrs      = ["0.0.0.0/0"]

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
* `allowed_bastion_cidrs` - The cidr ranges allowed to connect to the bastions (defaults to allowing 0.0.0.0/0 unless overridden).
* `allowed_icmp_cidrs` - The cidr ranges allowed to send ICMP traffic to the bastions
* `bastion_asg_min` - The minimum number of linux bastions to create (defaults to 1)
* `bastion_asg_max` - The maximum number of linux bastions to create (defaults to 1)
* `bastion_userdata` - Pass custom userdata to the bastions
* `bastion_userdata_template` - Use a predefined userdata script on the bastions
* `key_name` - Pass the EC2 keypair name (defaults to bashton)
* `extra_tags` - Extra tags for the ASG

## Dependencies

* [tf-aws-asg](https://git.bashton.net/Bashton/tf-aws-asg)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.3.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.4 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion"></a> [bastion](#module\_bastion) | git::https://gitlab.com/claranet-pcp/terraform/aws/tf-aws-asg.git | v2.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.bastion_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bastion_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [null_resource.bastion_asg](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_subnet.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [template_file.bastion_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_bastion_cidrs"></a> [allowed\_bastion\_cidrs](#input\_allowed\_bastion\_cidrs) | n/a | `list(string)` | n/a | yes |
| <a name="input_allowed_icmp_cidrs"></a> [allowed\_icmp\_cidrs](#input\_allowed\_icmp\_cidrs) | A list of CIDRs that are allowed to send ICMP traffic to the bastion. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-west-1"` | no |
| <a name="input_bastion_ami"></a> [bastion\_ami](#input\_bastion\_ami) | n/a | `string` | `""` | no |
| <a name="input_bastion_asg_max"></a> [bastion\_asg\_max](#input\_bastion\_asg\_max) | n/a | `number` | `1` | no |
| <a name="input_bastion_asg_min"></a> [bastion\_asg\_min](#input\_bastion\_asg\_min) | n/a | `number` | `1` | no |
| <a name="input_bastion_userdata"></a> [bastion\_userdata](#input\_bastion\_userdata) | Custom userdata for the bastion server. | `string` | `""` | no |
| <a name="input_bastion_userdata_template"></a> [bastion\_userdata\_template](#input\_bastion\_userdata\_template) | Userdata template for the bastion server. Allowed: custom, puppet\_masterless\_mco | `string` | `"custom"` | no |
| <a name="input_customer"></a> [customer](#input\_customer) | n/a | `any` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | `"eu-west-1.compute.internal"` | no |
| <a name="input_envname"></a> [envname](#input\_envname) | n/a | `any` | n/a | yes |
| <a name="input_envtype"></a> [envtype](#input\_envtype) | n/a | `any` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags for the ASG | `list` | `[]` | no |
| <a name="input_iam_instance_profile_id"></a> [iam\_instance\_profile\_id](#input\_iam\_instance\_profile\_id) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"bashton"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | n/a | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name) | n/a |
| <a name="output_bastion_sg"></a> [bastion\_sg](#output\_bastion\_sg) | n/a |
<!-- END_TF_DOCS -->