#This module will be used for the EC2 ASGs

variable "region"  {}
variable "ami-id"  {}
variable "subnets" {}
variable "name"    {} 

data "aws_ami" "nodejs" {
  filter {
    name   = "image-id"
    values = ["${var.ami-id}"]
  }
}

resource "aws_launch_configuration" "as_conf" {
  name            = "${var.name} launch configuration"
  image_id        = "${data.aws_ami.nodejs.id}"
  instance_type   = "t2.nano"
  security_groups = ["${aws_security_group.asg_sg.id}"]

}

resource "aws_autoscaling_group" "as_group" {
  vpc_zone_identifier       = ["${var.subnets}"]
  name                      = "${var.name} ASG"
  min_size                  = 1
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.as_conf.name}"

}

#resource "aws_autoscaling_policy" "as_policy" {

#}
