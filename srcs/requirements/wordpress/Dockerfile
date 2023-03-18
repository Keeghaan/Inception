FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y

RUN	apt-get install wget -y

RUN	apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www

RUN	cd /var/www && tar -xzf wordpress-6.1-fr_FR.tar.gz && rm wordpress-6.1-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY	conf/wp-config /var/www/wordpress/wp-config

RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar 

RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh /var/www/wordpress/auto_config.sh

RUN	mkdir /run/php 

RUN	/usr/sbin/php-fpm7.3 -F

ENTRYPOINT	["/bin/bash", "/var/www/wordpress/auto_config.sh"]


