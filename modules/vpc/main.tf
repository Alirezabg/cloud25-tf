data "aws_vpc" "default"{
    default = true
}

data "aws_subnets" "default"{
    filter {
        name = "vpc-id"
        value =[data.aws_vpc.default.id]
    }
}