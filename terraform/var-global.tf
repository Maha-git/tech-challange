variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_account_id" {}

variable "region" {
  default = "eu-west-1"
}

variable "vpcid" {
  default = "vpc-c4f2b0a2"
}

variable "subnetid" {
  default = "subnet-0154d067"
}

variable "permitted_ips" {
  default = "51.179.154.252/32"
}

variable "host-iam-role" {
  default = "EC2Access"
}

variable "email-address" {}
