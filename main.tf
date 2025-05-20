provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "demo-bucket-anushka26"
    key    = "state.tfstate"
    region = "us-east-1"
  }
}

resource "aws_security_group" "allow_http" {
 
  name = "allow_http"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
}
 
resource "aws_instance" "app_server" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2
  instance_type = "t2.micro"

  depends_on = [ aws_security_group.allow_http ]
  security_groups = [ "allow_http" ]

  user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
 
      # Install Git
      sudo yum install -y git
      
      # Install Node.js (LTS version)
      curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
      sudo yum install -y nodejs
      sudo npm install -g express
      
      # Clone your repository and start the application
      sudo git clone https://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@github.com/jAnushka26/jenkins-pipeline-2.0.git
      sudo cd /
      sudo cd jenkins-pipeline-2.0
      sudo cd node_app
      sudo node index.js

  EOF

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
