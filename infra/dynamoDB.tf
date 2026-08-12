resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "${var.env}-dynamodb-table-1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LOCKID"

  attribute {
    name = "LOCKID"
    type = "S"
  }

  

  tags = {
    Name        = "${var.env}-dynamodb-table-1"
    Environment = var.env
  }
}