FROM jboss/wildfly:10.1.0.Final

MAINTAINER marvenec@gmail.com

ENV KEYCLOAK_VERSION 2.4.0.Final

WORKDIR /opt/jboss/wildfly

RUN curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz | tar zx

WORKDIR /opt/jboss

RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/adapter-install-offline.cli

ADD disable-https.cli /opt/jboss/wildfly/bin
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/disable-https.cli

ADD docker-entrypoint.sh /opt/jboss/

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["--server-config", "standalone.xml"]
