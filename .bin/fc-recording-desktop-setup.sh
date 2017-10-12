#!/bin/bash

xrandr \
    --output eDP1 --scale 0.4x0.4 --primary --mode 3200x1800 --pos 0x0 --rotate normal \
    --output VIRTUAL1 --off \
    --output DP1 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output DP2 --off
