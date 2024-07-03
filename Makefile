RED:=\e[31m
GREEN:=\e[32m
ENDCOLOR:=\e[0m


all :
	docker compose -f srcs/docker-compose.yml up --build -d
	
start:
	docker compose -f srcs/docker-compose.yml up -d
	
stop :
	docker compose -f srcs/docker-compose.yml stop

fclean : stop
	docker system prune -a

re : fclean all