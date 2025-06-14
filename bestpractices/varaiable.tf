variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/24"
}
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "minfy-training-manikanta-4809"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "key_name" {
  description = "AWS Key Pair name"
  type        = string
  default     = "minfy-training-manikanta-4809-key"
}