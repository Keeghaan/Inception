FROM	debian:buster

RUN	apt-get update -y && apt-get install nginx -y

RUN	apt-get install vim -y && apt-get install curl -y

RUN	mkdir -p /etc/nginx/ssl && apt-get install openssl -y

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jcourtoi.42.fr/UID=jcourtoi"

RUN	mkdir -p /var/run/nginx

RUN	mkdir -p /var/www/html

COPY	conf/index.html /etc/nginx/index.html

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html

RUN	chown -R www-data:www-data /var/www/html

CMD	["nginx", "-g", "daemon off;"]
