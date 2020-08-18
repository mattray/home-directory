export GOPATH=$HOME/go
export RUSTPATH=$HOME/.cargo
export PATH+=/opt/chef-workstation/bin:$HOME/bin:/usr/local/go/bin:$GOPATH/bin

# Ignore commands starting with a space, duplicates, and a few others.
export HISTIGNORE="[ ]*:&:bg:fg:ls -l:ls -al:ls -la:ls1:lsa:lsr:gits:gits?"
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=200000
export HISTSIZE=200000
shopt -s histappend

export EDITOR=emacsclient
export GIT_EDITOR=$EDITOR
export HAB_ORIGIN=mattray

export AUTOMATE_URL='https://roberto.bottlebrush.sh'
export AUTOMATE_TOKEN='sYKAqcY2H30ns7RTq7jCHNQ5vKs='

umask 077

# emacs M-x shell
if [ "dumb" == "$TERM" ] ; then
    alias m='cat'
    alias less='cat'
    alias more='cat'
    export PAGER=cat
else
    alias l='less'
    alias m='more'
fi

# Some more alias to avoid making mistakes:
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cl='clear'

alias ls="exa -aF --color=always"
alias ls1="exa -1aF --color=always"
alias lsa="exa -aFl --color=always"
alias lsr="exa -aFl -s modified --color=always"

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
alias gitx="stree" # Atlassian's Sourcetree is a good replacement

alias gem_push="echo double check your permissions"
alias rspec="rspec --format documentation"

alias grep="grep --color=auto"

#show the file in OSX Finder
alias reveal="open -R"

#notification message
alias ndone='terminal-notifier -title DONE -message `date "+$?:%H:%M:%S"` >> /dev/null'

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-2.7

. ~/.creds

# Azure shell command completion
# source '/Users/mray/lib/azure-cli/az.completion'

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/mattray/ws/google-cloud-sdk/path.bash.inc' ]; then . '/Users/mattray/ws/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/mattray/ws/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/mattray/ws/google-cloud-sdk/completion.bash.inc'; fi

# export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

# replace the PS1
eval "$(starship init bash)"
