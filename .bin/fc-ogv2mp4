#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: fc-ogv2mp4.sh filename.ogv"
    exit 1
fi

OUTPUT_FILE=${1%.*}
echo $OUTPUT_FILE

ffmpeg -i $1 \
       -c:v libx264 -preset veryslow -crf 22 \
       -c:a libmp3lame -qscale:a 2 -ac 2 -ar 44100 \
       $OUTPUT_FILE.mp4
