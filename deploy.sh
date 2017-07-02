#!/bin/bash
date
source /home/mvecera/.zshenv

UP1=0
UP2=0

cd /home/mvecera/engine
git fetch
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
if [ ! $LOCAL = $REMOTE ]; then
  UP1=1
  git reset --hard HEAD
  git pull
  mvn clean install -Pproduction -DskipTests
fi

cd /home/mvecera/web-ui
git fetch
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
if [ ! $LOCAL = $REMOTE ]; then
  UP2=1
  git reset --hard HEAD
  git pull
  #sed -i -e 's/"disabled": "true"/"disabled": "false"/' src/main/webapp/WEB-INF/keycloak.json
  mvn clean package -DskipTests
fi

if [ $UP1 = 1 -a ! -f /home/mvecera/engine/war/target/engine-war.war ]; then
  echo "Could not compile engine."
  exit 1
fi

if [ $UP2 = 1 -a ! -f /home/mvecera/web-ui/target/lumeer-web.war ]; then
  echo "Could not compile web-ui."
  exit 2
fi
 
if [ $UP1 = 0 -a $UP2 = 0 -a ! /mnt/letsencrypt/cacerts.jks -nt /home/mvecera/deployment/engine/cacerts.jks ]; then
  echo "Already up-to-date."
  exit 3;
fi;

cd /home/mvecera/deployment/engine
cp /home/mvecera/engine/war/target/engine-war.war .
cp /home/mvecera/web-ui/target/lumeer-web.war .

/home/mvecera/deployment/engine/restart-v10.sh

