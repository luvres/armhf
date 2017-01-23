FROM izone/arm
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk --no-cache add bash pwgen su-exec tzdata mysql mysql-client \
    && mkdir /run/mysqld && chmod 777 /run/mysqld

COPY ./docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld"]

