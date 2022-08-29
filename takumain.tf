# This is my sample network vpc
# I will provide the variable file, and .tvars file
# I have already configure my aws credentials into my local 
# and will not hard code it here for security reasons.
# other resources that could be included: routtables, routes, security groups
# Internet Gatway, NAT Gateway, etc

resource "aws_vpc" "takutfvpc" {
    cidr_block = var.cidr_vpc # must use the name of the variable after var.
    tags = {
        Name ="takutfvpc"
    }
}

# This is a private subnet
resource "aws_subnet" "prvSN" {
  vpc_id     = aws_vpc.takutfvpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "prvSN"
  }
}


# Bastion instance
resource "aws_instance" "Bastiontf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = "Baskey"
  subnet_id      = aws_subnet.prvSN.id

  user_data = <<-EOF
              #!/bin/bash 
              yum update -y 
              yum install httpd -y 
              cd /var/www/html 
              echo "Taku sample user data for my bastion host" > index.html 
              service httpd start 
              chkconfig httpd on
              EOF
  tags = {
    Name = "Bastiontf"
  }
}