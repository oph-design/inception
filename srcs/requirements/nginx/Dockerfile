FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
                -keyout /etc/ssl/private/nginx.key \
                -out /etc/ssl/certs/nginx.crt \
                -subj "/C=DE/ST=BW/L=HN/O=42 Heilbronn/OU=student/CN=oheinzel.42.fr"

COPY conf/nginx.conf /etc/nginx/
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
