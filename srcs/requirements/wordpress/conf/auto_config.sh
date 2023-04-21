#!/bin/sh

wp config create	--allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$DB_HOST --path='/var/www/html/wordpress'
	--force

exec "$@"
