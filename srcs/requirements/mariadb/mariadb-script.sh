service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS $sql_db ;"
mysql -e "CREATE USER IF NOT EXISTS '$sql_usr'@'localhost' IDENTIFIED BY '$sql_pwd' ;"
mysql -e "GRANT ALL PRIVILEGES ON '$sql_db'.* TO '$sql_usr'@'%' IDENTIFIED BY '$sql_pwd' ;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$sql_root_pwd' ;"
mysql -e "FLUSH PRIVILEGES ;"
mysql admin -u root -p$sql_root_pwd shutdown
exec mysqld_safe
