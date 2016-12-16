FROM airfoillabs/wildfly-keycloak:latest

MAINTAINER marvenec@gmail.com

RUN mkdir -p /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main; cd /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main; curl -O http://central.maven.org/maven2/org/postgresql/postgresql/9.4.1212/postgresql-9.4.1212.jar

ADD module.xml /opt/jboss/wildfly/modules/system/layers/base/org/postgresql/jdbc/main/

ADD datasource-install.cli /opt/jboss/wildfly/bin

RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/datasource-install.cli
