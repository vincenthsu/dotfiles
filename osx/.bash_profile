if [ "$(uname -s)" == "Darwin" ]
then
    # colorful bash
    export CLICOLOR="xterm-color"
    export LSCOLORS="gxfxcxdxbxegedabagacad"

    # extend path variable
    export PATH=/usr/local/bin:$PATH
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
fi

if [ -f ~/.git-completion.bash ] || [ -L ~/.git-completion.bash ]
then
    source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ] || [ -L ~/.git-prompt.sh ]
then
    source ~/.git-prompt.sh
fi
source ~/.bashrc
