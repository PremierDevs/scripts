#!/bin/bash

#Session Name
session="Docker"

# start new session with $session as name.
tmux new-session -d -s $session

# Name firest Window and start Zsh
tmux rename-window -t 0 'Main'
tmux send-keys -t 'Main' 'zsh' C-m 'clear' C-m

# split window tmux split-window -h
tmux  \split-window -v \; \split-window -h \; \select-pane -t 0 \; \split-window -h
