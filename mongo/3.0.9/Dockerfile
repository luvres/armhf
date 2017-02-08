FROM izone/arm:jessie-slim
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ADD core/* /usr/bin/
ADD tools/* /usr/bin/
ADD mongodb.conf /etc/mongodb.conf
ADD mongodb.service /lib/systemd/system/mongodb.service

RUN apt-get update -y \
    && apt-get install -y libssl1.0.0 && rm -rf /var/lib/apt/lists/* \
    && adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb \
    && chown root:root /usr/bin/mongo* \
    && chmod 755 /usr/bin/mongo* \
    && mkdir /var/log/mongodb \
    && chown mongodb:nogroup /var/log/mongodb \
    && mkdir /var/lib/mongodb \
    && chown mongodb:root /var/lib/mongodb \
    && chmod 775 /var/lib/mongodb \
    && mkdir -p /data/db /data/configdb

EXPOSE 27017 28017
CMD ["mongod"]
