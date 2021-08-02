provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-shreya"
    acl = "private" 
    force_destroy = "true"
    tags = {
        Name = "My Bucket"
        Environment = "Dev"
    }
}

terraform {
  backend "s3" {
    bucket = "terraform-shreya"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}