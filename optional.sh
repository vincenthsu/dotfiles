#!/usr/bin/env bash

DOTFILES_PATH="$HOME/.dotfiles"
FONTS_PATH="$DOTFILES_PATH/fonts"
VIM_PATH="$HOME/.vim"
YCM_PATH="$VIM_PATH/plugged/YouCompleteMe"

# for VIM plugin YouCompleteMe
if [ -d $YCM_PATH ]; then
    printf '\rDo you want to re-compile ycmd? [Y/N]\n'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $YCM_PATH
        ./install.sh --clang-completer
    fi
fi

# install powerline fonts
if [ -d $FONTS_PATH ]; then
    printf '\rDo you want to install powerline fonts? [Y/N]\n'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $FONTS_PATH
        ./install.sh
    fi
fi
