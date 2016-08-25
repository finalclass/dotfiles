#!/bin/bash

function dual-screen {
    xrandr \
        --output eDP1 --scale 1x1 --primary --mode 3200x1800 --pos 312x2160 --rotate normal \
        --output DP1 --scale 2x2 --mode 1920x1080 --pos 0x0 --rotate normal \
        --output HDMI2 --off \
        --output HDMI1 --off \
        --output VIRTUAL1 --off \
        --output DP2 --off
}

function single-screen {
    xrandr \
        --output eDP1 --primary --mode 3200x1800 --pos 0x0 --rotate normal \
        --output VIRTUAL1 --off \
        --output DP1 --off \
        --output HDMI2 --off \
        --output HDMI1 --off \
        --output DP2 --off
}

function detect {
    NUM_SCREENS=`xrandr | grep " connected" | wc -l`

    if [ $NUM_SCREENS -eq 2 ]; then
        dual-screen
    else
        single-screen
    fi
}

detect
