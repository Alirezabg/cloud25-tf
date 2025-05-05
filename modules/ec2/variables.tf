variable "vpc_id"{
    type = string
}

variable "subnet_id"{
    type = string
}

variable "prefix_list_id"{
    type = string
}

variable "key_name" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "allowed_ssh_cide" {
    type = string
}