#!/bin/bash

id=$1
linode-cli linodes delete $id
