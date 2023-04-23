#!/bin/bash

START=$(date --date="31 day ago" +"%Y-%m-%d")
END=$(date --date= +"%Y-%m-%d")



QUERY={'"logout_time"':{'"$gte"':{'"$date"':'"'$START"T00:00:00.000Z"'"'}},'"$and"':[{'"logout_time"':{'"$lt"':{'"$date"':'"'$END"T23:59:59.000Z"'"'}}}]}






echo $QUERY >/tmp/query.json


mongodump --host x.x.x.x:27017 -u test -p test --authenticationDatabase test --db test --gzip --queryFile /tmp/query.json  --archive=/var/backups/mongo/monthly/mongo_dump_from_$START'_to_'$END -c connection_log


####for transfer backup to other server#################

sshpass -p 'admin' scp /var/backups/mongo/monthly/mongo_dump_from_$START'_to_'$END test@x.x.x.x:mongo/monthly
