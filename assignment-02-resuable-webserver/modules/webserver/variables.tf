variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type (e.g., t2.micro)"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}
variable "security_group" {
  description = "Deprecated: Use security_group_ids instead"
  type        = string
  default     = null
}
variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}
