FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

COPY ./tools/mariadb-script.sh /

ENTRYPOINT [ "sh" , "/mariadb-script.sh" ]
