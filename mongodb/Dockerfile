FROM ubuntu:16.04
MAINTAINER marvenec@gmail.com

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2)/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data/db

ENV AUTH yes

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

VOLUME [ "/data/db" ]

ADD mongodb.pem /etc/ssl/mongodb.pem

EXPOSE 27017 28017

# Set /usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/run.sh"]
