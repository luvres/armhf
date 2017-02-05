FROM izone/arm:jessie
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ADD bin/* /usr/bin/
ADD mongodb.conf /etc/mongodb.conf
ADD mongodb.service /lib/systemd/system/mongodb.service

RUN apt-get update -y \
    && apt-get install -y wget adduser \
    && adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb \
    && chown root. /usr/bin/mongo* && chown root. /usr/bin/bsondump \
    && chmod 755 /usr/bin/mongo* && chmod 755 /usr/bin/bsondump \
    && mkdir /var/log/mongodb \
    && chown mongodb:nogroup /var/log/mongodb \
    && mkdir /var/lib/mongodb \
    && chown mongodb:root /var/lib/mongodb \
    && chmod 775 /var/lib/mongodb
RUN mkdir -p /data/db /data/configdb

EXPOSE 27017

CMD [ "mongod" ]
