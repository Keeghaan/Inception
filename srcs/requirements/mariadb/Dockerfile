FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y

RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/script.sh /usr/script.sh

ENTRYPOINT	["/bin/bash", "/usr/script.sh"]
