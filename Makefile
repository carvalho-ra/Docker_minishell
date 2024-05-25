IMAGE_NAME = docker_minishell_image
CONTAINER_NAME = docker_minishell_container

all: run

build:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

run: build
	@docker-compose -f ./srcs/docker-compose.yml run minishell

down:
	@docker-compose -f ./srcs/docker-compose.yml stop || true

clean: down
	@docker-compose -f ./srcs/docker-compose.yml rm -f || true

rebuild: clean build run

fclean: clean
	docker system prune -af

PHONY: build run down clean rebuild fclean

