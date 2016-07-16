#!/usr/bin/env bash

DOTFILES_PATH="$HOME/.dotfiles"
VIM_PATH="$HOME/.vim"
YCM_PATH="$VIM_PATH/plugged/YouCompleteMe"

# for VIM plugin YouCompleteMe
if [ -d $YCM_PATH ]; then
    printf '\rDo you want to re-compile ycmd? [Y/N]\n'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $YCM_PATH
        python ./install.py --clang-completer
    fi
fi

