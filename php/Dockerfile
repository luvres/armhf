FROM izone/arm:lighttpd
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk add --no-cache \
    php5-common \
    php5-iconv \
    php5-json \
    php5-gd \
    php5-curl \
    php5-xml \
    php5-pgsql \
    php5-imap \
    php5-cgi \
    fcgi \
    php5-pdo \
    php5-pdo_pgsql \
    php5-soap \
    php5-xmlrpc \
    php5-posix \
    php5-mcrypt \
    php5-gettext \
    php5-ldap \
    php5-ctype \
    php5-dom \
    php5-mysqli \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /run/lighttpd/ \
    && chown www-data. /run/lighttpd/

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME /var/www

EXPOSE 80

CMD php-fpm -D && lighttpd -D -f /etc/lighttpd/lighttpd.conf
