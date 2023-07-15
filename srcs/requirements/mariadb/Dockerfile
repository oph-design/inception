FROM alpine:3.18
RUN apk update
RUN apk add apache2-utils
RUN chmod +x /usr/bin/ab
RUN rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["ab"]
