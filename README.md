# dotfiles

manage your configurations by git

## Installation

    cd $HOME; git clone https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

if you behind a firewall

    export http_proxy=http://<Your proxy IP>
    cd $HOME; git clone --recursive https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

## Getting updates

    cd $HOME/.dotfiles; source update.sh

## Private settings

manage your private configurations in the private folder. update.sh will help to link them to $HOME directory.

    e.g.
    git clone <Your private git repo> $HOME/.dotfiles/private
    cd $HOME/.dotfiles; source update.sh

You could add a file named bashrc.local in "$HOME" folder or in "$HOME/.dotfiles/private" folder for your own bash definitions.

You could add a file named gitconfig.local in "$HOME" folder or in "$HOME/.dotfiles/private" folder for your own git definitions.

