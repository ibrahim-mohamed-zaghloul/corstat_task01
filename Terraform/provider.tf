terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "corstat"

    workspaces {
      name = "corstat_server"
    }
  }
}

provider "aws" {
  region = var.region
}
