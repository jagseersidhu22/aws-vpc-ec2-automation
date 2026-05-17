terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "aws-jagseer-statefile-bucket"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
    
  }

  
  }
provider "aws" {
  region = var.DEFAULT_REGION
  access_key = var.ACCESS_KEY
    secret_key = var.SECRET_ACCESS_KEY
}


resource "aws_s3_bucket" "aws_bucket1" {
    bucket = "aws-jagseer-bucket"
}