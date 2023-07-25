#!/bin/sh
DB_DIR=/tmp/create_db.sql

echo "CREATE DATABASE $DB_NAME;"                                > $DB_DIR
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"     >> $DB_DIR
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"    >> $DB_DIR
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"  >> $DB_DIR
echo "FLUSH PRIVILEGES;"                                        >> $DB_DIR

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root < $DB_DIR
rc-service mariadb stop
mariadbd -u mysql --bind-address=0.0.0.0
