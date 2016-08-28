if [ "$(uname -s)" == "Darwin" ]
then
    # colorful bash
    export CLICOLOR="xterm-color"
    export LSCOLORS="gxfxcxdxbxegedabagacad"
    alias ls='ls -CF'
    alias grep='LC_ALL=C grep --color=auto'
    alias fgrep='LC_ALL=C fgrep --color=auto'
    alias egrep='LC_ALL=C egrep --color=auto'

    # extend path variable
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
    export GEM_HOME=$HOME/.gem
    export PATH=$GEM_HOME/ruby/2.0.0/bin:$PATH

    # nvm
    function loadnvm () {
        export NVM_DIR=$HOME/.nvm
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        [ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
    }

    # bash-completion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

source ~/.bashrc
