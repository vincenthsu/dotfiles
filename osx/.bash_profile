if [ "$(uname -s)" == "Darwin" ]
then
    # colorful bash
    export CLICOLOR="xterm-color"
    export LSCOLORS="gxfxcxdxbxegedabagacad"

    # extend path variable
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
    export GEM_HOME=$HOME/.gem
    export PATH=$GEM_HOME/ruby/2.0.0/bin:$PATH

    # managed by homebrew
    if [ -f /usr/local/bin/brew ]; then
        # nvm
        export NVM_DIR=$HOME/.nvm
        source $(brew --prefix nvm)/nvm.sh
    fi

    # bash-completion
    for i in /usr/local/etc/bash_completion.d/* ; do
        source $i
    done
fi

source ~/.bashrc
