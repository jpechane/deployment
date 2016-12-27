FROM lumeer/wildfly-keycloak:latest

MAINTAINER marvenec@gmail.com

ENV LUMEER_DEFAULTS defaults-prod.properties

ADD cacerts.jks /opt/jboss/wildfly/standalone/configuration/cacerts.jks

ADD engine-war.war /opt/jboss/wildfly/standalone/deployments/engine-war.war
ADD lumeer-web.war /opt/jboss/wildfly/standalone/deployments/lumeer-web.war
