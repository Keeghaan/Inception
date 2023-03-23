FROM	debian:buster

RUN	apt-get update -y

RUN	apt-get install mariadb-server mariadb-client -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/script.sh /script.sh

RUN	chmod -R 755 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

ENTRYPOINT	["/bin/bash", "/script.sh"]
