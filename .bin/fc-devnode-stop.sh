#!/bin/bash

echo "shutting down devnode"
cd ~/Documents/spotme/devnode
docker-compose down

echo "killing webapp"
fc-grep-kill.sh webapp

echo "killing backend"
fc-grep-kill.sh lib/server.js
