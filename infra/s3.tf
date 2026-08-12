# s3 

resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-sachin-1999"

    tags = {
        Name = "${var.env}-sachin-1999"
        Environment = var.env
    }
}

