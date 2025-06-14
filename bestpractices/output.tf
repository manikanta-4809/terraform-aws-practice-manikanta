output "website_url" {
  value       = "http://${aws_instance.manikanta.public_ip}"
  description = "Open this in your browser to see"
}