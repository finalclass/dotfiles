#!/bin/bash

bstg-versiocurl -s -L http://admin:rm@localhost/backstage/_design/backstage | tr , \\n | grep '\"version\":' | tr -d '"version":"' 
