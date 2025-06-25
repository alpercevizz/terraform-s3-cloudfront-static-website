resource "aws_cloudfront_distribution" "cdn" {
    origin {
        domain_name = aws_s3_bucket.static_site.bucket_regional_domain_name
        origin_id = "s3-origin"
        origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
    }

    enabled = true
    is_ipv6_enabled = true
    default_root_object = "index.html"

    default_cache_behavior {
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"] 
        target_origin_id = "s3-origin" 
        viewer_protocol_policy = "redirect-to-https" 

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }
    }

    price_class = "PriceClass_100"
    restrictions {
        geo_restriction {
            restriction_type = "none"
            locations = []

        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
        minimum_protocol_version = "TLSv1.2_2021"
        ssl_support_method = "sni-only"
    }
}

resource "aws_cloudfront_origin_access_control" "oac" {
    name = "oac-for-static-site"
    origin_access_control_origin_type = "s3"
    signing_behavior = "always"
    signing_protocol = "sigv4"
}