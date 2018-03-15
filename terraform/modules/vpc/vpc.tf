#Terraform Network Module

variable "environment_name" {}
variable "vpc_cidr"         {}
variable "cidrs"            {}
variable "azs"              {}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  
  tags { Name = "${var.environment_name}" } 

}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags { Name = "${var.environment_name}" }
}


resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.cidrs))}"

  tags { Name = "${var.environment_name} ${element(split(",", var.azs), count.index)}" }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.public.id}"
  }

}

output "vpc-id"     { value = "${aws_vpc.vpc.id}" }
output "subnet_ids" { value = "${join(",", aws_subnet.public.*.id)}" }
