#!/bin/bash

cd /home/sel/Documents/spotme/backend/lib/spotme3-node-libnode/packages/
cp libnode-skeleton package -r
fc-deploy.sh
rm -rf package
