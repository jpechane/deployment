#!/bin/bash
source /home/mvecera/.zshenv

cd /home/mvecera/engine
git reset --hard HEAD
git pull
mvn clean install -Pproduction -DskipTests

cd /home/mvecera/web-ui
git reset --hard HEAD
git pull
#sed -i -e 's/"disabled": "true"/"disabled": "false"/' src/main/webapp/WEB-INF/keycloak.json
mvn clean package -DskipTests

if [ ! -f /home/mvecera/engine/war/target/engine-war.war ]; then
  exit 1
fi

if [ ! -f /home/mvecera/web-ui/target/lumeer-web.war ]; then
  exit 2
fi

cd /home/mvecera/deployment/engine
cp /home/mvecera/engine/war/target/engine-war.war .
cp /home/mvecera/web-ui/target/lumeer-web.war .

/home/mvecera/deployment/engine/restart-v10.sh

