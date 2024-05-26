CONTAINER_NAME = docker_minishell_container

all: run

build:
	@docker-compose -f ./srcs/docker-compose.yml build

run: build
	@docker-compose -f ./srcs/docker-compose.yml run --name $(CONTAINER_NAME) minishell

down:
	@docker-compose -f ./srcs/docker-compose.yml down || true

clean: down
	@docker-compose -f ./srcs/docker-compose.yml rm -f || true

rebuild: clean build run

fclean: clean
	docker system prune -af

PHONY: build run down clean rebuild fclean

