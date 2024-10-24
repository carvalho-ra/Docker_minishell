.DEFAULT_GOAL = all

docker:
	@if ! command -v docker >/dev/null 2>&1; then \
		echo "🟡 Docker is not installed. Installing..."; \
		sudo apt-get update > /dev/null 2>&1; \
		sudo apt-get install -y ca-certificates curl make > /dev/null 2>&1; \
		sudo install -m 0755 -d /etc/apt/keyrings > /dev/null 2>&1; \
		sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc > /dev/null 2>&1; \
		sudo chmod a+r /etc/apt/keyrings/docker.asc > /dev/null 2>&1; \
		echo "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $$(. /etc/os-release && echo "$$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 2>&1; \
		sudo apt-get update > /dev/null 2>&1; \
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null 2>&1; \
		echo "🔧 Adding ${USER} to the Docker group..."; \
		sudo usermod -aG docker ${USER} > /dev/null 2>&1; \
		echo "✅ ${USER} has been added to the Docker group."; \
	else \
		echo "🟡 Docker is already installed."; \
	fi;

all: 
	@docker compose -f ./srcs/docker-compose.yml up -d
	@echo "http://localhost:7681"

build:
	@docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down --volumes --rmi local 

fclean: down
	@docker system prune --all --force

re: fclean all

PHONY: all build down re clean fclean docker

