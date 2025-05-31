module "rds_db" {
  source             = "./modules/rds"

  identifier         = "my-app-db"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t2.micro"
  allocated_storage  = 20  
  vpc_id            = module.vpc.vpc_id
  subnet_ids         = module.vpc.subnet_ids
  ec2_security_group_id = module.ec2_backend.security_group_id

}