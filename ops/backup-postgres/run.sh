#!/bin/sh

if [ -z "${CRONTAB_SCHEDULE}" ]; then
	echo "Mandatory environment variables"
	echo "  CRONTAB_SCHEDULE - cron-based syntax to schedule the backup job"
	exit 1
fi

set > /docker.env
echo "${CRONTAB_SCHEDULE} root /backup.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/crontab
chmod 0644 /etc/cron.d/crontab
touch /var/log/cron.log
cron && tail -f /var/log/cron.log
