#!bin/bash

service mysql start

sleep 3
mysql -h localhost -u root -p$sql_root_pwd -e "CREATE DATABASE IF NOT EXISTS $sql_db ;"
sleep 1
mysql -h localhost -u root -p$sql_root_pwd -e "CREATE USER IF NOT EXISTS '$sql_usr'@'localhost' IDENTIFIED BY '$sql_pwd' ;"
sleep 1
mysql -h localhost -u root -p$sql_root_pwd -e "GRANT ALL PRIVILEGES ON '$sql_db'.* TO '$sql_usr'@'%' IDENTIFIED BY '$sql_pwd' ;"
sleep 1
mysql -h localhost -u root -p$sql_root_pwd -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$sql_root_pwd' ;"
sleep 1
mysql -h localhost -u root -p$sql_root_pwd -e "FLUSH PRIVILEGES ;"
sleep 1
mysqladmin -u root -p$sql_root_pwd shutdown
exec mysqld_safe
