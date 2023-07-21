FROM alpine:3.18

RUN apk update
RUN apk add nginx --no-cache
RUN apk add openssl --no-cache
RUN rm -f /etc/nginx/nginx.conf
RUN openssl req  -x509 -days 365 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=DE/ST=BW/L=HN/O=42 Heilbronn gGmbH/OU=Core/CN=oheinzel.42.fr"

COPY conf/nginx.conf /etc/nginx/
COPY conf/index.html /www/
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
