#!/bin/bash

USER=`whoami`
HOSTNAME=`uname -n`
IP=`hostname -i`
RELEASE=`cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2`
ROOT=`df -Ph / | tail -n1 |awk '{print $4}' | tr -d '\n'`

MEMORY=`free -m | grep "Mem" | awk '{print $2,"-",$3,"-",$4}'`
PSA=`ps -Afl | wc -l`

# time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ]; then    
    TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then
    TIME="afternoon"
else
    TIME="evening"
fi

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))

#System load
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`


echo -e "\e[7m--- Good $TIME $USER ----\e[0m"
#figlet -c "Message Here"
#MESSAGE=`/usr/bin/fortune | /usr/bin/cowsay -f tux`
#echo -e " $MESSAGE"

COLOR_COLUMN="\e[1m-"
COLOR_VALUE="\e[31m"
RESET_COLORS="\e[0m"
echo -e "
===========================================================================
 $COLOR_COLUMN- Hostname$RESET_COLORS............: $COLOR_VALUE $HOSTNAME $RESET_COLORS
 $COLOR_COLUMN- IP Address$RESET_COLORS..........: $COLOR_VALUE $IP $RESET_COLORS
 $COLOR_COLUMN- Release$RESET_COLORS.............: $COLOR_VALUE $RELEASE $RESET_COLORS
 $COLOR_COLUMN- Users$RESET_COLORS...............: $COLOR_VALUE Currently `users | wc -w` user(s) logged on $RESET_COLORS
=========================================================================== $RESET_COLORS
 $COLOR_COLUMN- Current user$RESET_COLORS........: $COLOR_VALUE $USER $RESET_COLORS
 $COLOR_COLUMN- CPU usage$RESET_COLORS...........: $COLOR_VALUE $LOAD1 - $LOAD5 - $LOAD15 (1-5-15 min) $RESET_COLORS
 $COLOR_COLUMN- Memory used$RESET_COLORS.........: $COLOR_VALUE $MEMORY (total-free-used) $RESET_COLORS
 $COLOR_COLUMN- Processes$RESET_COLORS...........: $COLOR_VALUE $PSA running $RESET_COLORS
 $COLOR_COLUMN- System uptime$RESET_COLORS.......: $COLOR_VALUE $upDays days $upHours hours $upMins minutes $upSecs seconds $RESET_COLORS
 $COLOR_COLUMN- Disk space ROOT$RESET_COLORS.....: $COLOR_VALUE $ROOT remaining $RESET_COLORS
===========================================================================
"
