#!/bin/bash

ffmpeg -f x11grab  -s 3200x1800 -i :0.0 -r 25 -vcodec libx264  output.mkv

# ffmpeg -f pulse -i default -ac 2 -f x11grab -r 15 -s 3200x1800 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -threads 0 output.mkv
