#!/usr/bin/env bash

VIM_PATH="$DOTFILES_PATH/link/.vim"
FONTS_PATH="$DOTFILES_PATH/fonts"

# for VIM plugin YouCompleteMe
if [ -d $VIM_PATH/bundle/YouCompleteMe ]; then
    if [ ! -f $VIM_PATH/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
        cd $VIM_PATH/bundle/YouCompleteMe
        ./install.sh --clang-completer
    fi
fi

# install powerline fonts
cd $FONTS_PATH
./install.sh
