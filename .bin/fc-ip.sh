#!/bin/bash

ifconfig | grep 10.121 | awk '{print $2}'
