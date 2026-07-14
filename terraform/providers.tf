terraform {
  # https://github.com/hashicorp/terraform/releases
  required_version = ">= 1.0"
  required_providers {
    # https://github.com/hashicorp/terraform-provider-aws/releases
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.14"
    }
  }
}

provider "aws" {
  region = "us-gov-west-1"
}
