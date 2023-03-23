#!/bin/bash
#https://aymeric-cucherousset.fr/installer-mariadb-sur-debian-11/
#set -x

service mysql start;

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]
then

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
sleep 3
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

fi

exec mysqld_safe
