variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# S3 Bucket Variables
variable "app_bucket_name" {
  description = "Name of the application S3 bucket"
  type        = string
  default     = "my-application-bucket"
}

variable "backend_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
  default     = "my-terraform-state-bucket"
}
# RDS Variables
variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "my-rds-instance"
}

variable "db_engine" {
  description = "Database engine type"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "13.7"
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "dbadmin"
  sensitive   = true
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}