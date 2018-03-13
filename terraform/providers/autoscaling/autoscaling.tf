#Main terraform file for Auto Scaling environment


variable "region"   {}
variable "name"     {}
variable "vpc_cidr" {}
variable "cidrs"    {} 
variable "azs"      {}

provider "aws" {
  region = "${var.region}"
}


module "network" {
  source = "../../modules/vpc"

  environment_name = "${var.name}"
  vpc_cidr         = "${var.vpc_cidr}"
  azs              = "${var.azs}"
  cidrs            = "${var.cidrs}"

}
