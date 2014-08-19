#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
    if [ $(pwd) != $HOME/.dotfiles ]; then
        echo "$HOME/.dotfiles already exist."
        do_nothing=true
    else
        git pull origin master
    fi
else
    git clone --recursive https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
fi

if [ $do_nothing ]; then
    unset do_nothing
else
    source update.sh
    if [ -f $HOME/.viminfo ]; then
        rm -rf $HOME/.viminfo
    fi
    if [ -d $HOME/.vim/bundle/YouCompleteMe ]; then
        if [ ! -f $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
            cd $HOME/.vim/bundle/YouCompleteMe
            ./install.sh --clang-completer
        fi
    fi
fi
