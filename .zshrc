# Used for setting user's interactive shell configuration and executing commands, will be read when starting as an interactive shell.
# For simplicity’s sake, you should use just one file. The common choice is .zshrc.

# https://www.emacswiki.org/emacs/TrampMode#h5o-9
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
# setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
# remove commandwhen the first character on the line is a space
setopt HIST_IGNORE_SPACE
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

umask 077

# emacs M-x shell
if [[ "dumb" == $TERM ]] ; then
  alias l='cat'
  alias less='cat'
  alias m='cat'
  alias more='cat'
  export PAGER=cat
  export TERM=xterm-256color
else
  alias l='less'
  alias m='more'
fi

 # Some more alias to avoid making mistakes:
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias cl='clear'
alias grep="grep --color=auto"

# ls/exa
alias ls="exa -aF --color=always"
alias ls1="exa -1aF --color=always"
alias lsa="exa -aFl --color=always"
alias lsr="exa -aFl -s modified --color=always"

# git
alias gitb="git branch" #list branches
alias gitco="git co" #checkout
alias gitd="git diff --patience --no-color" #diff
alias gitdc="git diff --cached" #diff original
alias gitdh="git diff HEAD"  #diff head
alias gitl="git log --oneline --decorate -20 --reverse" #just the last 20 logs
alias gitls="git log --stat --decorate -20 --reverse" #just the last 20 logs with stats
alias gitr="git checkout --" #revert
alias gits="git status -s" #short status
alias gits\?="git status -s | grep -v \?\?" #ignore unknowns
alias gitst="git status" #long status
alias gitus="git unstage" #unstage a change alias was set with 'git config --global alias.unstage "reset HEAD"'

export GIT_EDITOR=$EDITOR

# linux
if [[ $OSTYPE == "linux-gnu"* ]]; then
  export PATH=/opt/chef-workstation/bin:/opt/chef-workstation/embedded/bin:/usr/local/bin:$PATH
# macos
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Atlassian's Sourcetree is a good replacement
  alias gitx="stree"

  #show the file in OSX Finder
  alias reveal="open -R"

  #notification message
  alias ndone='terminal-notifier -title COMPLETED -message "`date`" -sound default >> /dev/null'

  . ~/.creds

  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

eval "$(starship init zsh)"
