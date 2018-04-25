# Vagrant LAMP config with Docker

Instant development environment. Vagrant/Docker files for a LAMP Virtual Machine like setup. In approach to give the speed of the bare metal but the security of a VM using Docker container. This configuration gives you a fast, reproducible development environment.

This configuration is designed for any PHP application.

## Provides

  * Ubuntu 16.04
  * Apache 2.4.18
  * MySQL 5.6.25
  * PHP 7.0.4
  * phpMyAdmin
  * SSH
  * supervisord for keeping ssh, apache, mysql running (no init scripts).
  * shutdown script
  * Pre configured Apache virtualhost and a database ready to use
  * Just drop the `dev` folder and `Vagrantfile` into your project and do `vagrant up`

## Preparation

Install Vagrant (>= 1.6.2): http://www.vagrantup.com/downloads.html

Install Docker (>= 1.0.0) https://docs.docker.com/installation/ubuntulinux/

Copy the `dev` folder and `Vagrantfile` from this repository to your project folder

All SQL files in `database` will be imported given they have "CREATE DATABASE".

    vagrant up

It will take a few minutes for the first time.

## Start using

Add this line to your `/etc/hosts` (or windows equivalent)

    127.0.0.1 www.dev-site.com dev-site.com dev.dev-site-static.com

Your project folder will be served on this url: http://www.dev-site.com:8080

You can SSH to the box:

    vagrant ssh

A mysql database has been set up and ready to use immediately. Username: `admin`. Password: `admin`. Database name: `database`

Mysql root access is blocked with random password, stored on file on the VM.