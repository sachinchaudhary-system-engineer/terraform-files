#v vpc

resource "aws_default_vpc" "my_vpc" {

    tags = {
        Name = "${var.env}-my_vpc"
        Environment = var.env 
    }
}

# SG

resource "aws_security_group" "my_sg" {
    name        = "${var.env}-my_sg"
    vpc_id     = aws_default_vpc.my_vpc.id
    description = "My security group"

    # ingress rule to allow SSH access
    ingress {
        from_port  = 0
        to_port   = 65535
        cidr_blocks = ["0.0.0.0/0"]
        protocol  = "tcp"
    }

    # outbound rule to allow all traffic
    egress {
        from_port = 0
        to_port = 65535
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    tags = {
        Name = "${var.env}-my_sg"
        Environment = var.env
    }
}