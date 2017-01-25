FROM izone/arm:openjdk
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV PASS=admin \
    WILDFLY_VERSION=8.2.1.Final
    
RUN mkdir -p /opt/jboss \
    && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    | tar zxf - -C /opt/jboss \
    && mv /opt/jboss/wildfly-$WILDFLY_VERSION /opt/jboss/wildfly

EXPOSE 8080 9990

ADD start.sh /etc/start.sh
ENTRYPOINT ["bash", "/etc/start.sh"]
