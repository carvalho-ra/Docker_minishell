# Docker_terminal_minishell
Minishell in a container... studying Docker. 

### 🛠️ Usage

#### Install docker:

```make docker```

#### Run commands:
```make``` - builds the image and runs container; <br>
```make down``` - stops and deletes container; <br>
```make clean``` - stops and deletes container and image; <br>
```make fclean``` - deep clean of docker projects (deletes any container and image).

# Docker_browser_minishell
Minishell in a container, served in a browser via ttyd... studying Docker. 

### 🛠️ Usage

#### Change branches:

```git checkout feat-browser-minishell```

#### Install docker:

```make docker```

#### Run commands:
```make``` - builds the image and runs container; <br>
```make down``` - stops and deletes container; <br>
```make clean``` - stops and deletes container; <br>
```make fclean``` - deep clean of the project (deletes container and image).

#### access:

```http://localhost:7681```