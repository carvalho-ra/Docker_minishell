# Docker_minishell
Minishell in a container...studing docker. 

## Install docker:
sudo apt-get update -y && apt-get upgrade -y 
sudo apt-get install docker docker-compose

##
make run - builds the image and runs a container;
make down - stops container;
make clean - stops and delete container
make rebuild - stops and deletes containers and images and buils another image;
make fclean - deepclean project (deletes container and images);

