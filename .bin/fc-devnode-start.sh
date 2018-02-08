#!/bin/bash

echo "starting devnode"
cd ~/Documents/spotme/devnode
docker-compose up -d

sleep 2

echo "starting backend"
cd ~/Documents/spotme/backend/
DEVNODE=1 \
       NODE_TLS_REJECT_UNAUTHORIZED=0 \
       BACKEND_CONF=/home/sel/Documents/spotme/devnode/backend-devnode.json \
       nohup npm run watch >> /tmp/devnode.log 2>&1 < /dev/null &

sleep 2

echo "starting webapp"
cd ~/Documents/spotme/spotme-webapp/
nohup npm run dev >> /tmp/devnode.log 2>&1 < /dev/null &
