#!/bin/bash

ps ax | grep $1 | awk '{print $1;}' | xargs kill -9 2> /dev/null
