output "output_region" {
  value = "${var.provider_region[terraform.workspace]}"
}