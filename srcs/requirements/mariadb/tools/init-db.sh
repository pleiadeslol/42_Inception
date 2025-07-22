#!/bin/bash

# Start MariaDB service
service mariadb start

mariadb -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD'); 
EOF

sleep 3

# Stop the service cleanly
service mariadb stop

# Start MariaDB in foreground mode
exec "$@"
