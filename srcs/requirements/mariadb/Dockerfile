FROM alpine:3.18

ENV DB_HOST=mariadb
ENV DB_NAME=wordpressdb
ENV DB_USER=oheinzel
ENV DB_PASS=oheinzel
ENV DB_ROOT_PASS=oheinzel

RUN apk update
RUN apk add mysql mysql-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

COPY ./tools/entrypoint.sh /bin/bash/
RUN chmod +x /bin/bash/setup_db.sh

ENTRYPOINT ["sh /bin/bash/setup_db.sh"]
