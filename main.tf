module "dev-infra" {
  source = "./infra"
  env    = "dev"

  key_name = "dev"
  ec2_ami  = "ami-01a00762f46d584a1"

  instance_types = {
    server-1 = "t3.micro"
    server-2 = "t3.small"
  }

}



module "prod-infra" {
  source = "./infra"
  env    = "prod"

  key_name = "prod"
  ec2_ami  = "ami-01a00762f46d584a1"

  instance_types = {
    server-1 = "t3.micro"
    server-2 = "t3.small"
    server-3 = "t3.small"
  }
}
