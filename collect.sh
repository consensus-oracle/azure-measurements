#!/bin/bash

SERVERS=(1 2 3 4 5)
FILENAME="hping_log.csv"

for NAME in ${SERVERS[*]}
do
	USER="azureuser"
	ADDR="measurement-server-"$NAME".cloudapp.net"
	scp -i ~/.ssh/azure_key $USER@$ADDR:~/azure-measurements/$FILENAME ~/$NAME"-results.csv" 
done