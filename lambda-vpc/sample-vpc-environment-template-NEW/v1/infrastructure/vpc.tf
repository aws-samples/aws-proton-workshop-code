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

