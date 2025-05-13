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

  user_data = file("setup.sh")

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}