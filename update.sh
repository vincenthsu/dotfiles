#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"
set -e
echo ''

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

warn () {
    printf "\r  [ \033[0;31m!!\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1 "
}

success () {
    printf "\r  [ \033[0;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

overwrite_branch () {
    read -n 1 action
    if [ "$action" == "y" ] || [ "$action" == "Y" ]
    then
        info "wait for overwriting..."
        git add .
        git commit -a -m "tmp commit"
        git branch -m tmp-xxx-812
        git checkout -b master origin/master
        git branch -D tmp-xxx-812
        success "checkout to origin/master"
    else
        fail "do nothing"
    fi
}

link_files () {
    ln -s $1 $2
    success "linked $1 to $2"
}

copy_files () {
    cp -a $1 $2
    success "copy $1 to $2"
}

update_dotfiles () {
    info 'updating dotfiles'
    ret=0

    git status | ( grep "Changes" ) && ret=1
    if [ $ret -eq 1 ]
    then
        warn "Changes are not committed!"
        user "Do you want to overwrite current git branch? [Y/N]"
        overwrite_branch
    fi

    ret=0
    git fetch origin
    git merge origin/master | grep "CONFLICT" && ret=1
    if [ $ret -eq 1 ]
    then
        warn "Conflict!"
        user "Do you want to overwrite current git branch? [Y/N]"
        overwrite_branch
    fi
    unset ret

    git submodule foreach --recursive git fetch origin
    git submodule update --init --recursive
}

install_dotfiles () {
    info 'installing dotfiles'
    overwrite_all=false
    backup_all=false
    skip_all=false
    is_link=$3

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
                if [ "$is_link" == "1" ] 
                then
                    link_files $src $dst
                else
                    copy_files $src $dst
                fi
            else
                success "skipped $src"
            fi
        else
            if [ "$is_link" == "1" ] 
            then
                link_files $src $dst
            else
                copy_files $src $dst
            fi
        fi
    done
}

update_dotfiles
install_dotfiles $DOTFILES_ROOT/link $HOME 1
install_dotfiles $DOTFILES_ROOT/copy $HOME 0
chmod 400 $HOME/.ssh/id_*

# for Mac
if [ "$(uname -s)" == "Darwin" ]
then
    install_dotfiles $DOTFILES_ROOT/osx $HOME
fi

vim +BundleInstall +BundleClean +helptags\ ~/.vim/doc +qall

source ~/.bashrc
