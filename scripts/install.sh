#!/bin/bash
# Install node.js
cd /tmp
curl -sL https://rpm.nodesource.com/setup_10.x
sudo bash setup_10.x
sudo yum install -y nodejs
# Install vue
sudo npm install -g vue-cli
# Create project folder
mkdir -p $HOME/public_html
cd $HOME/public_html
#sudo yum install -y expect
#vue init webpack myvue-project
#cd myvue-project
#npm run build
# Install nginx
sudo yum install -y epel-release
sudo yum install -y nginx
sudo systemctl start nginx
