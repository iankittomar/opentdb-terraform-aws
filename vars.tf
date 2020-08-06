# Terrafrom supports various types of variables
# String
# list
# map

variable "ami" {
  default = "ami-0d359437d1756caa8" //for Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
}

variable "instance_type" {
  default = "t2.medium"
}

variable "aws_region" {
  default = "eu-central-1" //frankfurt
}

variable "instance_count" {
  default = "1"
}

variable "sg_b4u" {
  default = "sg-011bb40eed8f27434"
}
#variable "vpc_cidr" {


# default = "190.160.0.0/16"


# }


#variable "subnets_cidr" {


#type = list
#default = ["10.20.1.0/24","10.20.2.0/24"]
#}

