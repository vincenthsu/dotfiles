# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

## set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

## uncomment for a colored prompt, if the terminal has the capability; turned
## off by default to not distract the user: the focus in a terminal window
## should be on the output of commands, not on the prompt
##force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#        # We have color support; assume it's compliant with Ecma-48
#        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#        # a case would tend to support setf rather than setaf.)
#        color_prompt=yes
#    else
#        color_prompt=
#    fi
#fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#    xterm*|rxvt*)
#        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#        ;;
#    *)
#        ;;
#esac

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# colorful man page
if command -v less &> /dev/null ; then
    export PAGER="`which less` -s"
    export BROWSER="$PAGER"
    export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
    export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
    export LESS_TERMCAP_me=$'\E[0m'           # end mode
    export LESS_TERMCAP_so=$'\E[45;5;246m'    # begin standout-mode - info box
    export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
    export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'           # end underline
fi

# some more ls aliases
alias apti='apt-fast install -y --force-yes'
alias chmodr='chmod -R'
alias chownr='chown -R'
alias cpr='cp -aR'
alias findn='find . -name'
alias grepr='grep -irn'
alias indent='indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1'
alias l='ls'
alias la='ls -A'
alias ll='ls -al'
alias llt='ls -altr'
alias lm='ls -al | more'
alias netstata='netstat -alnptu'
alias repoa='repo forall -c'
alias rscp='rsync -av -P -e ssh'
# tmux: -2: 256 color, -u: utf-8
alias tmux='tmux -2 -u'
alias tmuxa='tmux attach'
alias tmuxl='tmux ls'
alias tmuxr='tmux-session restore'
alias tmuxs='tmux-session save'
alias tmuxt='tmux attach -t'
alias vi='vim'
alias vim-plugin-install='vim +PlugUpdate +PlugClean! +qall'
alias vim-plugin-update='vim +PlugUpgrade +PlugUpdate +PlugClean! +qall'
alias wget='wget -np -c'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"
#export LANGUAGE="en_US:en"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# svn
export SVN_EDITOR=vim

# z.sh
[ -f ~/bin/z.sh ] && source ~/bin/z.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash && command -v ag >/dev/null 2>&1 && export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# local definitions
for file in ~/.{bashrc.local,bashrc.private,bashrc.aliases}; do
    [ -r "$file" ] && . "$file"
done
unset file

