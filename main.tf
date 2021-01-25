provider "aws" {
    region = "ap-south-1"
}

variable "name" {
    description = "Name the instance on deploy"
}

resource "aws_instance" "sentry" {
    ami = "ami-0a9d27a9f4f5c0efc"
    instance_type = "t2.large"
    key_name = "11am"
    security_groups = ["${aws_security_group.sentry-sg.name}"]
    user_data = "${file("user-data.sh")}"
    


    tags = {
        Name = "${var.name}"
    }
}

resource "aws_security_group" "sentry-sg" {
  name        = "sentry-sg"
  description = "Allow traffic for sentry"
  vpc_id      = "vpc-97cbd5ff"

  ingress {
   
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
   
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
