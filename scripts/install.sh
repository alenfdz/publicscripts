#!/bin/bash
# Install node.js
cd /tmp
curl -O https://rpm.nodesource.com/setup_10.x
bash setup_10.x
yum install -y nodejs
yum install -y gcc
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
echo "Vue installation completed"
#vue init webpack myvue-project
cd myvue-project
npm install
# Install nginx
yum install -y epel-release
yum install -y nginx
# Prepare conf files for nginx
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/scripts/nginx.conf
mv nginx.conf /etc/nginx/
systemctl start nginx
# Install dependencies for vue
sudo npm i bootstrap-vue@2.0.0-rc.7 bootstrap@4.1.0
npm i express@4.16.3 cors@2.8.4 axios@0.18.0 @azure/cosmos body-parser
# Install dependencies for Node
sudo npm install express-generator -g
# Download necessary files
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/App.vue
mv App.vue /usr/public_html/src/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/main.js
mv main.js /usr/public_html/src/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/index.js
mv router.js /usr/public_html/src/router/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/Hello.vue
mv Hello.vue /usr/public_html/src/components/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/ListReadings.vue
mv PostsManager.vue /usr/public_html/src/components/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/vue/api.js
mv api.js /usr/public_html/src/
mkdir /usr/public_html/src/node-server
# Build VUE project
npm run build
# Set up node
cd /usr/public_html/src/node-server/
express readings
cd ./readings
npm install
mkdir ./models
mkdir ./routes
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/node/App.js
mv app.js /usr/public_html/src/node-server/readings/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/node/config.js
mv config.js /usr/public_html/src/node-server/readings/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/node/readings.js
mv readings.js /usr/public_html/src/node-server/readings/models/
curl -O https://raw.githubusercontent.com/alenfdz/publicscripts/master/node/myReadings.js
mv myReadings.js /usr/public_html/src/node-server/readings/routes/
# Start Node.js
