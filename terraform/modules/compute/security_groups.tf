#Security groups for Node JS and ELB


resource "aws_security_group" "asg_elb_sg" {
  name        = "asg_elb_sg"
  description = "NodeJS ASG Elb Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocl     = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocl     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "asg_sg" {
  name        = "asg_sg"
  description = "NodeJS ASG SG"

  ingress {
    from_port       = 80
    to_port         = 80
    protocl         = "tcp"
    security_groups = "${aws_security_group.asg_elb.name}"
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocl     = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
