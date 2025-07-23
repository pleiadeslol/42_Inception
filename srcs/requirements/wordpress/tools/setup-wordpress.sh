#!/bin/bash

# Wait for MariaDB
echo "Waiting for MariaDB..."
until nc -z srcs_mariadb_1 3306; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

echo "MariaDB is ready!"

if [ -f ./wp-config.php ]; then
        echo "wp-config.php already exists"
else
    echo "Installing Wordpress..."
    wp --allow-root core download --force

    echo "Creating wp-config.php"
    wp --allow-root config create \
        --dbname="$MYSQL_DATABASE"\
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost=srcs_mariadb_1 \
        --force

    echo "Installing WordPress core..."
    wp --allow-root core install \
        --url="https:://$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email

    chown -R www-data:www-data /var/www/html/wordpress

    echo "Creating user..."
    wp --allow-root user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author

    echo "WordPress installation completed successfully!"
fi

echo "Starting PHP-FPM..."
exec php-fpm8.2 -F
