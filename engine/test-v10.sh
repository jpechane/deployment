#!/bin/bash
docker run -it --name lumeer -e WILDFLY_USER=lumeer -e WILDFLY_PASSWORD=//Lumeer1 --net=lumeer-net lumeer/engine
