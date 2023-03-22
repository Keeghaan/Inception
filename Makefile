NAME =	Inception

CONTAINER = `docker ps -aq`

IMAGE = `docker images -aq`

${NAME}: all

all:
ifeq (, $(wildcard ./srcs/.env))
	cp ~/.env ./srcs/
endif
#ifneq ("$(wildcard ${HOME}/data/wordpress)", "${HOME}/data/wordpress")
	mkdir -p ${HOME}/data/wordpress
#endif
#ifneq ("$(wildcard ${HOME}/data/mariadb)", "${HOME}/data/mariadb")
	mkdir -p ${HOME}/data/mariadb
#endif
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
	sudo rm -rf ${HOME}/data

.PHONY: all re stop clean fclean iclean
