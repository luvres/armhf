FROM izone/arm
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk add --no-cache lighttpd \
    && adduser www-data -G www-data -H -s /bin/false -D

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME /var/www

EXPOSE 80

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
