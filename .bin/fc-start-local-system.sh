#!/bin/bash

DIR=$TOOL_LOCAL_SYSTEM

if [ -z $DIR ]; then
    DIR=~/Documents/tool-local-system
fi

cd $DIR
bash ./start-nginx.sh&
./barrel/bin/barrel start&
./start-node.sh conf/system.json
