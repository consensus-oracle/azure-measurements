#!/bin/bash

SERVERS=(1 2 3 4 5)

LOG_FILE="hping_log.csv"
touch $LOG_FILE

while true
do
	for NAME in ${SERVERS[*]}
	do
		SNAME="measurement-server-"$NAME".cloudapp.net"
		echo "pinging $SNAME"
		hping3 $SNAME -c 3 -p 80 -S 2> output.temp
		RTT=`cat output.temp | grep round-trip | awk -F '/' '{print $4}'`
		TIME=`date`
		echo "$TIME, $NAME, $RTT" >> $LOG_FILE 
	done
done