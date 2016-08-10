#!/bin/bash

ID=$1
URL="$AUTH_DB/dbnode-ev-$EID/$ID"
curl -g -X GET $URL 2> /dev/null

