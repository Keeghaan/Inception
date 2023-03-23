NAME =	Inception

CONTAINER = `docker ps -aq`

IMAGE = `docker images -aq`

VOLUME	= `docker volume ls -q`

${NAME}: all

all:
ifeq (, $(wildcard ./srcs/.env))
	cp ~/.env ./srcs/
endif
	@mkdir -p ${HOME}/data/wordpress
	@mkdir -p ${HOME}/data/mariadb
	@docker compose -f ./srcs/docker-compose.yml up -d

re: fclean all

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker stop ${CONTAINER}

clean:
	docker rm -f ${CONTAINER}

iclean:
	docker rmi -f ${IMAGE}

vclean:
	docker volume rm ${VOLUME}

fclean: stop clean iclean vclean
	docker system prune -af --volumes
	sudo rm -rf ${HOME}/data

.PHONY: all re stop clean fclean iclean vclean nclean
