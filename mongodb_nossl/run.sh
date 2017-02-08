#!/bin/bash
set -m

cmd="/usr/bin/mongod --auth --quota --quotaFiles 2 --smallfiles"

$cmd &

if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi

fg
