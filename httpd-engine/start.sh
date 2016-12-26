#!/bin/bash
docker run -idt -p 80:80 -p 443:443 --name httpd-lumeer --network lumeer-net lumeer/httpd
