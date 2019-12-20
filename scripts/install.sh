#!/bin/bash
# Variables
github=$4
webdir=/usr/public_html
databaseid=$2
containerid=$3
appurl=$1
# Install node.js
cd /tmp
curl -O https://rpm.nodesource.com/setup_10.x
bash setup_10.x
yum install -y nodejs
yum install -y gcc
# Install vue
npm install -g vue-cli
# Create project folder
mkdir -p $webdir
cd $webdir
#Install expect and install vue
yum install -y expect
curl -O $github/scripts/vue.exp
chmod u+x vue.exp
./vue.exp
echo "Vue installation completed"
#vue init webpack myvue-project
npm install
# Install nginx
yum install -y epel-release
yum install -y nginx
# Prepare conf files for nginx
curl -O $github/scripts/nginx.conf
cp nginx.conf /etc/nginx/
systemctl start nginx
# Install dependencies for vue
sudo npm i bootstrap-vue@2.0.0-rc.7 bootstrap@4.1.0
npm i express@4.16.3 cors@2.8.4 axios@0.18.0 @azure/cosmos body-parser
# Install dependencies for Node
sudo npm install express-generator -g
# Download necessary files
curl -O $github/vue/App.vue
mv App.vue $webdir/src/
curl -O $github/vue/main.js
mv main.js $webdir/src/
curl -O $github/vue/index.js
mv index.js $webdir/src/router/
curl -O $github/vue/Hello.vue
mv Hello.vue $webdir/src/components/
curl -O $github/vue/ListReadings.vue
sed -i "s+<<APPURL>>+$appurl+g" ListReadings.vue
mv ListReadings.vue $webdir/src/components/
curl -O $github/vue/api.js
mv api.js $webdir/src/
mkdir $webdir/src/node-server
# Build VUE project
npm run build
# Set up node
cd $webdir/src/node-server/
express readings
cd ./readings
# Start Node.js
npm install
mkdir ./models
mkdir ./routes
curl -O $github/node/app.js
mv app.js $webdir/src/node-server/readings/
curl -O $github/node/config.js
#Inject values for DB
sed -i "s+<<DATABASEID>>+$databaseid+g" config.js
sed -i "s+<<CONTAINERID>>+$containerid+g" config.js
mv config.js $webdir/src/node-server/readings/
curl -O $github/node/readings.js
mv readings.js $webdir/src/node-server/readings/models/
curl -O $github/node/myReadings.js
mv myReadings.js $webdir/src/node-server/readings/routes/
npm start &