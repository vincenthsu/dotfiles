# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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
    alias ls='ls -CF --color=auto'
    alias grep='LC_ALL=C grep --color=auto'
    alias fgrep='LC_ALL=C fgrep --color=auto'
    alias egrep='LC_ALL=C egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some more aliases
alias grepr='grep -irn'
alias gr='grep -irn'
alias l='ls'
alias ll='ls -al'
alias la='ls -A'
alias lm='ls -al |more'
alias chmod='chmod -R'
alias chown='chown -R'
alias cp='cp -aR'
alias indent='indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1'
alias vi='vim'
alias wget='wget -np -c'
alias apti='apt-fast install -y --force-yes'
alias fn='find . -name'
alias findn='find . -name'
alias repoa='repo forall -c'
alias rscp='rsync -av -P -e ssh'
alias tmux='tmux -2'
alias tmuxa='tmux attach'
alias tmuxt='tmux attach -t'
alias tmuxl='tmux ls'
alias tmuxs='tmux-session save'
alias tmuxr='tmux-session restore'
alias vim-plugin-install='vim +PlugUpdate +PlugClean! +qall'
alias vim-plugin-update='vim +PlugUpgrade +PlugUpdate +PlugClean! +qall'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# unbind the lock screen key
stty stop ''

# locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"

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
    [ -r "$file" ] && source "$file"
done
unset file

