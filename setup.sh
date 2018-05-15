#!/bin/bash

apt update
apt install nodejs
apt install npm
npm install gulp-cli -g

ln -s /usr/bin/nodejs /usr/bin/node

npm update

apt install vagrant
apt install docker.io
groupadd docker
usermod -aG docker $USER

echo '{ "bip":"172.69.0.2/20", "dns": ["8.8.8.8", "8.8.4.4"] }' > ./daemon.json
mv ./daemon.json /etc/docker/daemon.json

read -p "Continue (y/n)?......" choice
case "$choice" in
  y|Y ) reboot;;
  * ) echo "Cancelled reboot, please reboot manually before continuing installation";;
esac