provider "aws" {
  region = "us-east-1"
}
 
terraform {
  backend "s3" {
    bucket = "demo-bucket-anushka26"
    key    = "terraform/state.tfstate"
    region = "us-east-1"
  }
}
 
resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "demo-bucket-anushka26"
}
 
resource "aws_instance" "app_server" {
  ami           = "ami-0f88e80871fd81e91" # Amazon Linux 2
  instance_type = "t2.micro"
 
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y git
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
    yum install -y nodejs
git clone https://github.com/jAnushka26/jenkins-pipeline-2.0.git
    cd node_app
    node index.js
  EOF
 
  tags = {
    Name = "Terraform-EC2-Instance"
  }
}