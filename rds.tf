module "rds_db" {
  source             = "./modules/rds"

  identifier         = "my-app-db"
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t2.micro"
  allocated_storage  = 20  

}