#Terraform Network Module

variable "name" {}
variable "vpc_cidr" {}
variable "cidrs" {}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  
  tags { Name = "${var.environment_name}" } 

}

resource "aws_internet_gateway" "public" {
  vpc_id = "${vpc.vpc_id}"

  tags { Name = "${var.environment_name}" }
}


resource "aws_subnet" "public" {
  vpc_id            = "${vpc.vpc_id}"
  cidr_block        = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.cidrs))}"
}
