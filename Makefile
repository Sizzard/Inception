RED:=\e[31m
GREEN:=\e[32m
ENDCOLOR:=\e[0m

all : check_env create_volume
	docker compose -f srcs/docker-compose.yml up --build -d
	
check_env : 
	@if [ ! -f ./srcs/.env ]; then \
		echo "Error : .env file missing"; \
		exit 1; \
	fi

create_volume : 
	mkdir -p /home/facarval/data/mariadb
	mkdir -p /home/facarval/data/wordpress

start:
	docker compose -f srcs/docker-compose.yml up -d
	
stop :
	docker compose -f srcs/docker-compose.yml stop

fclean : stop
	docker system prune -af

re : fclean all
