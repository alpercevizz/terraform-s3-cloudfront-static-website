resource "aws_s3_object" "index" {
    source = var.index_html_path
    bucket = aws_s3_bucket.static_site.bucket
    key = "index.html"
    content_type = "text/html"
    depends_on = [aws_s3_bucket.static_site]
}