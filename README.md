# dotfiles

manage your configurations by git

## Installation

    cd $HOME; git clone https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

if you behind a firewall

    export http_proxy=http://<Your proxy IP>
    cd $HOME; git clone --recursive https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

## Getting updates

    cd $HOME/.dotfiles; source update.sh

## Private date
    
    You can manage your private configuration in the private fold. update.sh will create links for them.

    git clone <Your private git repo> $HOME/.dotfiles/private
    cd $HOME/.dotfiles; source update.sh
