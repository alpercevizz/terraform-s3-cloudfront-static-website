variable "bucket_name" {
    description = "The name of the S3 bucket"
    type = string
}

variable "aws_region" {
    description = "The AWS region to deploy resources"
    type = string
    default = "us-east-1"
}

variable "index_html_path" {
    description = "The path to the index HTML file"
    type = string
    default = "../index.html"
}