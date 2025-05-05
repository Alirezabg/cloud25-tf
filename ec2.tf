module "ec2_backend" {
  source           = "./modules/ec2"
  vpc_id           = module.cloud_vpc.vpc_id
  subnet_id        = module.cloud_vpc.public_subnets[0]
  allowed_ssh_cide = var.allowed_ssh_cide
  prefix_list_id   = var.prefix_list_id
  instance_type    = var.instance_type
  key_name         = var.key_name
}
