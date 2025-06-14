provider "aws" {
  region  = "ap-south-1"
  profile = "AdminAccess-699300399651"
}
 data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
resource "aws_vpc" "manikanta" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "manikanta-vpc"
  }
}
resource "aws_internet_gateway" "manikanta" {
  vpc_id = aws_vpc.manikanta.id
  tags = {
    Name = "manikanta-ig"
  }
}
resource "aws_subnet" "manikanta" {
  vpc_id                  = aws_vpc.manikanta.id
  cidr_block             = "10.0.1.0/24"
  availability_zone      = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "manikanta-subnet"
  }
}
resource "aws_route_table" "manikanta" {
  vpc_id = aws_vpc.manikanta.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.manikanta.id
  }
  tags = {
    Name = "manikanta-route-table"
  }
}
resource "aws_route_table_association" "manikanta" {
  subnet_id      = aws_subnet.manikanta.id
  route_table_id = aws_route_table.manikanta.id
}
resource "aws_security_group" "manikanta_sg" {
  name        = "manikanta-sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.manikanta.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "manikanta-sg"
  }
}
resource "aws_instance" "manikanta" {
  ami                         = "ami-0b09627181c8d5778"  
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.manikanta.id
  vpc_security_group_ids      = [aws_security_group.manikanta_sg.id]
  associate_public_ip_address = true
  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f) - Manikanta</h1>" > /var/www/html/index.html
EOF
  tags = {
    Name = "manikanta-ec2"
  }
  
}                                                                   