#!/bin/bash

NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

cd ~/Documents/backstage-app
nvm use 0.8
ulimit -n 4096
kanso push
