wp config create	--allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$WP_ADMIN_USER \
	--dbpass=$WP_ADMIN_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/html/wordpress'

