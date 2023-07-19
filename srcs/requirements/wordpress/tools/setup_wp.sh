wp-cli config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --locale=en_DB
wp-cli core install --url=$DOMAIN --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_EMAIL
php-fpm8 --nodaemonize

