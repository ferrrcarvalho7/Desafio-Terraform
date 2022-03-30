terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.8.0, < 4.8.0"
    }
  }
}
provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "web_key_terraform" {
  key_name   = "web_key_terraform"
  public_key = var.public_key
}
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.web_key_terraform.key_name
  vpc_security_group_ids = [aws_security_group.allow_HTTPS_SSH.id]
  credit_specification {
    cpu_credits = "standart"
  }
  user_data = <<EOF
#!/bin/bash
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
  tags = {
    Name = "Terraform_Test"
  }
}
resource "aws_security_group" "allow_HTTPS_SSH" {
  name        = "allow_HTTPS_SSH"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH Port 22 allowed from any IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP Port allowed from any IP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_HTTPS-SSH"
  }
}