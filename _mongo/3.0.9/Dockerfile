FROM izone/arm:jessie
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ADD core/* /usr/bin/
ADD ssl/* /usr/bin/
#ADD tools/* /usr/bin/
ADD mongodb.conf /etc/mongodb.conf
ADD mongodb.service /lib/systemd/system/mongodb.service

RUN apt-get update -y \
    && apt-get install -y libssl1.0.0 adduser \
    && adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb \
    && chown root:root /usr/bin/mongo* && chown root:root /usr/bin/bsondump \
    && chmod 755 /usr/bin/mongo* && chmod 755 /usr/bin/bsondump \
    && mkdir /var/log/mongodb \
    && chown mongodb:nogroup /var/log/mongodb \
    && mkdir /var/lib/mongodb \
    && chown mongodb:root /var/lib/mongodb \
    && chmod 775 /var/lib/mongodb \
    && mkdir -p /data/db /data/configdb

#COPY docker-entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]
