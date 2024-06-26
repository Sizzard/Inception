#!/bin/bash

service mariadb start
echo "MariaDB service started"

# Attendre que MariaDB soit complètement démarré
sleep 5

# Créer la base de données
mariadb -u root -p${SQL_ROOT_PWD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\` ;"
echo "Database created if not exists: ${SQL_DB}"

# Créer l'utilisateur
mariadb -u root -p${SQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS '${SQL_USR}'@'localhost' IDENTIFIED BY '${SQL_PWD}' ;"
echo "User created if not exists: ${SQL_USR}"

# Accorder les privilèges
mariadb -u root -p${SQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO '${SQL_USR}'@'%' IDENTIFIED BY '${SQL_PWD}' ;"
echo "Granted all privileges on ${SQL_DB} to ${SQL_USR}"

# Modifier le mot de passe de l'utilisateur root
mariadb -u root -p${SQL_ROOT_PWD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}' ;"
echo "Root user password changed to '${SQL_ROOT_PWD}' ;"

# Recharger les privilèges
mariadb -u root -p${SQL_ROOT_PWD} -e "FLUSH PRIVILEGES ;"
echo "Privileges flushed"

# Arrêter MariaDB proprement
mysqladmin -u root -padmin shutdown
echo "MariaDB service stopped"

# Lancer mysqld_safe
exec mysqld_safe
