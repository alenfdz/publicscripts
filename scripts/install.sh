#!/bin/bash
# Install node.js
cd /tmp
curl -O https://rpm.nodesource.com/setup_10.x
bash setup_10.x
yum install -y nodejs
# Install vue
npm install -g vue-cli
# Create project folder
mkdir -p /usr/public_html
cd /usr/public_html
#Install expect and install vue
yum install -y expect
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/scripts/vue.exp
chmod u+x vue.exp
./vue.exp

#/usr/bin/expect<<EOF

#spawn /usr/bin/vue init webpack

#expect "Generate project" { send "\n" }
#expect "Project name" { send "\n" }
#expect "Project description" { send "\n" }
#expect "Author" { send "\n" }
#expect "Vue build" { send "\n" }
#expect "Install vue-router?" { send "\n" }
#expect "Use ESLint to lint your code?" { send "y\r" }
#expect "Pick an ESLint preset" { send "\n" }
#expect "Set up unit tests" { send "n\r" }
#expect "Setup e2e tests with Nightwatch?" { send "n\r" }
#expect "Should we run" { send "\n" }

#interact

#EOF
echo "Vue installation completed"
#vue init webpack myvue-project
cd myvue-project
npm run build
# Install nginx
yum install -y epel-release
yum install -y nginx
# Prepare conf files for nginx
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/scripts/nginx.conf
mv nginx.conf /etc/nginx/
systemctl start nginx