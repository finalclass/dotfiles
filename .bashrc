#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias skype="apulse32 skype"

source ~/.bin/git-completion.bash
source ~/.bin/git-prompt.sh
source ~/.bin/fc-variables.sh

export NVM_DIR="/home/sel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=$PATH:~/.bin
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

