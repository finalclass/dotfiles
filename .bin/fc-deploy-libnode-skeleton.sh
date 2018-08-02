#!/bin/bash

cd /home/sel/Documents/spotme/backend/lib/task-queue/lib/tasks/event-creation/packages
cp libnode-skeleton /tmp/package -r
cd /tmp
fc-deploy.sh
rm -rf package
