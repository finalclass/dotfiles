#!/bin/bash

curl -X DELETE $AUTH_DB/dbnode-ev-$1
curl -X DELETE $AUTH_DB/dbnode-evinq-$1

REV=`curl -s $AUTH_DB/db4p-ds/$1 | jsawk "return this._rev"`
curl -X DELETE $AUTH_DB/db4p-ds/$1?rev=$REV

