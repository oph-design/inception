FROM alpine:3.18

RUN apk update
RUN apk add php php-cli php-fpm php-mysqli php-phar php-openssl
RUN apk add wget mariadb-client

RUN mkdir -p /www
WORKDIR /www
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli

COPY ./conf/wp-config.php /www/wordpress/
RUN chmod +r /www/wordpress/wp-config.php
COPY ./tools/setup_wp.sh /usr/bin/
RUN chmod +x /usr/bin/setup_wp.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/usr/bin/setup_wp.sh"]
