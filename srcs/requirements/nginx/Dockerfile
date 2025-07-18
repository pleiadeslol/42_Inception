FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install \
    nginx \
    openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Benguerir/L=Benguerir/O=42/CN=rzarhoun.42.fr"
RUN chmod 600 /etc/nginx/ssl/nginx.key /etc/nginx/ssl/nginx.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
