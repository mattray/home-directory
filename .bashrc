export GOPATH=$HOME/go
export RUSTPATH=$HOME/.cargo
export PATH=$HOME/bin:/usr/local/go/bin:$GOPATH/bin:$RUSTPATH/bin:$PATH

umask 077

# Ignore commands starting with a space, duplicates, and a few others.
export HISTIGNORE="[ ]*:&:bg:fg:ls -l:ls -al:ls -la:ls1:lsa:lsr:gits:gits?"
export HISTCONTROL=ignoredups
export HISTFILESIZE=200000
export HISTSIZE=200000

# emacs M-x shell
if [ "dumb" == "$TERM" ] ; then
    alias m='cat'
    alias less='cat'
    alias more='cat'
    export PAGER=cat
    export TERM=xterm-color
else
    alias l='less'
    alias m='more'
fi

export EDITOR=emacsclient
alias emacs='emacsclient -n'

# Some more alias to avoid making mistakes:
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cl='clear'

alias ls="ls -AFG"
alias ls1='ls -AFG1'
alias lsa="ls -lAFG"
alias lsr="ls -lAFrtG"

alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff --patience --no-color" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -20 --reverse" #just the last 20 logs
alias gitls="git log --stat --decorate -20 --reverse" #just the last 20 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gits?="git status -s | grep -v \?\?" #ignore unknowns
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

export GIT_EDITOR="`which emacsclient` $EMACS_SERVER_FILE"

alias gem_push="echo double check your permissions"
alias rspec="rspec --format documentation"

alias grep="grep --color=auto"

#show the file in OSX Finder
alias reveal="open -R"

#notification message
alias ndone='/Applications/Utilities/terminal-notifier.app/Contents/MacOS/terminal-notifier -title DONE -message `date "+$?:%H:%M:%S"` >> /dev/null'

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

source /usr/local/share/chruby/chruby.sh

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
    git_dirty && echo "(${branch}*)"
}

function clean_git_prompt {
    branch=`git_branch`
    if [ -z "${branch}" ] ; then
        return
    fi
    git_dirty || echo "(${branch})"
}

function ruby_version_gemset {
    ruby_version=$(chruby | grep \* | cut -d'-' -f 2)
    chgemset_name=$(echo $GEM_HOME | awk '{split($0,a,"/.gem"); print a[1]}' | awk -F/ '{print $NF}')
    if [ -z "$ruby_version" ] ; then # no chruby, must be system
        if [ -z "$chgemset_name" ] ; then
            echo "SYSTEM"
        else
            echo "SYSTEM-${chgemset_name}"
        fi
    else
        if [ $USER = $chgemset_name ] ; then
            echo "${ruby_version}"
        else
            echo "${ruby_version}-${chgemset_name}"
        fi
    fi
}

gemset () {
    pwd
    if [ $SHLVL -ne 1 ] ; then
        echo "Exiting gemset $GEM_HOME"
        exit
    fi
    mkdir -p ~/.chgems/"${1}"
    chgems ~/.chgems/"${1}"
}

alias gemset_list="ls -1 ~/.chgems/"

export PS1="\[\e[36m\]\u@\h\[\e[37m\][\A]\[\e[31m\]\$(ruby_version_gemset)\[\e[32m\]\$(clean_git_prompt)\[\e[33m\]\$(dirty_git_prompt)\[\e[34m\]\w\n\[\e[37m\]\$\[\e[0m\] "
