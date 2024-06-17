FROM debian:bullseye

RUN apt update -y && apt-upgrade -y && apt-get install mariadb-server -y

COPY /conf/50-server.cnf /etc/mysql/maria