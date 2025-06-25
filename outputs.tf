output "bucket_name" {
    description = "The bucket name of the static website"
    value = aws_s3_bucket.static_site.bucket
}

output "cloudfront_domain" {
    description = "The domain name of the static website"
    value = aws_cloudfront_distribution.cdn.domain_name
}