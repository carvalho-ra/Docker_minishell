CONTAINER_NAME = docker_minishell_container

all: build
	@if [ $$(docker container ls -aq --filter "name=$(CONTAINER_NAME)") ]; then \
		echo "Container $(CONTAINER_NAME) found. Removing..."; \
		docker rm -f $(CONTAINER_NAME); \
	fi
	@docker compose -f ./srcs/docker-compose.yml run --name $(CONTAINER_NAME) minishell

build:
	@docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker container rm -f $(CONTAINER_NAME) 

re: fclean all

fclean: down
	docker system prune -af

PHONY: all build down re fclean

