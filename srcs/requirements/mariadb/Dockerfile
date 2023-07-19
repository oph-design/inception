FROM alpine:3.18

ENV DB_NAME=wordpressdb
ENV DB_USER=oheinzel
ENV DB_PASS=password
ENV DB_ROOT_PASS=oheinzel

RUN apk update
RUN apk add mysql mysql-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

COPY ./tools/db_server.cnf /etc/my.cnf.d/

RUN mkdir -p tmp
COPY ./tools/setup_db.sh /usr/bin
# COPY ./tools/create_db.sql /tmp/
RUN chmod +x /usr/bin/setup_db.sh
# RUN chmod +r /tmp/create_db.sql

EXPOSE 3306

ENTRYPOINT ["sh", "/usr/bin/setup_db.sh"]

