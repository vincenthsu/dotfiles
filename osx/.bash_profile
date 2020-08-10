if [ "$(uname -s)" == "Darwin" ]
then
    # colorful bash
    export CLICOLOR="xterm-color"
    export LSCOLORS="gxfxcxdxbxegedabagacad"
    alias ls='ls -CF'
    alias grep='LC_ALL=C grep --color=auto'
    alias fgrep='LC_ALL=C fgrep --color=auto'
    alias egrep='LC_ALL=C egrep --color=auto'

    # bash-completion
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    # hide the 'default interactive shell is now zsh' message
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

source ~/.bashrc
