#!/bin/bash

service mariadb start
echo "MariaDB service started"

# Attendre que MariaDB soit complètement démarré
sleep 4

# Fonction pour exécuter une commande MariaDB et gérer les erreurs
execute_mariadb_command() {
    local command=$1
    if mariadb -u root -p${SQL_ROOT_PWD} -e "$command"; then
        echo "Successfully executed: $command"
    else
        echo "Failed to execute: $command" >&2
        exit 1
    fi
}

# Créer la base de données
execute_mariadb_command "CREATE DATABASE IF NOT EXISTS \`${SQL_DB}\`;"

# Créer l'utilisateur
execute_mariadb_command "CREATE USER IF NOT EXISTS '${SQL_USR}'@'%' IDENTIFIED BY '${SQL_PWD}';"

# Recharger les privilèges
execute_mariadb_command "FLUSH PRIVILEGES;"

# Accorder les privilèges
execute_mariadb_command "GRANT ALL PRIVILEGES ON \`${SQL_DB}\`.* TO '${SQL_USR}'@'%';"

# Recharger les privilèges
execute_mariadb_command "FLUSH PRIVILEGES;"

# Modifier le mot de passe de l'utilisateur root
execute_mariadb_command "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PWD}';"

# Recharger les privilèges
execute_mariadb_command "FLUSH PRIVILEGES;"

# Arrêter MariaDB proprement
mysqladmin -u root -p${SQL_ROOT_PWD} shutdown
echo "MariaDB service stopped"

# Lancer mysqld_safe
exec mysqld_safe
