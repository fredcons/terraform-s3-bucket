terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.21.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "static_website" {
  source = "./modules/static_website"

  bucket_name = var.bucket_name

  tags = {
    managed-by  = "terraform"
    environment = var.environment
  }
}
