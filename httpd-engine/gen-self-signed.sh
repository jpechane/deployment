#!/bin/bash
echo "!!!!! When asked for domain, enter xjet-drm.airfoillabs.com !!!!!"
openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout server.key -out server.crt