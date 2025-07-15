#!bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --path="/var/www/html" --alow-root

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path="/var/www/html" \
        --allow-root
    
    wp core install \
        --url="https:://$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="/var/www/html" \
        --alow-root

    wp user create \
        "$WP_USER" \
        "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --path="/var/www/html" \
        --allow-root
fi

php-fpm7.4 -F
