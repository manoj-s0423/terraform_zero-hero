provider "aws" {
    region = "us-east-1"
  
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

resource "aws_instance" "my_instance" {
    ami           = "ami-0303e2e4a29f041a3 (64-bit (x86))"
    instance_type = "t3.micro"
    tags = {
        Name = "Terraform-EC2-MyInstance"
    }
    vpc_security_group_ids = [aws_security_group.webtraffic.id]
  
}