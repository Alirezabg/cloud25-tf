variable "bucket_name" {
    description = "Should be globally unique name for the s3 bucket"
    type = string
}

variable "region" {
    description = " AWS region where the bucket will live"
    type = string 
    default = "eu-west-1"
}
