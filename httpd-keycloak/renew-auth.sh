#!/bin/bash
date
docker stop httpd-keycloak
certbot-auto renew
docker start httpd-keycloak
if [ /etc/letsencrypt/live/auth.lumeer.io/cert.pem -nt /home/mvecera/cert.pem ]; then
  cp /etc/letsencrypt/live/auth.lumeer.io/cert.pem /home/mvecera/cert.pem
  openssl x509 -outform der -in /home/mvecera/cert.pem -out /mnt/letsencrypt/certificate.der
  rm /mnt/letsencrypt/cacerts.jks
  /home/mvecera/bin/jdk/bin/keytool -noprompt -v -import -file /mnt/letsencrypt/certificate.der -alias auth.lumeer.io -keystore /mnt/letsencrypt/cacerts.jks -storepass geheim
fi
