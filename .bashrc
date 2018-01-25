alias ls='ls -FG'
alias ll='ls -alFG'
alias env1="source ~/研究/code/env1/bin/activate"
alias jupyter="jupyter notebook"
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='\n\[\033[36m\]\t \w\[\033[00m\]\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '
