SESSION=$(basename "$(pwd)")
START_DIR="$(pwd)"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION
    tmux rename-window -t $SESSION:1 "zsh"
    tmux new-window -t $SESSION:2
    tmux rename-window -t $SESSION:2 "nvim"
    sleep 0.2

    tmux send-keys -t $SESSION:2 "cd $START_DIR && nvim ." C-m
fi

tmux attach-session -t $SESSION
