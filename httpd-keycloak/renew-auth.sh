#!/bin/bash
docker stop httpd-keycloak
certbot-auto renew
docker start httpd-keycloak
openssl x509 -outform der -in /etc/letsencrypt/live/auth.lumeer.io/cert.pem -out /mnt/letsencrypt/certificate.der
keytool -noprompt -v -import -file /mnt/letsencrypt/certificate.der -alias auth.lumeer.io -keystore /mnt/letsencrypt/cacerts.jks -storepass geheim
