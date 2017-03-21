#!/bin/bash
# Description: use Linux Crontab create a task to backup Database
# Script Author: goooooog
#
# Variables
nameserver="127.0.0.1"
user='test'
password='123'
commandpath='/usr/bin'
targetpath='/tmp/backup'
logpath='/usr'
nowtime=$(date "+%Y%m%d%H:%M:%S" | cut -d ":" -f 1)
dbname='cms'
logtime=$(date "+%Y%m%d%H:%M:%S")
removetime=$(date -d "-7 day" +"%Y%m%d%H")
start()
{
  echo  "[${logTime}]====backup start====" >> ${logpath}/mongodb-backup.log
 ${commandpath}/mongodump --host ${nameserver} --port 27017 -d ${dbname} --out ${targetpath}/${nowtime}
}
remove()
{
  echo "[${logtime}]===removeold start===" >> ${logpath}/mongodb-backup.log
  if [ -d "${targetpath}/${removetime}/" ]
  then
    rm -rf "${targetpath}/${removetime}/"
    echo "===success:delete ${targetpath}/${removetime}/  completed!===" >> ${logpath}/mongodb-backup.log
  else
    echo "===failure:${targetpath}/${removetime}/ does not exists!==="  >> ${logpath}/mongodb-backup.log
  fi
  echo "[${logtime}]===clear end ! ===" >> ${logpath}/mongodb-backup.log
}
execute()
{
  start
  if [ $? -eq 0 ]
  then
    echo  "******backup successfully******" >> ${logpath}/mongodb-backup.log
    remove
  else
    echo "====backup  failure====" >> ${logpath}/mongodb-backup.log
  fi
}

if [ ! -d "${targetpath}/${nowtime}/" ]
then
 mkdir ${targetpath}/${nowtime}
fi
execute
echo "[${logtime}]===******===backup end --> backup to the path: ${targetpath}/${nowtime} ===******===" >> ${logpath}/mongodb-backup.log