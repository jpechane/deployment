# Lumeer Deployment Configuration

## Containers Initialization

### Building Containers

You can use commands like the following in each of the subdirectories.

```
  docker build . -t lumeer/keycloak
  docker build . -t lumeer/keycloak-postgres
  docker build . -t lumeer/keycloak-ha-postgres
  ...
```

### Create Dedicated network

By default, Docker containers do not see each other. Instead of linking directly, we can put them on a common network. We then do not need to
care about opened ports.

Let's create networks for each server group. `keycloak-net` for Keycloak server and its database and `lumeer-net` for the deployed application.

```
  docker network create keycloak-net
  docker network create lumeer-net
```

### Keycloak Server

Keycloak server needs to persist data, so let's start a PostgreSQL database for it first. We will configure database parameters (db. name, user and password)
and we will connect it to the `keycloak-net` network.

```
  docker run -idt --name postgres -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=keycloaksecretpassword -e POSTGRES_DB=keycloak --network keycloak-net postgres
```

Next we will start Keycloak server connected to the same network so it can access the PostgreSQL database and we'll expose it locally on port 8180
(internally, it runs on 8080 but we do not want to collide with other WildFly instances).

```
docker run -idt -p 8180:8080 --name keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=keycloaksecretpassword -e POSTGRES_DB=keycloak -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin --network keycloak-net lumeer/keycloak-ha-postgres
```

## Docker Hints

To list all running and stopped containers:
```
  docker ps -a
```

To start/stop a container:
```
  docker run <container id or name>
  docker stop <container id or name>
```

To delete a stopped container:
```
  docker rm <container id or name>
```

To list and delete a container image:
```
  docker images
  docker rmi <image id>
```

To see what is going on in a running container:
```
  docker exec -it <container id or name> /bin/bash
```

To attach to the started container. 
Warning: upon terminating this shell, the container will exit. To detach the tty without exiting the shell, use the escape sequence Ctrl-P + Ctrl-Q.
```
  docker attach <container id or name>
```
