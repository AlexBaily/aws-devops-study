#This module will be used for the EC2 ASGs

variable "region"  = {}
variable "ami-id"  = {}
variable "subnets" = {}
variable "ami-id"  = {}
variable "sg-id" = {}

data "aws_ami" "nodejs" {
  filter {
    name   = "image-id"
    values = "${var.ami-id}"
  }
}

resource "aws_launch_configuration" "as_conf" {
  name            = "nodejs_config"
  image_id        = "${data.aws_ami.nodejs.id}"
  instance_type   = t2.nano
  security_groups = ["${var.sg-id}"]

  

}

resource "aws_autoscaling_group" "as_group" {


}

resource "aws_autoscaling_policy" "as_policy" {

}
