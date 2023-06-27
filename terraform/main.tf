# 요구사항 작성
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

variable "account-id" {
  type    = string
  default = "138191045074"
}