# Vagrant LAMP config with Docker and NPM

Instant development environment. Vagrant/Docker/NPM files for a LAMP Virtual Machine like setup. In approach to give the speed of the bare metal but the security of a VM using Docker container. This configuration gives you a fast, reproducible development environment.

This configuration is designed for any PHP application.

## Includes

  * Vagrant
  * Docker
  * NodeJS
  * NPM
  * Gulp (sass, uglify, rename)

## Box Provides

  * Ubuntu 16.04
  * Apache 2.4.18
  * MySQL 5.6.25
  * PHP 7.0.4
  * phpMyAdmin
  * SSH
  * supervisord for keeping ssh, apache, mysql running (no init scripts).
  * shutdown script

## Setup/Pre-install

All SQL files in `database` folder will be imported given they have "CREATE DATABASE".

Add this line to your `/etc/hosts` (or windows equivalent)

    127.0.0.1 www.dev-site.com dev-site.com dev.dev-site-static.com

Your project folder will be served on this url: http://www.dev-site.com:8080

Clone repo to your project folder:

    git clone https://github.com/Computopic/vagrant-docker-lamp <project_dest>

And run:

    sudo ./setup.sh

Your machine will reboot when preperations are done.

## Installation

Run from `Vagrantfile` / project -location:

    vagrant up

It will take a few minutes for the first time.

A mysql database has been set up and ready to use immediately. Username: `admin`. Password: `admin`. Database name: `database`

Mysql root access is blocked with random password, stored on file on the VM.

## Start using Vagrant

Boot up the box:

    vagrant up

You can SSH to the box:

    vagrant ssh

Stop the box:

    vagrant halt

Destroy the box:

    vagrant destroy

## Start using Gulp

Edit the theme, source and destination -path in `gulpfile.js`.

To build CSS and JS manually:

    gulp build

To listen for file changes:

    gulp listen

## Start using Docker

Kill all processes:

    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

Clean up old images:

    docker rmi $(docker images -q -f dangling=true)