FROM alpine:3.4

MAINTAINER laoshanucn <laoshancun (at) foxmail.com>

ADD repositories /etc/apk/repositories
COPY rsyslog.conf /etc/rsyslog.conf

RUN  apk add --update rsyslog \
  && rm -rf /var/cache/apk/*

EXPOSE 514 514/udp

VOLUME [ "/var/log", "/etc/rsyslog.d" ]



ENTRYPOINT [ "rsyslogd", "-n" ]