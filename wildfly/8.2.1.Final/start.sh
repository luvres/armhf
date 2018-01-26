#!/bin/sh

/opt/jboss/wildfly/bin/add-user.sh admin $PASS --silent
/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
