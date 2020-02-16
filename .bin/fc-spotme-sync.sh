#!/bin/bash

DATE=`date`
cd $HOME/gdrive/spotme/
git commit -a -m "$DATE"
/home/sel/Documents/go/bin/drive push -hidden -no-prompt -ignore-name-clashes . 
