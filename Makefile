all : docker-compose up --build

fclean : docker system prune -y

re : fclean all
