# Docker_minishell
Minishell in a container...studing docker. 

### 🛠️ Usage

#### Install docker:
```sudo apt-get update -y && apt-get upgrade -y``` <br>
```sudo apt-get install docker docker-compose```

#### Run commands:<br>
```make run``` - builds the image and runs a container;<br>
```make down``` - stops container;<br>
```make clean``` - stops and delete container<br>
```make rebuild``` - stops and deletes containers and images and buils another image;<br>
```make fclean``` - deepclean project (deletes container and images).

