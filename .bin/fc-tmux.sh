#!/bin/bash

cd ~/Documents
tmux new-session -d -s sys
tmux rename-window system
tmux select-window -t sys:0
tmux split-window -v
tmux resize-pane -U 20
tmux select-pane -U
tmux split-window -h
tmux select-pane -R
tmux -2 attach-session -t sys

