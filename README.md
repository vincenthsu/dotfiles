# dotfiles

manage your configurations by git

## Installation

    cd $HOME; git clone --recursive git@github.com:vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

if you behind a firewall

    export http_proxy=http://<Your proxy IP>
    cd $HOME; git clone --recursive https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

## Getting updates

    cd $HOME/.dotfiles; source update.sh


