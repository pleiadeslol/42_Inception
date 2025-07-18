FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-intl \
    php-mbstring \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-zip \
    wget \
    curl \
    default-mysql-client \
    netcat-openbsd

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz

RUN mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html

COPY tools/setup-wordpress.sh /usr/local/bin/setup-wordpress.sh
RUN chmod +x /usr/local/bin/setup-wordpress.sh

EXPOSE 9000

CMD ["/usr/local/bin/setup-wordpress.sh"]
