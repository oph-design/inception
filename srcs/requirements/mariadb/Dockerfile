FROM alpine

RUN apk update
RUN apk add mariadb mariadb-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

COPY conf/mariadb-server.cnf /etc/my.cnf.d/
COPY tools/setup_db.sh /usr/bin
RUN chmod +x /usr/bin/setup_db.sh
RUN mkdir -p tmp

EXPOSE 3306

ENTRYPOINT ["/usr/bin/setup_db.sh"]
