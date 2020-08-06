# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  shared_credentials_file = "/home/ankit/.aws/credentials"
  profile                 = "rancher"
}