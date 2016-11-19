# Lumeer Deployment Configuration

## Containers Initialization

  docker build . -t lumeer/keycloak
  docker build . -t lumeer/keycloak-postgres
  docker build . -t lumeer/keycloak-ha-postgres

  docker network create keycloak-net
  docker network create lumeer-net

  docker run -idt -p 8080:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --name keycloak --network keycloak-net lumeer/keycloak

  docker run -idt --name postgres -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=keycloaksecretpassword -e POSTGRES_DB=keycloak --network keycloak-net postgres

  docker run -idt --name keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=keycloaksecretpassword -e POSTGRES_DB=keycloak -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --network keycloak-net lumeer/keycloak-ha-postgres
