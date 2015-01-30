#!/usr/bin/env bash

DOTFILES_REPO="https://github.com/vincenthsu/dotfiles.git"
DOTFILES_PATH="$HOME/.dotfiles"

if [ -d $DOTFILES_PATH ]; then
    if [ $(pwd) != $DOTFILES_PATH ]; then
        echo "$DOTFILES_PATH already exist."
        do_nothing=true
    else
        git pull origin master
    fi
else
    git clone --recursive $DOTFILES_REPO $DOTFILE_PATH
    cd $DOTFILES_PATH
fi

if [ $do_nothing ]; then
    unset do_nothing
else
    ./update.sh
    # for VIM
    if [ -f $HOME/.viminfo ]; then
        rm -rf $HOME/.viminfo
    fi
fi

