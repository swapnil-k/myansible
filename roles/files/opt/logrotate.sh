#!/usr/bin/env bash

# Clean non existent log file entries from status file
cd /var/lib/logrotate
test -e status || touch status
head -1 status > status.clean
sed 's/"//g' status | while read logfile date
do
    [ -e "$logfile" ] && echo "\"$logfile\" $date"
done >> status.clean
mv status.clean status

HOSTNAME=`hostname -f`
HOSTIP=`hostname -i`
LOGROTATE=`which logrotate`
LOGROTATEFILE="/etc/logrotate.conf"
LOGGER=`which logger`

# Logrotate command to perform job.
test -x $LOGROTATE || exit 0
$LOGROTATE $LOGROTATEFILE || $LOGGER -t cron "Logrotation Failed On $HOSTNAME ($HOSTIP)"
