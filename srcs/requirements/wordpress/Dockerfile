FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-xml \
    wget \
    curl \

RUN curl -0 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/setup-wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-wordpress.sh

EXPOSE 9000

CMD ["setup-wordpress.sh"]
