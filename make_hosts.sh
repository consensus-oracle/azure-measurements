#!/bin/bash

source common.sh

touch hosts.txt

for NAME in ${SERVERS[*]}
do
	SNAME="measurement-server-"$NAME".cloudapp.net"
	echo "$USER@$SNAME" >> hosts.txt

done