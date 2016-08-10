#!/bin/bash

curl https://$NODE.backstage.spotme.com/api/v1/eid/$EID/nodehandlers/_flush_cache
if [ $WEBAPP_ENABLED = true ] ; then
    curl https://$NODE.backstage.spotme.com/api/v1/eid/$EID/appscripts/_flush_cache
fi
