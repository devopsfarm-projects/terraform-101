terraform {
  backend "s3" {
    bucket = "df-tfstate-terraform-101"
    key    = "my_app"
    region = "us-east-1"
  }
}
