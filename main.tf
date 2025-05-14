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
 
resource "aws_instance" "app_server" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2
  instance_type = "t2.micro"

  user_data = file("setup.sh")

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
