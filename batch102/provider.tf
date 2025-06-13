
terraform {
    backend "s3" {
        bucket = "terraform-state-bucket-opaliwal"
        key    = "terraform-101/terraform.tfstate"
        region = "us-east-1"
        profile = "default"
    } 

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

provider "aws" {
  profile = "default"
}