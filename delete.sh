#!/bin/bash

source common.sh

for NAME in ${SERVERS[*]}
do
	HOST_NAME="measurement-server-"$NAME
	echo "deleting $HOST_NAME"
	azure vm delete $HOST_NAME -q
done