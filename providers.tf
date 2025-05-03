provider "aws" {
  region = var.aws_region
  # Authentication will use your AWS CLI credentials by default
  # You can also specify access keys directly (not recommended):
  # access_key = "your-access-key"
  # secret_key = "your-secret-key"
}