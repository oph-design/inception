FROM alpine:3.18

ENV DB_HOST=mariadb
ENV DB_NAME=wordpressdb
ENV DB_USER=oheinzel
ENV DB_PASS=password
ENV DB_ROOT=inception

RUN apk update
RUN apk add mysql mysql-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

COPY conf/db_server.cnf /etc/my.cnf.d/

RUN mkdir -p tmp
COPY tools/setup_db.sh /usr/bin
RUN chmod +x /usr/bin/setup_db.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/setup_db.sh"]

