#This module will be used for the EC2 ASGs

variable "region"  = {}
variable "ami-id"  = {}
variable "subnets" = {}

data "aws_ami" "nodejs" {

}

resource "aws_launch_configuration" "as_conf" {


}

resource "aws_autoscaling_group" "as_group" {


}

resource "aws_autoscaling_policy" "as_policy" {

}
