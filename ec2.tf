module "ec2_backend" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = module.vpc.subnet_ids[0]  
  prefix_list_id    = var.prefix_list_id
  key_name          = var.key_name
  instance_type     = var.instance_type
  allowed_ssh_cidr  = var.allowed_ssh_cidr
}

variable "prefix_list_id" {
  description = "ID of the AWS-managed prefix list for egress"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH in"
  type        = string
}