#!/bin/sh

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	
#RETURN=1
#while [ $RETURN -ne 0 ]; do
#    sleep 10 # in order to be sure that mariadb had enough time to be launched
#    mysqladmin -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h mariadb ping
 #   RETURN=$?
#done



sleep 10
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	wp core install --allow-root \
		--url=$WP_URL \
		--title=$WP_TITLE \
		--admin_user=$ADMIN \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL \
		--skip-email \
		--path='/var/www/wordpress'

	wp user create --allow-root \
		$USER $USER_EMAIL \
		--role='author' \
		--user_pass=$USER_PASSWORD \
		--path='/var/www/wordpress'

#	wp theme install yukiblogger --activate --allow-root --force
fi

exec /usr/sbin/php-fpm7.3 -F
