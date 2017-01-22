FROM izone/arm
MAINTAINER Leonardo Loures <luvres@hotmail.com>

RUN apk add --no-cache apache2 php5-apache2

EXPOSE 80

CMD [ "rc-service", "apache2", "start" ]
