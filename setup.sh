#!/bin/bash

sudo apt update
sudo apt install nodejs
sudo apt install npm
sudo npm install gulp-cli -g

ln -s /usr/bin/nodejs /usr/bin/node

npm update

sudo apt install vagrant
sudo apt install docker.io
sudo groupadd docker
sudo usermod -aG docker $USER

sudo reboot