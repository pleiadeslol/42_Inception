FROM debian:bullseye

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

RUN apt -y update && apt install mariadb-server -y

# Create necessary directories and set permissions
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld/ && \
    chmod 755 /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql

# Copy configuration and script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh

EXPOSE 3306

CMD ["/usr/local/bin/init-db.sh", "mysqld_safe", "--user=mysql"]
