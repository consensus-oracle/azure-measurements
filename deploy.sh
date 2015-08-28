#!/bin/bash

SERVERS=(1 2 3 4 5)

VM_IMAGE="coracle-1-20150827-207674"
LOCATION='North Europe'

for NAME in ${SERVERS[*]}
do
	DNS_NAME="measurement-server-"$NAME".cloudapp.net"
	echo "creating $DNS_NAME in $LOCATION"
	azure vm create -v --location "$LOCATION" -e --vm-size "Small" $DNS_NAME $VM_IMAGE
done