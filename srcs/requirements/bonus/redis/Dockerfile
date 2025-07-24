FROM debian:bullseye

RUN apt-get update && apt-get install redis-server -y

COPY conf/redis.conf /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize", "no"]