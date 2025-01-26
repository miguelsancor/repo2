provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket        = "example-checkov-bucket"
  acl           = "public-read" # Vulnerable configuration for testing
  force_destroy = true
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow inbound traffic"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Vulnerable configuration
  }
}
