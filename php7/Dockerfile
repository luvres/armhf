FROM izone/arm:lighttpd
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk add --no-cache \
    php7-common \
    php7-iconv \
    php7-json \
    php7-gd \
    php7-curl \
    php7-xml \
    php7-pgsql \
    php7-imap \
    php7-cgi \
    fcgi \
    php7-fpm \
    php7-pdo \
    php7-pdo_sqlite \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-soap \
    php7-xmlrpc \
    php7-posix \
    php7-mcrypt \
    php7-gettext \
    php7-ldap \
    php7-ctype \
    php7-dom \
    php7-mysqli \
  \
    && mkdir -p /run/lighttpd/ \
    && chown www-data. /run/lighttpd/ \
    && ln -s /usr/bin/php-cgi7 /usr/bin/php-cgi

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME /var/www

EXPOSE 80

CMD php-fpm7 -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf
