#!/bin/bash

# Start a new tmux session named "tmux"
tmux new-session -d -s tmux

# Rename the first window to "vim" and start vim inside it
tmux rename-window -t tmux:1 'vim'
tmux send-keys -t tmux:1 'vim' C-m

# Create a new window named "cmd"
tmux new-window -t tmux -n 'vim'

# Attach to the created tmux session
tmux attach-session -t tmux
