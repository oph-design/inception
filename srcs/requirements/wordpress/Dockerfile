FROM alpine:3.18

RUN apk update
RUN apk add php81 php81-cli php81-fpm php81-mysqli php81-phar php81-openssl
RUN apk add wget mariadb-client

WORKDIR /var/www/wordpress
# RUN wget http://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli
RUN wp-cli core download

COPY conf/wp-config.php /var/www/wordpress/
COPY conf/www.conf /etc/php8/php-fpm.d/
COPY tools/setup_wp.sh /usr/bin/
RUN chmod +x /usr/bin/setup_wp.sh

EXPOSE 9000

ENTRYPOINT ["/usr/bin/setup_wp.sh"]

#/etc/php81/php-fpm.d
