#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"
set -e
echo ''

info () {
    printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

link_files () {
    ln -s $1 $2
    success "linked $1 to $2"
}

overwrite_branch () {
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        git add .
        git commit -a -m "xxx"
        git branch -m xxx
        git checkout -b master origin/master
        git branch -D xxx
        success "\noverwrited git branch\n"
    else
        fail "\ndo nothing\n"
    fi
}

update_dotfiles () {
    info 'updating dotfiles'
    ret=0

    git status | ( grep -e "Changes not staged for commit" -e "Changes to be committed" ) || ret=$?
    if [ $ret -eq 0 ]
    then
        user "Changes need to be committed!!\nDo you want to overwrite current git branch? [Y/N]"
        overwrite_branch
    fi

    git pull origin master | ( grep "CONFLICT" ) || ret=$?
    if [ $ret -eq 0 ]
    then
        user "Conflict!!\nDo you want to overwrite current git branch? [Y/N]"
        overwrite_branch
    fi

    git submodule foreach --recursive git fetch origin
    git submodule update --init --recursive
}

install_dotfiles () {
    info 'installing dotfiles'
    overwrite_all=false
    backup_all=false
    skip_all=false

    for src in `find $1 -maxdepth 1 -mindepth 1`
    do
    dst="$2/`basename \"${src}\"`"
        if [ -f $dst ] || [ -d $dst ] || [ -L $dst ]
        then
            overwrite=false
            backup=false
            skip=false

            if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
            then
                user "File already exists: `basename $src`, \nWhat do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action
                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac
            fi

            if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
            then
                rm -rf $dst
                success "removed $dst"
            fi

            if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
            then
                mv $dst $dst\.backup
                success "moved $dst to $dst.backup"
            fi

            if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
            then
                link_files $src $dst
            else
                success "skipped $src"
            fi
        else
            link_files $src $dst
        fi
    done
}

update_dotfiles
install_dotfiles $DOTFILES_ROOT/link $HOME

# for Mac
if [ "$(uname -s)" == "Darwin" ]
then
    install_dotfiles $DOTFILES_ROOT/osx $HOME
fi

vim +BundleInstall +BundleClean +helptags\ ~/.vim/doc +qall

source ~/.bashrc
