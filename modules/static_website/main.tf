resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = var.tags

  versioning {
    enabled = true
  }
}

#resource "aws_s3_bucket_object" "index" {
#  bucket = var.bucket_name
#  key    = "index.html"
#  content_type = "text/html"
#  source = "${path.module}/assets/index.html"
#}
