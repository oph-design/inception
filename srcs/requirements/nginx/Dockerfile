FROM alpine:3.18

RUN apk update
RUN apk add nginx --no-cache
RUN apk add openrc --no-cache
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rm -f /etc/nginx/nginx.conf

RUN openrc
# RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel

COPY ./tools/nginx.conf /etc/nginx/
COPY ./tools/index.html /www/

ENTRYPOINT ["rc-service"]
# RUN rc-service nginx restart
# RUN rc-service nginx start
