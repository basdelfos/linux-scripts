#!/bin/bash

RESULT="$(tmux ls | grep -v attached)"

if [ ! -n "$RESULT" ]; then
    # No sessions, create new session
    # One or more sessions, all attached, create new session
    tmux
else
    # One ore more detached sessions, ask for which session to attach
    echo "[*] There are detached tmux sessions, which one do you want to attach to?"

    tmux ls
    echo
    read -p "Session number (or 'c' to create new session)? " OPTION

    if [[ "$OPTION" == "" || "$OPTION" == "c" ]]; then
        tmux
    else
        tmux attach -t $OPTION
    fi
fi
