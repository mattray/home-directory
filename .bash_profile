#This file is sourced by bash when you log in interactively.
#[ -f ~/.bashrc ] && . ~/.bashrc

export SVN_EDITOR=emacsclient

export GITHOME=/usr/local/git

export PATH=$HOME/bin:$MYSQL/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:/usr/X11R6/bin/:$GITHOME/bin

umask 077

export HISTCONTROL=ignoredups
export HISTFILESIZE=2000
export HISTSIZE=2000

if [ "dumb" == "$TERM" ];
    then
    alias ls="ls -AF";
    alias lsa="ls -lAF";
    alias lsr="ls -lAFrt";
    alias m='cat';
    alias more='cat';
    export PAGER=cat
else
    alias ls="ls -AFG";
    alias lsa="ls -lAFG";
    alias lsr="ls -lAFrtG";
    alias m='more'
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'
fi

export EDITOR=emacsclient
alias emacs='emacsclient -n "$@" &'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias cl='clear'
alias l='less'
alias ls1='ls -1'

alias curl="curl -sLO"

alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -5" #just the last 5 logs
alias gitls="git log --stat --decorate -5" #just the last 5 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gits?="git status -s | grep -v \?\?" #ignore unknowns
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

alias svns="svn status | sort"
alias svnu="svn update"
alias svnd="svn diff"

alias grep="grep --color=auto"

#show the file in OSX Finder
alias reveal="open -R"

alias finds="find . -type f | grep -v .svn | grep -v .git"

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

parse_git_branch() {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h[\$(date +%H:%M)]\$(parse_git_branch) \w\n\$ "
export rvm_cd_complete_flag=1
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

