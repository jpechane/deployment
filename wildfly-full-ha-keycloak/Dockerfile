FROM jboss/wildfly:10.1.0.Final

MAINTAINER marvenec@gmail.com

ENV KEYCLOAK_VERSION 2.3.0.Final

WORKDIR /opt/jboss/wildfly

RUN curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz | tar zx

WORKDIR /opt/jboss

RUN sed -i -e 's/=standalone.xml/standalone-full-ha.xml/' $JBOSS_HOME/bin/adapter-install-offline.cli
RUN $JBOSS_HOME/bin/jboss-cli.sh < $JBOSS_HOME/bin/adapter-install-offline.cli

ADD docker-entrypoint.sh /opt/jboss/

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["--server-config", "standalone-full-ha.xml"]
