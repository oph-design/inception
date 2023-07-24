#!/bin/sh
DB_DIR=/tmp/create_db.sql

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
echo "CREATE DATABASE $DB_NAME;"                                > $DB_DIR
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"     >> $DB_DIR
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"    >> $DB_DIR
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"  >> $DB_DIR
echo "FLUSH PRIVILEGES;"                                        >> $DB_DIR
mysql -u root < $DB_DIR
rc-service mariadb stop
/usr/bin/mysqld -u mysql
