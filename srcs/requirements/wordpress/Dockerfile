FROM alpine:3.18

ENV DB_NAME=wordpressdb
ENV DB_USER=oheinzel
ENV DB_PASS=password
ENV DOMAIN=localhost
ENV WP_USER=oheinzel
ENV WP_PASS=password
ENV WP_EMAIL=ole.paul.heinzelmann@gmail.com

RUN apk update
RUN apk upgrade
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

COPY ./tools/setup_wp.sh /usr/bin/
RUN chmod +x /usr/bin/setup_wp.sh

ENTRYPOINT ["sh", "/usr/bin/setup_wp.sh"]
