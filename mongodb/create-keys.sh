#!/bin/bash
openssl req -newkey rsa:2048 -new -x509 -days 365 -nodes -out mongodb-cert.crt -keyout mongodb-cert.key
cat mongodb-cert.key mongodb-cert.crt > mongodb.pem
