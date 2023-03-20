#!/bin/bash

RETURN=1
while [ $RETURN -ne 0 ]; do
    sleep 10 # in order to be sure that mariadb had enough time to be launched
    mysqladmin -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h mariadb ping
    RETURN=$?
done

#if [ ! -f /var/www/wordpress/wp-config.php ]; then

	sleep 10

	wp config create --allow-root \
		--dbname = ${MYSQL_DATABASE} \
		--dbuser = ${MYSQL_USER} \
		--dbpass = ${MYSQL_PASSWORD} \
		--dbhost = mariadb:3306 \
		--path = '/var/www/wordpress'

	wp core install --allow-root \
		--url = $SITE \
		--title = $TITLE \
		--admin_user = $ADMIN \
		--admin_password = $ADMIN_PASSWORD \
		--admin_email = $ADMIN_EMAIL \
		--path = '/var/www/wordpress' 

	wp user create --allow-root \
		"$USER" \
		--role = author \
		Password  = $USER_PASSWORD \
		--path = '/var/www/wordpress'
#else
#	echo "wp-config php DONE" 
#fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php	
fi

exec php-fpm7.3  -F
