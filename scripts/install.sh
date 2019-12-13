#!/bin/bash
# Install node.js
cd /tmp
curl -O https://rpm.nodesource.com/setup_10.x
bash setup_10.x
yum install -y nodejs
# Install vue
sudo npm install -g vue-cli
# Create project folder
sudo mkdir -p /usr/public_html
sudo cd /usr/public_html
#sudo yum install -y expect
#vue init webpack myvue-project
#cd myvue-project
#npm run build
# Install nginx
yum install -y epel-release
yum install -y nginx
systemctl start nginx
