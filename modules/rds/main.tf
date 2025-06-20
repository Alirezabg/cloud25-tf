resource "aws_db_subnet_group" "this"{
    name = "${var.identifier}-subnet-group"
    subnet_ids =  var.subnet_ids
    tags = {
    Name = "${var.identifier}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.identifier}-sg"
  description = "Deny all public access to RDS"
  vpc_id      = var.vpc_id


  ingress {
    description      = "Allow EC2 access to DB"
    from_port        = 3306             
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [var.ec2_security_group_id]
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.identifier}-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier             = var.identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false

  username            = random_string.db_username.result
  password            = random_password.db_password.result
  skip_final_snapshot = true

  tags = {
    Name = var.identifier
  }
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "random_string" "db_username" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_secretsmanager_secret" "rds" {
  name = "${var.identifier}-creds"
}

resource "aws_secretsmanager_secret_version" "rds" {
  secret_id     = aws_secretsmanager_secret.rds.id
  secret_string = jsonencode({
    username = random_string.db_username.result
    password = random_password.db_password.result
    host     = aws_db_instance.this.address
    port     = aws_db_instance.this.port
    dbname   = aws_db_instance.this.db_name
  })
}