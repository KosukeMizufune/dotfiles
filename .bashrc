alias ls='ls -FG'
alias ll='ls -alFG'
alias env1="source /Users/kosuke/研究/code/env1/bin/activate"
alias jupyter="jupyter notebook"
source /usr/local/Cellar/git/2.12.2/etc/bash_completion.d/git-completion.bash
source /usr/local/Cellar/git/2.12.2/etc/bash_completion.d/git-prompt.sh
if [ $UID -eq 0 ]; then
     PS1="\n\[\033[31m\]\t \w\[\033[00m\]$(__git_ps1 " \[\033[36m\](%s)\[\033[00m\]")\n> "
else
     PS1="\n\[\033[36m\]\t \w\[\033[00m\]$(__git_ps1 " \[\033[31m\](%s)\[\033[00m\]")\n> "
fi
