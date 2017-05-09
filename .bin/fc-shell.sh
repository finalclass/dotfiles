#!/bin/bash

SHELL_NAME=\"*shell-`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`*\"

emacsclient -c -n -e "(progn (shell $SHELL_NAME) (delete-other-windows))"
