#!/bin/bash

## Settings
export PWD=$1

## Build Keycloak image
cd keycloak
docker build . -t lumeer/keycloak
cd ..

## Build Keycloak with PostrgeSQL image
cd keycloak-postgres
docker build . -t lumeer/keycloak-postgres
cd ..

## Build HTTPD for Keycloak
cd httpd-keycloak
docker build . -t lumeer/httpd-keycloak
cd..

## Create network
docker network create keycloak-net

## Run PostgreSQL database
docker run -idt --name postgres -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=$PWD -e POSTGRES_DB=keycloak --network keycloak-net postgres

## Run Keycloak on PostgreSQL
docker run -idt --name keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=$PWD -e POSTGRES_DB=keycloak -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --network keycloak-net lumeer/keycloak-postgres

## Run HTTPD
docker run -p 80:80 -p 443:443 -idt --name httpd-keycloak --network keycloak-net lumeer/httpd-keycloak
