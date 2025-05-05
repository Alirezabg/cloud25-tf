variable "identifier" {
  description = "Name identifier for the RDS resources"
  type        = string
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
}

variable "db_password" {
  description = "Master password for RDS (store securely!)"
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance class for free-tier"
  type        = string
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "Storage in GB (max free-tier)"
  type        = number
  default     = 20
}