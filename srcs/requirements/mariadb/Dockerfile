FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install mariadb-server 

RUN mkdir -p /var/lib/mysql /var/run/mysqld /var/log/mysql && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /var/log/mysql && \
    chmod 777 /var/run/mysqld && \
    chmod 755 /var/log/mysql

COPY conf/50-server.conf /etc/mysql/mariadb.conf.d/
COPY tools/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh

EXPOSE 3360

CMD ["/usr/local/bin/init-db.sh"]
