variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "web_server_ami" {
  description = "The AMI ID to use for the manikanta instance"
  type        = string
  default     = null
}
variable "aws_profile" {
  description = "The profile"
  type        = string
  default     = "AdminAccess-699300399651"
}
