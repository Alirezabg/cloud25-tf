data "aws_vpc" {
    default = true
}

data "aws_subnets" "default"{
    filter {
        name = "vpc_id"
        values = [data.aws_vpc.default.id]
    }
}

resource "aws_db_subnet_group" "this"{
    name = "${var.identifier}-subnet-group"
    subnet_ids = data.aws_subnets.default.ids
    tags = {
    Name = "${var.identifier}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.identifier}-sg"
  description = "Deny all public access to RDS"
  vpc_id      = data.aws_vpc.default.id

  # No ingress = no one (public or internal) can connect by default
  ingress = []

  # Allow all outbound (e.g., for backups)
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

  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true

  tags = {
    Name = var.identifier
  }
}