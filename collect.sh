#!/bin/bash

source common.sh 
FILENAME="hping_log.csv"
touch latency-results.csv

for NAME in ${SERVERS[*]}
do
	ADDR="measurement-server-"$NAME".cloudapp.net"
	scp -i ~/.ssh/azure_key $USER@$ADDR:~/azure-measurements/$FILENAME ~/azure-measurements/results/$NAME"-results.csv"
	cat $NAME"-results.csv" >> latency-results.csv
	rm $NAME"-results.csv" 
done