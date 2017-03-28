#!/bin/bash
docker stop httpd-keycloak
certbot-auto renew
docker start httpd-keycloak