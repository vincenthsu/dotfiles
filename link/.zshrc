#
# Zi Initialzion
#
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal

#
# Annex
#
zi light-mode for z-shell/z-a-meta-plugins @annexes+rec

#
# OMZ
#
zi snippet OMZL::history.zsh
zi snippet OMZL::key-bindings.zsh
zi snippet OMZL::theme-and-appearance.zsh
zi snippet OMZL::git.zsh
zi ice lucid wait
zi snippet OMZP::git
zi cdclear -q
setopt promptsubst
zi snippet OMZT::agnoster

#
# Plugins
#
zi ice lucid wait as'completion'
zi light zsh-users/zsh-completions
zi lucid light-mode for \
    zsh-users/zsh-autosuggestions \
    z-shell/F-Sy-H \
    z-shell/H-S-MW \
    pick"z.sh" z-shell/z

#
# Programs
#
zi ice from'gh-r' as'program'
zi light @junegunn/fzf

#
# Locale
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#
# Some more aliases
#
alias apti='apt-fast install -y --force-yes'
alias cmr='chmod -R'
alias cor='chown -R'
alias cpr='cp -aR'
alias fn='find . -name'
alias findn='find . -name'
alias gr='grep -irn'
alias grepr='grep -irn'
alias indent='indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1'
alias l='ls'
alias la='ls -A'
alias ll='ls -al'
alias lm='ls -al |more'
alias netstatp='netstat -lptun'
alias repoa='repo forall -c'
alias rscp='rsync -av -P -e ssh'
alias tmux='tmux -2'
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

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
