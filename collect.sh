#!/bin/bash

source common.sh 
FILENAME="hping_log.csv"

for NAME in ${SERVERS[*]}
do
	ADDR="measurement-server-"$NAME".cloudapp.net"
	scp -i ~/.ssh/azure_key $USER@$ADDR:~/azure-measurements/$FILENAME ~/azure-measurements/results/$NAME"-results.csv" 
done