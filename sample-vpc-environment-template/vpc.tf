/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:eu-west-1:561821200142:environment/sample-vpc-environment-template

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.environment.inputs.vpc_name
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}b"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway                             = true
  enable_vpn_gateway                             = false
  enable_ipv6                                    = true
  assign_ipv6_address_on_creation                = true
  private_subnet_assign_ipv6_address_on_creation = false
  public_subnet_ipv6_prefixes                    = [0]
  private_subnet_ipv6_prefixes                   = [1]

  tags = {
    Terraform    = "true"
    Environment  = var.environment.name
    Provisioning = "via-proton"
    Owner        = "Demo-EEM-TFC"
  }
}

