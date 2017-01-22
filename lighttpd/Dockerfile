FROM izone/arm
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk add --no-cache lighttpd

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN adduser www-data -G www-data -H -s /bin/false -D

EXPOSE 80
VOLUME /var/www

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
