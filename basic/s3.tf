provider "aws" {
  region = "ap-south-1"
  profile = "AdminAccess-699300399651"
}
 
resource "aws_s3_bucket" "minfy_bucket" {
  bucket = "minfy-training-manikanta-s3-4809"
}
terraform {
  backend "s3" {
    bucket = "minfy-training-manikanta-s3-4809"
    key    = "terraform.tfstate"  
    region = "ap-south-1"
  }
}
