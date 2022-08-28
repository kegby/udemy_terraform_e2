variable "backup-deployment" {
  default = true
}

variable "num_backups" {
  type    = number
  default = 2
}

variable "aws_east_ami" {
  default = "ami-66506c1c"
}

variable "aws_ami" {
  type = map
  default = {
    us-east-1 = "ami-66506c1c"
    us-west-1 = "ami-07585467"
    }
}

variable "aws_east_instance_type" {
  default = "t2.micro"
}

variable "provider_region" {
  type = map
  
  default = {
    staging    = "us-west-1"
    production = "us-east-1"
  }

}

variable "number_instances" {
  type = map
  
  default = {
    staging    = 1
    production = 2
  }

}