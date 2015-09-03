#!/bin/bash

DIR="/home/azureuser/azure-measurements/"

source $DIR"common.sh"

TEMP_FILE=$DIR"output.temp"
HIST_FILE=$DIR"output.hist"

touch $LOG_FILE
rm $TEMP_FILE
touch $HIST_FILE

ID=`dnsdomainname | awk -F '.' '{print $2}' | awk -F '-' '{print $3}'`

echo "(re)starting" >> $HIST_FILE
while true
do
	echo "start pinging server set"
	echo "start pinging server set" >> $HIST_FILE
	for NAME in ${SERVERS[*]}
	do
		SNAME="measurement-server-"$NAME".cloudapp.net"
		echo "pinging $SNAME"
		touch $TEMP_FILE
		sudo hping3 $SNAME -c 10 -p 80 -S 2> $TEMP_FILE
		cat $TEMP_FILE >> $HIST_FILE
		RTT=`awk '/round-trip/ {print $4}' $TEMP_FILE | awk -F '/' '{print $1", "$2", " $3}'`
		rm $TEMP_FILE
		if [ "$RTT" != "" ]
		then
			echo "ping to $SNAME successful"
			TIME=`date +"%T"`
			echo "$TIME, $ID, $NAME, $RTT" >> $LOG_FILE 
		fi
	done
	echo "finish pinging server set"
	sleep 20
done