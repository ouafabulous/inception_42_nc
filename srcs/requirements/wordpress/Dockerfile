FROM alpine:3.17.2

RUN apk update --no-cache --no-progress
RUN apk upgrade --no-cache --no-progress 
RUN apk add --no-cache --no-progress php 
RUN apk add --no-cache --no-progress php-fpm 
RUN apk add --no-cache --no-progress php-mysqli 
RUN apk add --no-cache --no-progress php-json 
RUN apk add --no-cache --no-progress php-phar 
RUN apk add --no-cache --no-progress php-iconv 
RUN apk add --no-cache --no-progress php-mbstring 
RUN apk add --no-cache --no-progress  mariadb-client

RUN		sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php81/php-fpm.d/www.conf

RUN apk add --no-cache unzip

RUN mkdir -p /var/www/html
RUN chown -R root:root /var/www/html/
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/auto_config.sh /usr/bin/auto_config.sh
RUN chmod 777 /usr/bin/auto_config.sh
RUN apk add --no-cache util-linux

ENTRYPOINT [ "/usr/bin/auto_config.sh" ]
CMD ["/usr/sbin/php-fpm81", "-F"]
