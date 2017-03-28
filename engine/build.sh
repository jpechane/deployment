#!/bin/bash
cp /mnt/letsencrypt/cacerts.jks /home/mvecera/deployment/engine/
docker build -t lumeer/engine .
