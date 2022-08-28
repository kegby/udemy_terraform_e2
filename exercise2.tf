data "aws_availability_zones" "this" {}

locals {
  count_instances = "${var.backup-deployment ? var.num_backups : 1}"
}

resource "aws_instance" "frontend_east" {
  
  count                 = "${local.count_instances}"
  availability_zone     = "${data.aws_availability_zones.this.names[count.index]}"
  depends_on            = [aws_instance.backend_east]
  ami                   = "${var.aws_east_ami}"
  instance_type         = "${var.aws_east_instance_type}"
}

resource "aws_instance" "backend_east" {
  
  count                 = "${local.count_instances}"
  availability_zone     = "${data.aws_availability_zones.this.names[count.index]}"
  ami                   = "${var.aws_east_ami}"
  instance_type         = "${var.aws_east_instance_type}"
}