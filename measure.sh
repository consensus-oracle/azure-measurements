#!/bin/bash

SERVERS=(1 2 3 4 5)

DIR="/home/azureuser/azure-measurements/"

LOG_FILE=$DIR"hping_log.csv"

TEMP_FILE=$DIR"output.temp"
HIST_FILE=$DIR"output.hist"

touch $LOG_FILE
touch $TEMP_FILE
touch $HIST_FILE

while true
do
	echo "start pinging server set"
	for NAME in ${SERVERS[*]}
	do
		SNAME="measurement-server-"$NAME".cloudapp.net"
		echo "pinging $SNAME"
		sudo hping3 $SNAME -c 3 -p 80 -S 2> $TEMP_FILE
		cat $TEMP_FILE >> $HIST_FILE
		RTT=`cat $TEMP_FILE | grep round-trip | awk -F '/' '{print $4}'`
		if [ "$RTT" != "" ]
		then
			echo "ping to $SNAME successful"
			TIME=`date`
			echo "$TIME, $NAME, $RTT" >> $LOG_FILE 
		fi
	done
	echo "finish pinging server set"
done