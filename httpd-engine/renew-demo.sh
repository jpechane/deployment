#!/bin/bash
date
docker stop httpd-lumeer
certbot-auto renew
docker start httpd-lumeer
