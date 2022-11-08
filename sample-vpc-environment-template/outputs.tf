/*
This file is managed by AWS Proton. Any changes made directly to this file will be overwritten the next time AWS Proton performs an update.

To manage this resource, see AWS Proton Resource: arn:aws:proton:eu-west-1:561821200142:environment/sample-vpc-environment-template

If the resource is no longer accessible within AWS Proton, it may have been deleted and may require manual cleanup.
*/

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "subnet_id" {
  value = one(module.vpc.private_subnets) # there is a known issue with terraform lists as outputs for proton
}

output "security_group_id" {
  value = module.vpc.default_security_group_id
}