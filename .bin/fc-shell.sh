#!/bin/bash

SHELL_NAME=\"*term-`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`*\"
 # 
emacsclient -c -n -e '(progn (multi-term))'
