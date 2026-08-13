# key pair

resource "aws_key_pair" "my_key" {
    key_name = "${var.key_name}-key"
    public_key = file("/var/lib/jenkins/id_ed25519.pub")
}

# ec2

resource "aws_instance" "my_ec2" {

    for_each = var.instance_types

    ami = var.ec2_ami
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    key_name = aws_key_pair.my_key.key_name

    root_block_device {
    volume_size = 10
    volume_type = "gp3"
    }

    tags = {
        Name = "${var.env}-server"
        Environment = var.env
    }

}
