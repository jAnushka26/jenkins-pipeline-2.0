#!/bin/bash
# Update the package manager
sudo yum update -y
 
# Install Git
sudo yum install -y git
 
# Install Node.js (LTS version)
# curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
# sudo yum install -y nodejs
# sudo yum install nodejs -y
# sudo npm install express -y
 
# Verify installations
# git --version
# node -v
# npm -v
 
# Clone your repository and start the application
sudo git clone https://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@github.com/jAnushka26/jenkins-pipeline-2.0.git
sudo cd jenkins-pipeline-2.0
sudo cd node_app
sudo yum install nodejs -y
sudo npm install express
sudo node index.js
