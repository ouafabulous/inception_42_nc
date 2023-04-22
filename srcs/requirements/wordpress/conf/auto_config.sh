#!/bin/sh

wp config create	--allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$DB_HOST --path='/var/www/html/wordpress'
	--force

wp core install --url=$DOMAIN_MAIL --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL


wp user create $WP_USER $WP_USER_MAIL --role="author" --user_pass="$WP_USER_PASSWORD"



exec "$@"
