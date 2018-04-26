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

reboot