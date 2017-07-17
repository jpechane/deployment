#!/bin/sh

. /docker.env
PGPASSWORD="${DB_ENV_POSTGRES_PASSWORD}"
export PGPASSWORD
BACKUP_FILE="/backup/backup-$(date +%y%m%d-%H%M%S).dump"
pg_dump -h db -p 5432 -U "${DB_ENV_POSTGRES_USER}" -d "${DB_ENV_POSTGRES_DB}" > $BACKUP_FILE
echo "RESULT: $?"
gzip $BACKUP_FILE
