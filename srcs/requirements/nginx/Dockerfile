FROM alpine:3.17.3

RUN apk update --no-cache && \
    apk add --no-cache --no-progress nginx && \
    apk add --no-cache --no-progress vim

RUN mkdir -p /etc/nginx/ssl
RUN apk add --no-cache --no-progress openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/hello_there.html /var/www/index.html 

CMD ["nginx", "-g", "daemon off;"]
