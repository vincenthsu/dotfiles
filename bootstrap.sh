#!/usr/bin/env bash

if [ -d $HOME/.dotfiles ]; then
    if [ $(pwd) != $HOME/.dotfiles ]; then
        echo "$HOME/.dotfiles already exist."
        do_nothing=true
    else
        git pull origin master
    fi
else
    git clone --recursive git@bitbucket.org:vincenthsu/dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
fi

if [ $do_nothing ]; then
    unset do_nothing
else
    source update.sh
    if [ -f $HOME/.viminfo ]; then
        rm -rf $HOME/.viminfo
    fi
fi
