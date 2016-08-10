#!/bin/bash

TYPE=$1
URL="$AUTH_DB/dbnode-ev-$EID/_design/victorinox/_view/query?startkey=[\"$(echo $TYPE)\"]&endkey=[\"$(echo $TYPE)\",{}]&include_docs=true"
curl -g -X GET $URL 2> /dev/null
