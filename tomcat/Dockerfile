FROM izone/arm:openjdk
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV CATALINA_HOME=/usr/local/tomcat \
    PATH=$CATALINA_HOME/bin:$PATH \
    TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.0.41
ENV TOMCAT_TGZ_URL=http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.zip

RUN apk add --no-cache wget \
    && wget $TOMCAT_TGZ_URL \
    && unzip apache-tomcat-$TOMCAT_VERSION.zip \
    && mv apache-tomcat-$TOMCAT_VERSION /usr/local/tomcat \
    && chmod +x /usr/local/tomcat/bin/*.sh \
    && rm apache-tomcat-$TOMCAT_VERSION.zip

WORKDIR $CATALINA_HOME

# Change upload limit that is 50Megas in Tomcat 8
RUN sed -i 's/52428800/104857600/' /usr/local/tomcat/webapps/manager/WEB-INF/web.xml

# Admin
ENV PASS admin
RUN sed -i 's/resourceName="UserDatabase"/resourceName="UserDatabase" digest="sha1"/' /usr/local/tomcat/conf/server.xml \
    && mv /usr/local/tomcat/conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml.orig \
    && mv /usr/local/tomcat/conf/context.xml /usr/local/tomcat/conf/context.xml.orig

EXPOSE 8080

ADD start.sh /etc/start.sh
CMD ["sh", "/etc/start.sh"]
