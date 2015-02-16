if [ "$(uname -s)" == "Darwin" ]
then
    # colorful bash
    export CLICOLOR="xterm-color"
    export LSCOLORS="gxfxcxdxbxegedabagacad"

    # extend path variable
    export PATH=/usr/local/bin:$PATH
    export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

    # bash-completion
    for i in /usr/local/etc/bash_completion.d/* ; do
        source $i
    done
fi

source ~/.bashrc
