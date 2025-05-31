variable "identifier" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "allocated_storage" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "db_name" {
  default = "mydb"
}
variable "ec2_security_group_id"{}
