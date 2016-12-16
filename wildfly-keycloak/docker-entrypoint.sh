#!/bin/bash

if [ $WILDFLY_USER ] && [ $WILDFLY_PASSWORD ]; then
    wildfly/bin/add-user.sh --user $WILDFLY_USER --password $WILDFLY_PASSWORD
fi

IPADDR=$(hostname -i)

echo IP Address: $IPADDR

exec /opt/jboss/wildfly/bin/standalone.sh -Djboss.bind.address=$IPADDR -Djboss.bind.address.private=$IPADDR -Djboss.bind.address.management=$IPADDR -Djboss.node.name=server-$IPADDR $@
exit $?
