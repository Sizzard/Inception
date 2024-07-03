FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf

COPY ./tools/mariadb-script.sh /usr/bin/

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

RUN chmod 777 /usr/bin/mariadb-script.sh

EXPOSE 3306

ENTRYPOINT [ "sh" , "/usr/bin/mariadb-script.sh" ]
