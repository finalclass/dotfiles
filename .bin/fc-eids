#!/bin/bash

. resty

resty $AUTH_DB/db4p-ds 2> /dev/null

GET /_all_docs |
    jsawk "return this.rows" |
    jsawk -a 'return this.join("\n")' "return this.id" |
    grep -v '^_'
    

