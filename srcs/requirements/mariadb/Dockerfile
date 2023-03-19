FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y

RUN	apt-get install -y mariadb-server

RUN	chown -R mysql:mysql /var/lib/mysql

#RUN	mkdir -p /var/run/mysqld

#RUN	chown -R mysql:mysql /var/run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/script.sh /script.sh

RUN	chmod -R 755 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

ENTRYPOINT	["/bin/bash", "/script.sh"]
