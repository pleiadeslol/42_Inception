#!/bin/bash

# Initialize database if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to start..."
until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
done

# Run initialization SQL (root has no password initially)
mysql -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Stop the service cleanly
service mariadb stop

# Wait for the service to fully stop
sleep 2

# Start MariaDB in foreground mode
exec "$@"
