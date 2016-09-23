#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: fc-wma2wav.sh filename.wma"
    exit 1
fi

OUTPUT_FILE=${1%.*}
echo $OUTPUT_FILE

ffmpeg -i $1 $OUTPUT_FILE.wav
