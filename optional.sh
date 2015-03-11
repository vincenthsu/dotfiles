#!/usr/bin/env bash

DOTFILES_PATH="$HOME/.dotfiles"
VIM_PATH="$HOME/.vim"
FONTS_PATH="$DOTFILES_PATH/fonts"

# for VIM plugin YouCompleteMe
if [ -d $VIM_PATH/bundle/YouCompleteMe ]; then
    printf '\rDo you want to re-compile ycmd? [Y/N]\n'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $VIM_PATH/bundle/YouCompleteMe
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
