FROM alpine:3.17.3

ARG DB_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_USER2
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apk add --no-cache --no-progress mariadb mariadb-client
RUN apk add --no-cache --no-progress mysql-client
COPY conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal
EXPOSE 3306
RUN	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld
RUN mysqld & \
	sleep 20 && \
	echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql && \
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql && \
	echo "CREATE USER '$MYSQL_USER2'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql && \
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql && \
	echo "FLUSH PRIVILEGES;" | mysql && \
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql
CMD ["mysqld"]
