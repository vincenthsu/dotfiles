ssh -o ProxyCommand="$HOME/bin/git-proxy-gw.sh %h %p" $@
