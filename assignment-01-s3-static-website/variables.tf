variable "aws_region" {
  description = "aws region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "aws cli profile to use"
  type        = string
  default     = "AdminAccess-699300399651"
}

variable "bucket_name" {
  description = "name of the s3 bucket"
  type        = string
  default     = "manikanta4809-2025"  
}