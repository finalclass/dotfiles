#!/bin/bash

rm -rf build/production
mkdir -p build/production

source ~/.nvm/nvm.sh
nvm use 0.10

npm install
npm run build:prod

npm run deploy:prod -- https://cloudadmin:nHNq90sTpn38kbHvksQs@staging.4pax.com:443/webapp
