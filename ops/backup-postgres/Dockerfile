FROM postgres:latest

VOLUME /backup
ADD backup.sh /backup.sh
ADD run.sh /run.sh

CMD /run.sh
