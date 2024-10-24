.DEFAULT_GOAL = all

all:
	@docker compose -f ./srcs/docker-compose.yml run --rm --name minishell_container minishell

build:
	@docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down --rmi local

fclean: down
	@docker system prune --all

PHONY: all build down clean fclean
