#!/bin/bash
docker run -idt --name mongodb --net=lumeer-net -e MONGODB_USER=lumeer -e MONGODB_PASS=/Lumeer1 -e MONGODB_DATABASE=lumeer-test lumeer/mongodb 
