#!/bin/bash

# CREATE ADMIN USER

if [ -f /.mysql_admin_created ]; then
    echo "MySQL 'admin' user already created!"
    exit 0
fi

#/usr/bin/mysql > /dev/null 2>&1 &
service mysql start

MYSQL_PASS="admin"
_word=$( [ ${MYSQL_PASS} ] && echo "preset" || echo "random" )
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    #mysql -uroot -e "status" > /dev/null 2>&1
	mysql -uroot -e "status"
    RET=$?
done

echo "=> Creating MySQL admin user with ${_word} password"
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$MYSQL_PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
mysql -uroot -e "CREATE DATABASE \`database\`;"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo "=> Done!"
touch /.mysql_admin_created

echo "========================================================================"
echo "You can now connect to this MySQL Server using:"
echo ""
echo "    mysql -uadmin -p$MYSQL_PASS -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

SQL_FILES=$(ls /database | grep -E ".sql$")

for SF in $SQL_FILES; do
    mysql -uroot -h localhost < "/database/$SF"
done

# RANDOMIZE ROOT PASS

ROOTPASS=$(pwgen -s 12 1)

echo "=> Terminating root access to database"

mysqladmin -u root password "$ROOTPASS"
mysql -uroot -p"$ROOTPASS" -e "FLUSH PRIVILEGES"
mysqladmin -uroot -p"$ROOTPASS" shutdown

echo "=> Done!"
touch /.mysql_root_created
echo $ROOTPASS >> /.mysql_root_created