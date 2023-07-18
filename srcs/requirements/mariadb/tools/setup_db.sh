#!/bin/sh
/etc/init.d/mariadb setup
echo $?
/etc/init.d/mariadb start
echo $?
mysql -u root < /tmp/create_db.sql
echo $?
rc-service mariadb stop
echo $?
/usr/bin/mysqld --user mysql
echo $?
