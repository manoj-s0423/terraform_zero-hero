provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""

  
}

resource "aws_s3_bucket" "Terraform_S3_Manoj" {
    bucket = "terraform-s3-manoj"
    acl    = "private"

    tags = {
        Name        = "Terraform-S3-MyBucket"
        Environment = "Dev"
    }
  
}