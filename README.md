# Docker_minishell
Minishell in a container...studying docker. 

### 🛠️ Usage

#### Install docker:
```sudo apt-get update -y && apt-get upgrade -y``` <br>
```sudo apt-get install docker docker-compose```

#### Run commands:<br>
```make``` - builds the image and runs container;<br>
```make run``` - builds the image and runs container;<br>
```make down``` - stops and deletes container<br>
```make rebuild``` - stops and deletes container, builds the image and runs container;<br>
```make fclean``` - deep clean of the project (deletes container and image).

