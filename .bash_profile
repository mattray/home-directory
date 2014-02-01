#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/bin:/usr/bin:/usr/bin/X11:/sbin:/usr/sbin:$HOME/bin/packer-0.3.10
umask 077

export HISTCONTROL=ignoredups
export HISTFILESIZE=20000
export HISTSIZE=20000

# Ignore commands starting with a space, duplicates,
# and a few others.
export HISTIGNORE="[ ]*:&:bg:fg:ls -l:ls -al:ls -la:ls1:lsa:lsr:gits:gits?"

if [ "dumb" == "$TERM" ];
    then
    alias m='cat'
    alias more='cat'
    export PAGER=cat
    export TERM=xterm-color
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
alias ls="ls -AFG"
alias ls1='ls -AFG1'
alias lsa="ls -lAFG"
alias lsr="ls -lAFrtG"

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

#test-kitchen
#alias tk="kitchen"
#export KITCHEN_LOG='error'
#export OMNIBUS_INSTALL_URL='file:///root/chef/install.sh'

#notification message
alias ndone='/Applications/Utilities/terminal-notifier.app/Contents/MacOS/terminal-notifier -title ndone -message `date "+$?:%H:%M:%S"` >> /dev/null'

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

chruby ruby-1.9

#export PS1="\[\e[36m\]\u@\h\[\e[37m\][\A]\[\e[31m\]\$(chruby_version)\$(chgemsets)\[\e[37m\]\[\e[32m\]\$(clean_git_prompt)\[\e[33m\]\$(dirty_git_prompt)\[\e[34m\]\w\n\[\e[0m\]\$\[\e[0m\] "

. ~/.creds
