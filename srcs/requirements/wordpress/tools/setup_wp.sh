#!/bin/sh
sleep 30
wp-cli core install --title=inception --url=$WP_HOST --admin_user=$WP_ADMN --admin_password=$WP_ADMP --admin_email=$WP_MAIL
php-fpm81 -F
