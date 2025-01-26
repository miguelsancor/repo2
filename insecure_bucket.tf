resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "example-insecure-bucket"
  acl    = "public-read" # Vulnerabilidad: Permiso público

  tags = {
    Name        = "Insecure Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.insecure_bucket.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::example-insecure-bucket/*"
    }
  ]
}
POLICY
}
