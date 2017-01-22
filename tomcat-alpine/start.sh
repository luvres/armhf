#!/bin/bash

# Admin
admin(){
  cp /usr/local/tomcat/conf/tomcat-users.xml.orig /usr/local/tomcat/conf/tomcat-users.xml
  sed -i 's/<\/tomcat-users>/ /' /usr/local/tomcat/conf/tomcat-users.xml
  echo '  <role rolename="manager-gui"/>' >>/usr/local/tomcat/conf/tomcat-users.xml
  echo '  <role rolename="admin-gui"/>' >>/usr/local/tomcat/conf/tomcat-users.xml
  echo "  <user username=\"admin\" password=\"`/usr/local/tomcat/bin/digest.sh -a sha1 \$PASS | awk -F ":" '{print \$2}'`\" roles=\"manager-gui,admin-gui\"/>" >>/usr/local/tomcat/conf/tomcat-users.xml
  echo '</tomcat-users>' >>/usr/local/tomcat/conf/tomcat-users.xml
};admin


/usr/local/tomcat/bin/catalina.sh run
