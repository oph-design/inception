#!/bin/sh
sleep 10
wp-cli core install --title=inception --url=$WP_HOST --admin_user=$WP_USER --admin_password=$WP_PASS --admin_email=$WP_MAIL
php-fpm81 -F
