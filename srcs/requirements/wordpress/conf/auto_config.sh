#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	sleep 10

	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

#	wp core install --allow-root \
#		--url=$SITE \
#		--title=$TITLE \
#		--admin_user=$ADMIN \
#		--admin_password=$ADMIN_PASSWORD \
#		--path='/var/www/wordpress' 

#	wp user create --allow-root \
#		"$USER" \
#		--role=author \
#		--user_pass=$USER_PASSWORD \
#		--path='/var/www/wordpress'
else
	echo "wp-config php DONE" 
fi

if [ ! -d /run/php ]; then
	mkdir -p /run/php	
fi

exec php-fpm7.3 -F
