#!/bin/bash

source common.sh

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
		sudo hping3 $SNAME -c 10 -p 80 -S 2> $TEMP_FILE
		cat $TEMP_FILE >> $HIST_FILE
		RTT= awk '/round-trip/ {print $4}' $TEMP_FILE | awk -F '/' '{print $1", "$2", " $3}'
		if [ "$RTT" != "" ]
		then
			echo "ping to $SNAME successful"
			TIME=`date`
			echo "$TIME, $NAME, $RTT" >> $LOG_FILE 
		fi
	done
	echo "finish pinging server set"
	sleep 20
done