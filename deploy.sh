#!/bin/bash
cd ~/engine
git reset --hard HEAD
git pull
mvn clean install -Pproduction -DskipTests

cd ~/web-ui
git reset --hard HEAD
git pull
sed -i -e 's/"disabled": "true"/"disabled": "false"/' src/main/webapp/WEB-INF/keycloak.json
mvn clean package -DskipTests

if [ ! -f ~/engine/war/target/engine-war.war ]; then
  exit 1
fi

if [ ! -f ~/web-ui/target/lumeer-web.war ]; then
  exit 2
fi

cd ~/deployment/engine
cp ~/engine/war/target/engine-war.war .
cp ~/web-ui/target/lumeer-web.war .

