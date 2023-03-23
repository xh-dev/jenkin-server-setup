#!/bin/bash

linode-cli linodes create \
	--region ap-northeast \
	--type g6-nanode-1 \
	--image linode/ubuntu22.04 \
	--tag test \
	--label jenkins \
	--root_pass "$root_pass" \
	--authorized_keys "$ssh_key"

