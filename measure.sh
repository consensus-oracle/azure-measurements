#!/bin/bash

SERVERS=(1 2 3 4 5)

DIR="/home/azureuser/azure-measurements/"

LOG_FILE=$DIR"hping_log.csv"
TEMP_FILE=$DIR"output.temp"
touch $LOG_FILE

while true
do
	for NAME in ${SERVERS[*]}
	do
		SNAME="measurement-server-"$NAME".cloudapp.net"
		echo "pinging $SNAME"
		hping3 $SNAME -c 3 -p 80 -S 2> $TEMP_FILE
		RTT=`cat $TEMP_FILE | grep round-trip | awk -F '/' '{print $4}'`
		if [ "$RTT" -ne "" ]
		then
			TIME=`date`
			echo "$TIME, $NAME, $RTT" >> $LOG_FILE 
		fi
	done
done