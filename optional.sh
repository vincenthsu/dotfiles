#!/usr/bin/env bash

VIM_PATH="$DOTFILES_PATH/link/.vim"
FONTS_PATH="$DOTFILES_PATH/fonts"

# for VIM plugin YouCompleteMe
if [ -d $VIM_ROOT/bundle/YouCompleteMe ]; then
    info 'Do you want to re-compile ycmd? [Y/N]'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $VIM_ROOT/bundle/YouCompleteMe
        ./install.sh --clang-completer
    fi
fi

# install powerline fonts
if [ -d $FONTS_PATH ]; then
    info 'Do you want to install powerline fonts? [Y/N]'
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        cd $FONTS_PATH
        ./install.sh
    fi
fi
