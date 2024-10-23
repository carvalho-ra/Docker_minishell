
all: 
	@docker compose -f ./srcs/docker-compose.yml up --build

build:
	@docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down --volumes --rmi local 

fclean: down
	@docker system prune --all --force

re: fclean all

PHONY: all build down re clean fclean

