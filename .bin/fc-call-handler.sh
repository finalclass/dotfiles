#!/bin/bash

HANDLER=http://localhost.backstage.4pax.com/api/v1/eid/$EID/nodehandlers/$1

echo "Calling $HANDLER"

curl $HANDLER

# empty echo for a new line:
echo
