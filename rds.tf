module "rds_db" {
  source             = "./modules/rds"

  identifier         = "my-app-db"
  engine             = "mysql"
  engine_version     = "8.0.34"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20  
  vpc_id            = module.vpc.vpc_id
  subnet_ids         = module.vpc.subnet_ids
  ec2_security_group_id = module.ec2_backend.security_group_id

}