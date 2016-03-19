# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# modify from Ubuntu 12.04 setting

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -CF --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# colorful prompt if possible
case "$TERM" in
xterm*|rxvt*|*-256color|*-color)
    if type __git_ps1 > /dev/null 2>&1 ; then
        PS1='\[\033[01;32m\]\t \[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
    else
        PS1='\[\033[01;32m\]\t \[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
    fi
    ;;
*)
    PS1='\u@\h:\w\$ '
    ;;
esac

# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[45;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline

# unbind the lock screen key
stty stop ''

# locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"

# some more aliases
## alias for existing commands
alias vi='vim'
alias cp='cp -aR'
alias chmod='chmod -R'
alias chown='chown -R'
alias wget='wget -np -c'
alias grep='LC_ALL=C grep'
alias indent='indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1'
## new aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias lm='ls -al |more'
alias fn='find . -name'
alias findn='find . -name'
alias apti='apt-fast install -y --force-yes'
alias rscp='rsync -av -P -e ssh'
alias tags='ctags; gtags'
alias tmux='tmux -2'
alias tmuxa='tmux attach'
alias tmuxt='tmux attach -t'
alias tmuxl='tmux ls'
alias tmuxs='tmux-session save'
alias tmuxr='tmux-session restore'
alias repoa='repo forall -c'
alias vim-plugin-install='vim +PluginInstall +PluginClean! +qall'
alias vim-plugin-update='vim +PluginUpdate +PluginClean! +qall'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

# for svn
export SVN_EDITOR=vim

# extend path variable
export PATH=$HOME/bin:$PATH

# for z.sh
if [ -f $HOME/bin/z.sh ]; then
    . $HOME/bin/z.sh
fi

for file in ~/.{bashrc.local,bashrc.private,bashrc.aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file
