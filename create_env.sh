#!/bin/bash

declare -a arr=("DB_HOST" "DB_NAME" "DB_USER" \
                "DB_PASS" "DB_ROOT" "WP_HOST" \
                "WP_TITLE" "WP_ADMIN_USER" \
                "WP_ADMIN_PASS" "WP_ADMIN_MAIL" \
                "WP_USER" "WP_PASS" "WP_MAIL")

touch srcs/.env
for i in "${arr[@]}"
do
   echo -e "\033[0;34mEnter $i:\033[0m"
   read var
   echo "$i=$var" >> srcs/.env
done
