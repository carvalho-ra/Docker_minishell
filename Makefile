# Nome da imagem e do container
IMAGE_NAME = docker_minishell_image
CONTAINER_NAME = docker_minishell_container

# Alvo para construir a imagem Docker
build:
	docker build -t $(IMAGE_NAME) .

# Alvo para rodar o container com o terminal interativo
run: build
	docker run -it --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Alvo para parar o container
down:
	docker container stop $(CONTAINER_NAME) || true

# Alvo para remover o container
clean: down
	docker rm $(CONTAINER_NAME) || true

# Alvo para reconstruir e rodar o container
rebuild: clean build run

# Alvo para limpeza profunda
fclean: clean
	docker system prune -a

PHONY: build run down clean rebuild fclean

