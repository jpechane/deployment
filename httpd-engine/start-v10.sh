#!/bin/bash
docker run -idt -p 80:80 -p 443:443 -v "/etc/letsencrypt:/etc/letsencrypt" --name httpd-lumeer --net=lumeer-net lumeer/httpd-lumeer
