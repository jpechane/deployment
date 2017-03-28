#!/bin/bash
docker stop httpd-engine
certbot-auto renew
docker start httpd-engine