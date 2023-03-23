#!/bin/bash

test(){
	s="$(linode-cli linodes list --label jenkins --json | python -c "import sys, json; print(json.load(sys.stdin)[0]['status'])")"
	echo $s
}

status="$(test)"
echo "Status: $status"
while [[ "$status" != "running" ]]
do
	sleep 1
	status="$(test)"
	echo "Status: $status"
done
