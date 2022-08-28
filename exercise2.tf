data "aws_availability_zones" "this" {}
data "aws_region" "current" {}

locals {
  count_instances = "${var.backup-deployment ? var.num_backups : 1}"
  actual_region = "${data.aws_region.current.name}"
}

resource "aws_instance" "frontend" {
  
  count                 = "${var.number_instances[terraform.workspace]}"
  availability_zone     = "${data.aws_availability_zones.this.names[count.index]}"
  depends_on            = [aws_instance.backend]
  ami                   = "${var.aws_ami[local.actual_region]}"
  instance_type         = "${var.aws_east_instance_type}"
}

resource "aws_instance" "backend" {
  
  count                 = "${var.number_instances[terraform.workspace]}"
  availability_zone     = "${data.aws_availability_zones.this.names[count.index]}"
  ami                   = "${var.aws_ami[local.actual_region]}"
  instance_type         = "${var.aws_east_instance_type}"
}