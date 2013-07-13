#This file is sourced by bash when you log in interactively.
#[ -f ~/.bashrc ] && . ~/.bashrc

export SVN_EDITOR=emacsclient

export GITHOME=/usr/local/git

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:/usr/X11R6/bin:$GITHOME/bin:/usr/texbin

umask 077

export HISTCONTROL=ignoredups
export HISTFILESIZE=20000
export HISTSIZE=20000

# Ignore commands starting with a space, duplicates,
# and a few others.
export HISTIGNORE="[ ]*:&:bg:fg:ls -l:ls -al:ls -la:ls1:lsa:lsr:gits:gits?"


if [ "dumb" == "$TERM" ];
    then
    alias m='cat';
    alias more='cat';
    export PAGER=cat;
    export TERM="xterm-color"
else
    alias m='more'
fi

export EDITOR=emacsclient
alias emacs='emacsclient -n'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias cl='clear'
alias l='less'
alias ls="ls -AFG";
alias ls1='ls -AFG1'
alias lsa="ls -lAFG";
alias lsr="ls -lAFrtG";

alias gem_push="echo double check your permissions"
alias rspec="rspec --format documentation"

alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff --patience" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -20" #just the last 20 logs
alias gitls="git log --stat --decorate -20" #just the last 20 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gits?="git status -s | grep -v \?\?" #ignore unknowns
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

export GIT_EDITOR="`which emacsclient` $EMACS_SERVER_FILE"

alias svns="svn status | sort"
alias svnu="svn update"
alias svnd="svn diff"

alias grep="grep --color=auto"

#show the file in OSX Finder
alias reveal="open -R"

#alias finds="find . -type f | grep -v .svn | grep -v .git"
alias finds="echo use tree"

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

function git_branch {
    git branch --no-color 2> /dev/null | egrep '^\*' | sed -e 's/^* //'
}

function git_dirty {
  # only tracks modifications, not unknown files needing adds
    if [ -z "`git status -s | awk '{print $1}' | grep '[ADMTU]'`" ] ; then
        return 1
    else
        return 0
    fi
}

function dirty_git_prompt {
    branch=`git_branch`
    if [ -z "${branch}" ] ; then
        return
    fi
    git_dirty && echo "(${branch})"
}

function clean_git_prompt {
    branch=`git_branch`
    if [ -z "${branch}" ] ; then
        return
    fi
    git_dirty || echo "(${branch})"
}

#export PS1="\u@\h[\$(date +%H:%M)]\$(git_branch) \w\n\$ "
export PS1="\[\e[34m\]\u@\h\[\e[37m\][\$(date +%H:%M)]\[\e[36m\]\$(clean_git_prompt)\[\e[33m\]\$(dirty_git_prompt)\[\e[37m\]\w\n\[\e[0m\]\$ "
export rvm_cd_complete_flag=1
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

. ~/.creds
rvm 1.9.3

export KITCHEN_LOG='DEBUG'
