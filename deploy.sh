#!/bin/bash
cd ~/engine
mvn clean install -DskipTests

cd ~/web-ui
mvn clean package -DskipTests

