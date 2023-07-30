DIR = ./srcs

DIR_FLAG = --project-directory $(DIR)

UP_FLAGS = -d --build 

all: address
	service docker start
	docker compose $(DIR_FLAG) up $(UP_FLAGS)

address:
	sed -i 's/\(127.0.0.1 \)/\1 mgaldino.42.fr/' /etc/hosts
	sed -i 's/\(::1 \)/\1 mgaldino.42.fr/' /etc/hosts

down: 
	docker compose $(DIR_FLAG) down
	service docker stop