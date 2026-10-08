provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami           = "ami-0bc7f2dbdcc6b5303"
    instance_type = "t3.micro"
    tags = {
        Name = "Terraform-EC2-MyInstance"
    }
    security_groups = [aws_security_group.webtraffic.id]
  
}

resource "aws_security_group" "webtraffic" {
    name = "webtraffic"
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}