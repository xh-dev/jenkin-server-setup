#!/bin/bash

source venv/bin/activate

curl https://a1etig.mytools.express/xeth/xeth-bash-env-setup/raw/commit/2eba37f5f8f52eb8c1be5267ce8e67eaf5b0b877/setup_known_hosts.sh -O

chmod +x *.sh
./setup_known_hosts.sh


