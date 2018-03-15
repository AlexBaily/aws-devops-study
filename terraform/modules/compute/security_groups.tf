#Security groups for Node JS and ELB

variable vpc-id {}

resource "aws_security_group" "asg_elb_sg" {
  name        = "asg_elb_sg"
  description = "NodeJS ASG Elb Security Group"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol     = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "asg_sg" {
  name        = "asg_sg"
  description = "NodeJS ASG SG"
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol         = "tcp"
    security_groups = ["${aws_security_group.asg_elb_sg.id}"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
