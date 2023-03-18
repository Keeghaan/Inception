CONTAINER = `docker ps -aq`

IMAGE = `docker images -aq`

all:
	mkdir -p /home/jcourtoi/data/wordpress
	mkdir -p /home/jcourtoi/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d 
	docker compose -f ./srcs/docker-compose.yml ps

re: fclean all

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker stop ${CONTAINER}

clean:
	docker rm -f ${CONTAINER}

iclean:
	docker rmi -f ${IMAGE}

fclean: stop clean iclean 
	docker system prune -af --volumes
	sudo rm -rf /home/jcourtoi/data
