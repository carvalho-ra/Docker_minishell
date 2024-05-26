CONTAINER_NAME = docker_minishell_container

all: run

build:
	@docker-compose -f ./srcs/docker-compose.yml build

run: build
	@docker-compose -f ./srcs/docker-compose.yml run --name $(CONTAINER_NAME) minishell

down:
	@docker-compose -f ./srcs/docker-compose.yml down || true

re: down run

fclean: down
	docker system prune -af

PHONY: all build run down re fclean

