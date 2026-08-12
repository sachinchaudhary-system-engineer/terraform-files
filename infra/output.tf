output "ec2_instance_public_ip" {
  value = {
    for key, instance in aws_instance.my_ec2 :
    key => instance.public_ip
  }
}

output "ec2_instance_public_dns" {
  value = {
    for key, instance in aws_instance.my_ec2 :
    key => instance.public_dns
  }
}

output "ec2_instance_private_ip" {
  value = {
    for key, instance in aws_instance.my_ec2 :
    key => instance.private_ip
  }
}