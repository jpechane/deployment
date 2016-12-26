#!/bin/bash
cd ~/engine
git reset --hard HEAD
git pull
mvn clean install -DskipTests

cd ~/web-ui
git reset --hard HEAD
git pull
sed -i -e 's/"disabled": "true"/"disabled": "false"/' src/main/webapp/WEB-INF
mvn clean package -DskipTests

cd ~/deployment/engine
cp ~/engine/war/target/engine-war.war .
cp ~/web-ui/target/lumeer-web.war .

