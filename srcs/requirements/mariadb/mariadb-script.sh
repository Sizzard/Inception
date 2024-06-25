#!bin/bash

service mariadb start

sleep 3
mysql -h localhost -u root -p$SQL_ROOT_PWD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\` ;"
sleep 1
mysql -h localhost -u root -p$SQL_ROOT_PWD -e "CREATE USER IF NOT EXISTS \`${SQL_USR}\`@'localhost' IDENTIFIED BY \`${SQL_PWD}\` ;"
sleep 1
mysql -h localhost -u root -p$SQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO \`${SQL_USR}\`@'%' IDENTIFIED BY \`${SQL_PWD}\` ;"
sleep 1
mysql -h localhost -u root -p$SQL_ROOT_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${SQL_ROOT_PWD}\` ;"
sleep 1
mysql -h localhost -u root -p$SQL_ROOT_PWD -e "FLUSH PRIVILEGES ;"
sleep 1
mysqladmin -u root -p$SQL_ROOT_PWD shutdown
exec mysqld_safe
