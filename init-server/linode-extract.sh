#!/bin/bash

label=$1
data="$(linode-cli linodes list --label $label --json)"

export id="$(echo $data| python -c "import sys, json; print(json.load(sys.stdin)[0]['id'])")"
export ip="$(echo $data | python -c "import sys, json; print(json.load(sys.stdin)[0]['ipv4'][0])")"

echo "ID: $id"
echo "IP: $ip"
