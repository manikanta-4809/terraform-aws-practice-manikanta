terraform {
  backend "s3" {
    bucket = "minfy-training-manikanta-s3-4809"
    key    = "terraform.tfstate"  
    region = "ap-south-1"
  }
}
