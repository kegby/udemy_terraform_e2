provider "aws" {
    region     = "${var.provider_region[terraform.workspace]}"
    
  }
