#!/bin/bash

COOKIE_DEVNODE="_csrf=xcgdyilETC9HMND0t3P4NHIv; mp_f9d9b26e361fb1ab449bdd0840dd63a5_mixpanel=%7B%22distinct_id%22%3A%20%2216484de9c7c6f-03fec2e02d76ce-3b740c58-1fa400-16484de9c7d509%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; mp_b817dba0d0a18fb63764030a32ecdc7b_mixpanel=%7B%22distinct_id%22%3A%20%2216484decdb0100e-092c52ee2db5a8-3b740c58-1fa400-16484decdb110fb%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D; bstg_session=po9g8f0oHegiYcfs1UPlOWyawT8%253D*1541408212836*gWQ6OM9Rm6vDN4NHxnQCZHfiXWhRSJt8aezq7hnF2s4hpOuhJ6GG58obZQMFTwe2lGh1mO1d0CNNHS2wxdXBuxcs45XREK1qFlY7fsLlC7j7iJ7olibx0zlQdwKifyJCwVg6cqGxwKRkQPDbNcqikXdqLFEv5B%252BNm%252FxEW3iKupuR75zCv2kau8YWgEpbNGPV"
NODE_URL_DEVNODE="https://localhost.backstage.4pax.com"
EID="441bb6b87b7fd76c3948ca3c5d07acd9"

SCRIPT=$1
DATA=$2
curl "$NODE_URL/api/v1/events/$EID/appscripts/$SCRIPT" \
     -s \
     -H 'Pragma: no-cache' \
     -H "Origin: $NODE_URL" \
     -H 'Accept-Encoding: gzip, deflate, br' \
     -H 'Accept-Language: en-US,en;q=0.9,pl;q=0.8,ru;q=0.7,de;q=0.6,en-GB;q=0.5,nb;q=0.4' \
     -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36' \
     -H 'Content-Type: application/json;charset=UTF-8' \
     -H 'Accept: application/json, text/plain, */*' \
     -H 'Cache-Control: no-cache' \
     -H "Cookie: $COOKIE" \
     -H 'Connection: keep-alive' \
     --compressed \
     --insecure \
     --data-binary "{ \"params\": $DATA }"
echo 
