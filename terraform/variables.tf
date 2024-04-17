variable "ec2_ami" {
  type = map(any)
  default = {
    eu-west-2 = "ami-0beb6fc68811e5682"
  }
}

variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}
