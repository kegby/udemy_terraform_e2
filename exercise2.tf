data "aws_availability_zones" "us-east-1" {
  provider = aws.us-east-1
}

data "aws_availability_zones" "us-west-1" {
  provider = aws.us-west-1
}

locals {
  count_instances = "${var.backup-deployment ? var.num_backups : 1}"
}

resource "aws_instance" "frontend_east" {
  provider              = aws.us-east-1
  count                 = "${local.count_instances}"
  availability_zone     = "${data.aws_availability_zones.us-east-1.names[count.index]}"
  depends_on            = [aws_instance.backend_east]
  ami                   = "${var.aws_east_ami}"
  instance_type         = "${var.aws_east_instance_type}"
}

resource "aws_instance" "backend_east" {
  provider              = aws.us-east-1
  count                 = "${local.count_instances}"
  availability_zone     = "${data.aws_availability_zones.us-east-1.names[count.index]}"
  ami                   = "${var.aws_east_ami}"
  instance_type         = "${var.aws_east_instance_type}"
}