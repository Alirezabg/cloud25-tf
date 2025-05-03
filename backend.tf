terraform {
  backend "s3" {
    bucket         = "cyf-cloud"
    key            = "envs/prod/terraform.tfstate"
    region         = "eu-west-1"         #  Ireland
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}