module "dev-infra" {
    source = "./infra"
    env = "dev"

    key_name = "dev"
    ec2_ami = "ami-0b6d9d3d33ba97d99"

    instance_types = {
        server-1 = "t3.micro"
        server-2 = "t3.small"
    }

}



module "prod-infra" {
    source = "./infra"
    env = "prod"

    key_name = "prod"
    ec2_ami = "ami-0b6d9d3d33ba97d99"

    instance_types = {
        server-1 = "t3.micro"
        server-2 = "t3.small"
        server-3 = "t3.small"
    }
}