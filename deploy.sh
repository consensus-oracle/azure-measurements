#!/bin/bash

source common.sh

VM_IMAGE="coracle-1-20150903-977368"
LOCATION='North Europe'

for NAME in ${SERVERS[*]}
do
	DNS_NAME="measurement-server-"$NAME".cloudapp.net"
	echo "creating $DNS_NAME in $LOCATION"
	azure vm create -v --location "$LOCATION" -e --vm-size "Small" $DNS_NAME $VM_IMAGE
	azure vm endpoint create "measurement-server-"$NAME 80 80
done