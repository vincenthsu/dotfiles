" Define Configuration variables
if filereadable(glob("~/.vimrc.inc")) 
    source ~/.vimrc.inc
endif

source ~/.vim/vimrc

" Override default configurations
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
