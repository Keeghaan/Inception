FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y

RUN	apt-get install wget -y

RUN	apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN	wget https://fr.wordpress.org/wordpress-6.1.1-fr_FR.tar.gz -P /var/www

RUN	cd /var/www && tar -xzf wordpress-6.1.1-fr_FR.tar.gz && rm wordpress-6.1.1-fr_FR.tar.gz

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar 

RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	tools/auto_config.sh /auto_config.sh

RUN	mkdir -p /run/php

ENTRYPOINT	["/bin/sh", "/auto_config.sh"]

