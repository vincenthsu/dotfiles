# dotfiles

manage your configurations by git

## Installation

    cd $HOME; git clone https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

if you behind a firewall

    export http_proxy=http://<Your proxy IP>
    cd $HOME; git clone https://github.com/vincenthsu/dotfiles.git $HOME/.dotfiles; cd .dotfiles; source bootstrap.sh

## Getting updates

    cd $HOME/.dotfiles; source update.sh

## Private settings

manage your private configurations in the .dotfiles/private/link folder. update.sh will create symbolic links for them to $HOME directory. for example:

    git clone <Your private git repo> $HOME/.dotfiles/private
    cd $HOME/.dotfiles; source update.sh

Add files named bashrc.local/git.local in "$HOME" folder or in "$HOME/.dotfiles/private/link" folder for custom definitions.

## Powerline fonts

Get pre-patched fonts from:

* [Input](http://input.fontbureau.com)
* [Hack](http://sourcefoundry.org/hack/)
* [rissimpkins/codeface](https://github.com/chrissimpkins/codeface)
