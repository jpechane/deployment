FROM lumeer/wildfly-full-ha-keycloak:latest

MAINTAINER marvenec@gmail.com

RUN mkdir -p /opt/jboss/keycloak/modules/system/layers/base/org/postgresql/jdbc/main; cd /opt/jboss/keycloak/modules/system/layers/base/org/postgresql/jdbc/main; curl -O http://central.maven.org/maven2/org/postgresql/postgresql/9.4.1212/postgresql-9.4.1212.jar

ADD module.xml /opt/jboss/keycloak/modules/system/layers/base/org/postgresql/jdbc/main/

ADD datasource-install.cli /opt/jboss/wildfly/bin

RUN $JBOSS_HOME/bin/jboss-cli.sh < $JBOSS_HOME/bin/datasource-install.cli
