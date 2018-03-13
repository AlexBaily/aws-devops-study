##Variables for the Auto Scaling Tests

#Global
region   = "eu-west-1"

#Network
name     = "ASG test"
vpc_cidr = "172.17.0.0/16"
cidrs    = "172.17.1.0/24,172.17.2.0/24,172.17.3.0/24"
azs      = "eu-west-1a,eu-west-1b,eu-west-1c"
