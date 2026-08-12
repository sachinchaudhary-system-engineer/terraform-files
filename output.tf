output "prod_ec2_public_ip" {
  value = module.prod-infra.ec2_instance_public_ip
}

output "prod_ec2_public_dns" {
  value = module.prod-infra.ec2_instance_public_dns
}

output "prod_ec2_private_ip" {
  value = module.prod-infra.ec2_instance_private_ip
}


output "dev_ec2_public_ip" {
  value = module.dev-infra.ec2_instance_public_ip
}

output "dev_ec2_public_dns" {
  value = module.dev-infra.ec2_instance_public_dns
}

output "dev_ec2_private_ip" {
  value = module.dev-infra.ec2_instance_private_ip
}