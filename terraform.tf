provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
terraform {
  backend "s3" {
    bucket = "geiyer-terraform-artifacts-bucket"
    key    = "cloudwatch-demo/terraform.tfstate"
    region = "us-east-1"
  }
}