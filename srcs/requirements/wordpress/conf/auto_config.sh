#!/bin/sh

WP_PATH=/var/www/html

if [ ! -f "/var/www/html/.installed" ]
then

	wp core download --path=$WP_PATH

	sleep 10

	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=$DB_HOST --path=$WP_PATH \
		--force

	chmod 600 $WP_PATH/wp-config.php
	chmod -R 755 $WP_PATH 
	chown -R 1000:1000 $WP_PATH 

	wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --path=$WP_PATH


	wp user create $WP_USER $WP_USER_MAIL --role="author" --user_pass="$WP_USER_PASSWORD" --path=$WP_PATH

	touch /var/www/html/.installed

fi

exec "$@"
