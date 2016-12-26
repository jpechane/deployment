#!/bin/bash
docker run -idt -p 80:80 -p 443:443 --name httpd-keycloak --network keycloak-net lumeer/httpd-keycloak
