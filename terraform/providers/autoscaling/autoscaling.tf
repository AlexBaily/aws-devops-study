#Main terraform file for Auto Scaling environment


variable "region"   {}
variable "name"     {}
variable "vpc_cidr" {}
variable "cidrs"    {} 
variable "azs"      {}
variable "ami-id"   {}

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

module "compute" {
  source = "../../modules/compute"

  region  = "${var.region}"
  ami-id  = "${var.ami-id}"
  subnets = "${module.network.subnet_ids}"
  name    = "${var.name}"
  vpc-id  = "${module.network.vpc-id}"

}
