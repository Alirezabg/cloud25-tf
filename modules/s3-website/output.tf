output "website_endpoint" {
    description = "S3 website endpoint"
    value = aws_s3_bucket.this.website_endpoint
}
