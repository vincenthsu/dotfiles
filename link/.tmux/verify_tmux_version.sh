#!/bin/bash

verify_tmux_verision () {
    tmux_home=~/.tmux
    tmux_version="$(tmux -V | cut -c 6-)"

    if [[ $(echo "$tmux_version >= 2.1" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/tmux_2.1_up.conf"
        exit
    elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
        tmux source-file "$tmux_home/tmux_1.9_to_2.1.conf"
        exit
    else
        echo "1.8-"
        tmux source-file "$tmux_home/tmux_1.9_down.conf"
        exit
    fi
}

verify_tmux_verision
