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

variable "aws_east_instance_type" {
  default = "t2.micro"
}
