DIR = ./srcs

DIR_FLAG = --project-directory $(DIR)

UP_FLAGS = -d --build 

all:
	service docker start
	docker compose $(DIR_FLAG) up $(UP_FLAGS)

down: 
	docker compose $(DIR_FLAG) down
	service docker stop