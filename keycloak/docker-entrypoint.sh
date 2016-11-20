#!/bin/bash

if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    keycloak/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

IPADDR=$(hostname -i)

echo IP Address: $IPADDR

exec /opt/jboss/keycloak/bin/standalone.sh -Djboss.bind.address=$IPADDR -Djboss.bind.address.private=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.node.name=server-$IPADDR $@
exit $?
