FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install mariadb-server 

COPY conf/50-server.conf /etc/mysql/mariadb.conf.d/
COPY tools/init-db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-db.sh

EXPOSE 3360

CMD ["init-db.sh"]
