#!/bin/sh
while ! wp-cli core install --title=inception \
        --url=$WP_HOST --admin_user=$WP_ADMN \
        --admin_password=$WP_ADMP --admin_email=$WP_MAIL
do
  sleep 1
done
wp-cli user create $WP_USER $WP_MAIL --user_pass=$WP_PASS
php-fpm81 -F
