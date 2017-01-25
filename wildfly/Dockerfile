FROM izone/arm:openjdk
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV PASS=admin \
    WILDFLY_VERSION=10.1.0.Final \
    LAUNCH_JBOSS_IN_BACKGROUND=true

RUN apk add --no-cache curl \
    && mkdir -p /opt/jboss \
    && curl https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    | tar zxf - -C /opt/jboss \
    && mv /opt/jboss/wildfly-$WILDFLY_VERSION /opt/jboss/wildfly \
    && apk del curl
    
EXPOSE 8080 9990

ADD start.sh /etc/start.sh
ENTRYPOINT ["sh", "/etc/start.sh"]
