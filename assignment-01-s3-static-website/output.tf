output "website_url" {
  description = "url of the static website"
  value       = "http://${aws_s3_bucket.website_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}