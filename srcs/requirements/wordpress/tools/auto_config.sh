#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	sleep 10

	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	sleep 10
	wp core install --allow-root \
		--url=$WP_SITE \
		--title=$WP_TITLE \
		--admin_user=$ADMIN \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL \
		--path='/var/www/wordpress' 

	wp user create --allow-root \
		"$USER" \
		"$USER_EMAIL" \
		--role=author \
		--user_pass=$USER_PASSWORD \
		--path='/var/www/wordpress'
else
	echo "wp-config php DONE" 
fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php	
fi

exec php-fpm7.3 -F
