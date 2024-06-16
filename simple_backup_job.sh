#!/bin/bash

NOW=$( date '+%F_%H-%M' )

mkdir /path/to/location/backup_${NOW}

sshpass -p PASSWORD sftp -oPort=PORT -oStrictHostKeyChecking=accept-new USER@SERVER:directory/ <<EOF

get -R world /path/to/location/backup_${NOW}/

exit

EOF

find /path/to/location/ -mindepth 1 -mtime +14 -delete

echo done!