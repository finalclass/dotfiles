#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color'
alias skype="skype"
alias dc="docker-compose"

source ~/.bin/git-completion.bash
source ~/.bin/git-prompt.sh
source ~/.bin/fc-variables.sh

export NVM_DIR="/home/sel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=$PATH:~/.bin:~/Documents/go/bin:~/AppImages
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'

source ~./.private.sh
alias docker-cloud="docker run -it -e DOCKERCLOUD_USER=$DOCKERCLOUD_USER -e DOCKERCLOUD_PASS=$DOCKERCLOUD_PASS --rm dockercloud/cli"
