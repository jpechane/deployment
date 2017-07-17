# Backup PostgreSQL

This container is used to backup a PostgreSQL  instance running in a Docker container. The *database* to be backed up must be linked to the *backup* container under alias `db`. All connection parameters are automatically discovered from the linked container.
An environment variable `CRON_SCHEDULE` must be provided to define the schedule with which the back up is executed.
The backup process archives gzipped dump files into a directory mounted under `/backup` volume.
Usage:
```
docker run -it --link <dbcontainer>:db -v <target_directory>:/backup -e CRONTAB_SCHEDULE=<schedule> lumeer/postgres-backup
```

Example:
```
# Start database container
docker run -it --name postgres -e POSTGRES_USER=ukeycloak -e POSTGRES_PASSWORD=pkeycloak -e POSTGRES_DB=keycloak postgres

# Start backup container
docker run -it --link postgres:db -v /mnt/nfs/backup:/backup -e CRONTAB_SCHEDULE='* 0 * * *' lumeer/postgres-backup
```
