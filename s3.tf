resource "aws_s3_bucket" "static_site" {
    bucket = var.bucket_name
    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

resource "aws_s3_bucket_policy" "allow_cloudfront_access" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudFrontServicePrincipalReadOnly"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_site.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.cdn.arn
          }
        }
      }
    ]
  })
}


resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.static_site.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}