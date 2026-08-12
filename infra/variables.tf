variable "env" {
    description = "resource name"
    type        = string
}


variable "key_name" {
    description = "key pair name"
    type        = string
}

variable "ec2_ami" {
    description = "for instance AMI"
    type        = string
}


variable "instance_types" {
    description = "instance type"
    type        = map(string)
}






