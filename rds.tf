module "rds" {
  source      = "./modules/rds"
  identifier  = var.identifier
  db_username = var.db_username
  db_password = var.db_password
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

variable "aws_region" {
  description = "AWS region for RDS"
  type        = string
  default     = "eu-west-1"
}

variable "identifier" {
  description = "Identifier prefix for RDS resources"
  type        = string
  default     = "free-tier-db"
}

variable "db_username" {
  description = "Master DB username"
  type        = string
}

variable "db_password" {
  description = "Master DB password (store securely!)"
  type        = string
}