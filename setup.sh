#!/bin/bash
# Update the package manager
sudo yum update -y
 
# Install Git
sudo yum install -y git
 
# Install Node.js (LTS version)
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs
 
# Verify installations
git --version
node -v
npm -v
 
# Clone your repository and start the application
git clone https://github.com/your-username/your-repo.git
cd your-repo
node index.js