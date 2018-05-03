#!/bin/bash

if [ -d "/var/lib/mysql2" ]; then
    sudo service mysql stop

    sudo cp -r /var/lib/mysql2/* /var/lib/mysql/
    sudo rm -rf /var/lib/mysql2

    chown mysql:mysql -R /var/lib/mysql

    sudo service mysql start
fi

usermod -u $(ls -ldn /vagrant | awk '{print $3}') www-data
groupmod -g $(ls -ldn /vagrant | awk '{print $3}') www-data

exec supervisord -n