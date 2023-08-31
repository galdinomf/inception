DIR = ./srcs

DIR_FLAG = --project-directory $(DIR)

UP_FLAGS = -d --build 

all: address folders
	service docker start
	docker-compose $(DIR_FLAG) up $(UP_FLAGS)

folders:
	mkdir -p /home/mgaldino/data/db
	mkdir -p /home/mgaldino/data/wordpress

address:
	sed -i '/^127\.0\.0\.1/ { /mgaldino\.42\.fr/! s/localhost/localhost mgaldino\.42\.fr/; }' /etc/hosts

down: 
	docker-compose $(DIR_FLAG) down
	service docker stop
