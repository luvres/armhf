FROM izone/arm:openjdk
MAINTAINER Leonardo Loures <luvres@hotmail.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN apt-get update \
    && apt-get install -y wget

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.39

ENV TOMCAT_TGZ_URL=http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.zip

RUN wget $TOMCAT_TGZ_URL
RUN unzip apache-tomcat-$TOMCAT_VERSION.zip
RUN mv apache-tomcat-$TOMCAT_VERSION /usr/local/tomcat
RUN rm apache-tomcat-$TOMCAT_VERSION.zip

WORKDIR $CATALINA_HOME

EXPOSE 8080
CMD ["sh", "/usr/local/tomcat/bin/catalina.sh", "run"]
