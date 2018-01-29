FROM izone/arm:alpine-3.7
MAINTAINER Leonardo Loures <luvres@hotmail.com>
COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN apk add --no-cache \
    bash \
    pwgen \
    su-exec \
    tzdata \
    mysql \
    mysql-client \
    && mkdir /run/mysqld \
    && chmod 777 /run/mysqld

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld"]

