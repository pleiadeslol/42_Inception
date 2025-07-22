FROM debian:bullseye

RUN apt -y update && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh

EXPOSE 3306

CMD ["/usr/local/bin/init-db.sh", "mysqld_safe"]
