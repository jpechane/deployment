#!/bin/bash
docker run -idt -p 27017:27017 --name mongodb --network lumeer-net -e MONGODB_USER=lumeer -e MONGODB_PASS=/Lumeer1 -e MONGODB_DATABASE=lumeer-test lumeer/mongodb 
