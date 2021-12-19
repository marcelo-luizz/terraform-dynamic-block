provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "my-sg" {
  name = "my_security_group"
  description = "Manage by Terraform with dynamic-block"
  
  dynamic "ingress" {
    for_each = var.default_ingress_rule
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  tags = {
    name = "dev-sg"
  }
}