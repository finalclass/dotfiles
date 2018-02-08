#!/bin/bash

echo "killing $1"

ps aux | grep $1
ps aux | grep $1 | awk '{print $2}' | xargs kill -9
