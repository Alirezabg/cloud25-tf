resource "aws_security_group" "this"{
    name = "ec2-backend"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.allowed_ssh_cidr]
    }
     ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        prefix_list_id = [var.prefix_list_id]
    }
}

data "aws_ami" "amazon_linux"{
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        value = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "this"{
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.this.id]
    key_name =var.key_name
    tags = {
        Name = "ec2-backend"
    }
}
